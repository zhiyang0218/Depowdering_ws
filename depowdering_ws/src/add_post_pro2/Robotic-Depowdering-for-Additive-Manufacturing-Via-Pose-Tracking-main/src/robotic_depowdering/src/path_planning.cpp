#include <iostream>
#include <ros/ros.h>
#include <pcl/point_types.h>
#include <pcl/common/common.h>
#include <pcl/search/kdtree.h>
#include <pcl/common/centroid.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/filters/crop_box.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/statistical_outlier_removal.h>

#include <std_msgs/Float64.h>
#include <sensor_msgs/PointCloud2.h>
#include <message_filters/subscriber.h>
#include <message_filters/time_synchronizer.h>
#include <message_filters/sync_policies/approximate_time.h>

#include "utils.hpp"

typedef pcl::PointCloud<pcl::PointXYZ> pointcloud;
typedef pcl::PointCloud<pcl::PointXYZ>::Ptr PcPtr;
typedef pcl::search::KdTree<pcl::PointXYZ>::Ptr TreePtr;
typedef message_filters::sync_policies::ApproximateTime<sensor_msgs::PointCloud2, sensor_msgs::PointCloud2> MySyncPolicy;
typedef message_filters::Synchronizer<MySyncPolicy> Sync;

class PathPlanner{
protected:
    ros::NodeHandle nh;
    boost::shared_ptr<Sync> my_sync;
    ros::Subscriber subDepowderingProgress;
    ros::Publisher pubPath, pubCAD, pubScan;
    message_filters::Subscriber<sensor_msgs::PointCloud2> CAD_subscriber;
    message_filters::Subscriber<sensor_msgs::PointCloud2> scan_subscriber;

    PcPtr waypoints, cloudCAD, cloudScan;
    TreePtr tree{new pcl::search::KdTree<pcl::PointXYZ>};
    pcl::StatisticalOutlierRemoval<pcl::PointXYZ> statisticalFilter; 
    
    double depowderingProgress = 0.0;
    double waypointSafetyDist1, waypointSafetyDist2;
    
    void getParams();
    void publishTopics();
    float findHighestHeight(const PcPtr& scan);
    std::vector<float> findScanBoundary(const PcPtr& scan);
    PcPtr generateZigZagPath(const PcPtr& cloudCAD, const PcPtr& cloudScan);
    PcPtr generateCircularPath(const PcPtr& cloudCAD, const PcPtr& cloudScan);
    std::vector<PcPtr> segmentPowdersAndObject(const PcPtr& cloudCAD, const PcPtr& cloudScan);
    void cloudCallback(const sensor_msgs::PointCloud2ConstPtr pc1, const sensor_msgs::PointCloud2ConstPtr pc2);
    void progressCallback(const std_msgs::Float64 progressMsgs);
public:
    PathPlanner();
    void run(); 
};

PathPlanner::PathPlanner(): 
cloudCAD(new pointcloud), 
cloudScan(new pointcloud),
CAD_subscriber(nh, "/camera/icp_tracker/CAD", 5),
scan_subscriber(nh, "/camera/icp_tracker/scan", 5)
{
    this->getParams();
    // Subscribe to cloudCAD and cloudScan at the same time
    this->my_sync.reset(new Sync(MySyncPolicy(5), this->CAD_subscriber, this->scan_subscriber));
    this->my_sync->registerCallback(boost::bind(&PathPlanner::cloudCallback, this, _1, _2)); 
    this->pubCAD = this->nh.advertise<sensor_msgs::PointCloud2>("path_planning/CAD", 1);
    this->pubPath = this->nh.advertise<sensor_msgs::PointCloud2>("path_planning/path", 2);
    this->pubScan = this->nh.advertise<sensor_msgs::PointCloud2>("path_planning/scan", 1);
    this->subDepowderingProgress = this->nh.subscribe("/camera/icp_tracker/progress", 1, &PathPlanner::progressCallback, this);

    this->statisticalFilter.setMeanK(30);
    this->statisticalFilter.setStddevMulThresh(0.3);
}

void PathPlanner::getParams()
{
    ros::param::get("waypointSafetyDist1_cm", waypointSafetyDist1);
    ros::param::get("waypointSafetyDist2_cm", waypointSafetyDist2);
}

float PathPlanner::findHighestHeight(const PcPtr& cloud)
{
    pcl::PointXYZ minPt, maxPt;
    pcl::getMinMax3D(*cloud, minPt, maxPt);
    return maxPt.z;
}

std::vector<float> PathPlanner::findScanBoundary(const PcPtr& scan)
{
    pcl::PointXYZ minPt, maxPt;
    pcl::getMinMax3D(*scan, minPt, maxPt);
    std::vector<float> corners = {minPt.x+2.0f, maxPt.x-2.0f, minPt.y+2.0f, maxPt.y-2.0f};
    return corners;
}

std::vector<PcPtr> PathPlanner::segmentPowdersAndObject(const PcPtr& cloudCAD, const PcPtr& cloudScan)
{
    int numNeighbors = 1;
    std::vector<int> nnIndices(numNeighbors);
    std::vector<float> nnDists(numNeighbors);
    std::vector<int> powderSegmentIndices, objectSegmentIndices;
    PcPtr object(new pointcloud);
    PcPtr powders(new pointcloud);

    // Get powder segment.
    this->tree->setInputCloud(cloudCAD);
    for(size_t i = 0; i < cloudScan->size(); ++i)
    {
        this->tree->nearestKSearch(cloudScan->points[i], numNeighbors, nnIndices, nnDists);
        float dist = std::sqrt(nnDists[numNeighbors - 1]);
        if(dist > 1.0)
            powderSegmentIndices.push_back(i);
        else
            objectSegmentIndices.push_back(nnIndices[numNeighbors-1]);
    }
    pcl::copyPointCloud(*cloudCAD, objectSegmentIndices, *object);
    pcl::copyPointCloud(*cloudScan, powderSegmentIndices, *powders);
    return {powders, object};
}

PcPtr PathPlanner::generateZigZagPath(const PcPtr& cloudCAD, const PcPtr& cloudScan)
{
    std::cout << "Start generating zigzag path" << std::endl;
    
    std::vector<float> corners = this->findScanBoundary(cloudScan);
    float lowX = corners[0], highX = corners[1];
    float lowY = corners[2], highY = corners[3];

    float resolution = 1.5; // Resolution of waypoints in cm;
    float safetyDist = 3.0; // Safety distance between waypoints and object top surface in cm;
    float cropBoundary = 2.5; // Resolution of object top surface height searching around a waypoint in cm;
    PcPtr waypoints(new pointcloud);
    PcPtr cloudCAD_cropped(new pointcloud);
    pcl::CropBox<pcl::PointXYZ> boxFilter;
    int direction = 1;
    for(float x = highX; x >= lowX; x -= resolution)
    {
        pcl::PointXYZ waypoint;
        if(direction == 0)
        {
            for(float y = lowY; y <= highY; y += resolution)
            {
                // Search for the highest point within +- cropBoundary.
                boxFilter.setMax(Eigen::Vector4f(x+cropBoundary/2.0, y+cropBoundary/2.0, 22.0, 1.0));
                boxFilter.setMin(Eigen::Vector4f(x-cropBoundary/2.0, y-cropBoundary/2.0, -100.0, 1.0));
                
                boxFilter.setInputCloud(cloudCAD);
                boxFilter.filter(*cloudCAD_cropped);
                if(cloudCAD_cropped->size() > 0)
                {
                    auto height = this->findHighestHeight(cloudCAD_cropped);
                    waypoint.x = x;
                    waypoint.y = y;
                    waypoint.z = height + safetyDist; // App;ly a safety distance to the waypont
                    waypoints->push_back(waypoint);
                }
            }
            direction = 1;
        }
        else
        {
            for(float y = highY; y >= lowY; y -= resolution)
            {
                boxFilter.setMax(Eigen::Vector4f(x+cropBoundary/2.0, y+cropBoundary/2.0, -2.0, 1.0));
                boxFilter.setMin(Eigen::Vector4f(x-cropBoundary/2.0, y-cropBoundary/2.0, -100.0, 1.0));
                
                boxFilter.setInputCloud(cloudCAD);
                boxFilter.filter(*cloudCAD_cropped);
                if(cloudCAD_cropped->size() > 0)
                {
                    auto height = this->findHighestHeight(cloudCAD_cropped);
                    waypoint.x = x;
                    waypoint.y = y;
                    waypoint.z = height + safetyDist;
                    waypoints->push_back(waypoint);
                }
            }
            direction = 0;
        }
    }
    return waypoints;
}

PcPtr PathPlanner::generateCircularPath(const PcPtr& objectSegment, const PcPtr& powderSegment)
{
    std::cout << "Start generating circular path" << std::endl;

    double safetyDist;
    if(this->depowderingProgress < 0.3)
        safetyDist = this->waypointSafetyDist1;
    else
        safetyDist = this->waypointSafetyDist2;

    // Project powder segment and object segment to ground.
    PcPtr powderSegmentProjection(new pcl::PointCloud<pcl::PointXYZ>);
    PcPtr objectSegmentProjection(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::copyPointCloud(*objectSegment, *objectSegmentProjection);
    pcl::copyPointCloud(*powderSegment, *powderSegmentProjection);
    std::for_each(objectSegmentProjection->begin(), objectSegmentProjection->end(), [](auto&& point){
        point.z = 0;
    });
    std::for_each(powderSegmentProjection->begin(), powderSegmentProjection->end(), [](auto&& point){
        point.z = 0;
    });
    
    // Get waypoints. Should be certain distance away from the object outer contour.
    int numNeighbors = 1;
    std::vector<int> nnIndices(numNeighbors);
    std::vector<float> nnDists(numNeighbors);
    std::vector<int> waypointIndices;
    PcPtr waypoints(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointXYZ minPt, maxPt;
    pcl::getMinMax3D(*objectSegment, minPt, maxPt);
    this->tree->setInputCloud(objectSegmentProjection);
    for(size_t i = 0; i < powderSegmentProjection->size(); i++)
    {
        if(powderSegment->points[i].z > maxPt.z)
            continue;
        this->tree->nearestKSearch(powderSegmentProjection->points[i], numNeighbors, nnIndices, nnDists);
        float nearestDist = std::sqrt(nnDists[numNeighbors-1]);

        if(nearestDist > safetyDist && nearestDist < safetyDist+1.0)
            waypointIndices.push_back(i);
    }
    pcl::copyPointCloud(*powderSegment, waypointIndices, *waypoints);

    // Downsample waypoints to the specified resolution.
    float resolution = 4.0;
    pcl::VoxelGrid<pcl::PointXYZ> voxelFilter;
    voxelFilter.setLeafSize (resolution, resolution, resolution);
    voxelFilter.setInputCloud (waypoints);
    voxelFilter.filter(*waypoints);

    // Calculate waypoints centroid.
    pcl::CentroidPoint<pcl::PointXYZ> centroid;
    for(auto&& point : waypoints->points)
    {   
        centroid.add(point);
    }
    pcl::PointXYZ contour_center;
    centroid.get(contour_center);

    // Sort waypoints counterclockwise
    std::sort(waypoints->begin(), waypoints->end(), [contour_center](auto&& p1, auto&& p2)
    {
        auto cx = contour_center.x;
        auto cy = contour_center.y;
        auto angle1 = atan2(p1.y-cy, p1.x-cx)*180.0/3.14;
        auto angle2 = atan2(p2.y-cy, p2.x-cx)*180.0/3.14;
        if(angle1 <= -90.0 && angle1 >= -180.0)
            angle1 += 360.0;
        if(angle2 <= -90.0 && angle2 >= -180.0)
            angle2 += 360.0;
        return angle1 < angle2;
    });

    // Repeat the waypoints one more time.
    int numWaypoints = waypoints->size();
    for(int i = 0; i < 1; i++)
    {
        for(int j = 0; j < numWaypoints; j++)
        {
            auto pt = waypoints->points[j];
            pt.z -= 0.3;
            waypoints->push_back(pt);
        }
    }
    return waypoints;
}

void PathPlanner::cloudCallback(const sensor_msgs::PointCloud2ConstPtr pc1, const sensor_msgs::PointCloud2ConstPtr pc2)
{
    const clock_t start = clock();
    pcl::fromROSMsg(*pc1, *this->cloudCAD);
    pcl::fromROSMsg(*pc2, *this->cloudScan);

    this->statisticalFilter.setInputCloud(this->cloudScan);
    this->statisticalFilter.filter(*this->cloudScan);

    std::vector<PcPtr> segments = this->segmentPowdersAndObject(this->cloudCAD, this->cloudScan);
    PcPtr cloudPowderSegment = segments[0]; PcPtr cloudObjectSegment = segments[1];

    if(this->depowderingProgress < 0.85)
        this->waypoints = this->generateCircularPath(cloudObjectSegment, cloudPowderSegment);
    else
        this->waypoints = this->generateZigZagPath(cloudObjectSegment, cloudPowderSegment);

    this->publishTopics();
    auto execution_time = (double(clock()) - double(start))/ double(CLOCKS_PER_SEC);
    int frame_rate = 1.0/execution_time;
    std::cout << "Path Generated" << std::endl << std::endl;
    std::cout << "Exucution time is: " << execution_time << std::endl;
    std::cout << "Frame rate is: " << frame_rate << std::endl;
}

void PathPlanner::progressCallback(const std_msgs::Float64 progressMsgs)
{
    this->depowderingProgress = progressMsgs.data;
}

void PathPlanner::publishTopics()
{
    sensor_msgs::PointCloud2 pc2Waypoints, pc2CloudCAD, pc2CloudScan;
    pcl::toROSMsg(*this->cloudCAD, pc2CloudCAD);
    pc2CloudCAD.header.frame_id = "camera_link";
    this->pubCAD.publish(pc2CloudCAD);

    pcl::toROSMsg(*this->cloudScan, pc2CloudScan);
    pc2CloudScan.header.frame_id = "camera_link";
    this->pubScan.publish(pc2CloudScan);

    pcl::toROSMsg(*this->waypoints, pc2Waypoints);
    pc2Waypoints.header.frame_id = "camera_link";
    this->pubPath.publish(pc2Waypoints);
}

void PathPlanner::run()
{
    ros::Rate loop_rate(30);
    while(ros::ok())
    {
        ros::spinOnce();
        loop_rate.sleep();
    }
}

int main(int argc, char** argv)
{
    ros::init(argc,argv,"path_planner");

    PathPlanner planner;
    planner.run();
    return 0;}