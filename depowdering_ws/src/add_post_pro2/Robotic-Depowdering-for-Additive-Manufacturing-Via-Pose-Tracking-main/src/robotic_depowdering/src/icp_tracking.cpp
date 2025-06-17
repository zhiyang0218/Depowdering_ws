#include <string>
#include <iostream>
#include <ros/ros.h>
#include <std_msgs/Bool.h>
#include <std_msgs/Float64.h>
#include <sensor_msgs/PointCloud2.h>

#include <pcl/point_types.h>
#include <pcl/search/kdtree.h>
#include <pcl_ros/point_cloud.h>
#include <pcl/common/centroid.h>
#include <pcl/common/transforms.h>
#include <pcl/registration/icp.h>
#include <pcl/filters/crop_box.h>
#include <pcl/filters/voxel_grid.h>
#include <pcl/filters/statistical_outlier_removal.h>

#include "utils.hpp"

typedef pcl::PointCloud<pcl::PointXYZ>::Ptr PcPtr;
typedef pcl::PointCloud<pcl::PointXYZ> PointCloud; 

class IcpTracker
{
private:
    std::string pathCAD;
    double voxelLeafSize;
    double CAD_initial_X, CAD_initial_Y, CAD_initial_Z; // Object initial location;
    double deltaTranslation, deltaRotation, deltaProgress; // Template update criteria;
    double currProgress, bestProgress, lastUpdatedProgress; // Depowdering progress;
    double startTrackingThreshold, templateUpdateDistThreshold;
    bool firstIter = true, objectMoved = false, locationInitialized = false;
    
    PcPtr cloudCAD, cloudInitialCAD, cloudTemplate; // Pointcloud showing: current pose, initial pose, and current template;
    PcPtr cloudScanCropped, cloudScan, cloudPowderContour; // Pointcloud showing: cropped scan (reduce computation), original scan, and powder contour;
    Eigen::Matrix4f currTansformation, lastUpdatedTransformation; // Transformation from the initial pose to the current pose;
    OtsUtils::ObjectPose currPose, prevTemplateUpdatePose, prevPausePose;

    pcl::CropBox<pcl::PointXYZ> boxFilter;
    pcl::VoxelGrid<pcl::PointXYZ> voxelFilter;
    pcl::search::KdTree<pcl::PointXYZ>::Ptr kdtree;
    pcl::IterativeClosestPoint<pcl::PointXYZ, pcl::PointXYZ> myIcp;
    
    ros::NodeHandle nh;
    ros::Subscriber sub;
    ros::Publisher pubPauseRobot, pubProgress; // Publishers that send the pause signal and depowdering progress;
    ros::Publisher pubCloudCAD, pubCloudScanCropped, pubTemplate, pubContour;
    
    void getParams();
    void publishTopics();
    bool detectObjectMotion();
    double calculateProgressAndUpdateTemplate(const PcPtr& pcScan, const PcPtr& pcCAD, PcPtr& pctemplate);

    void track();
    void callback(const sensor_msgs::PointCloud2ConstPtr pcMsgs);

public:
    IcpTracker();
    void run();
};

IcpTracker::IcpTracker():
cloudScan (new PointCloud), 
cloudScanCropped (new PointCloud), 
cloudPowderContour (new PointCloud),
kdtree(new pcl::search::KdTree<pcl::PointXYZ>)
{
    this->getParams();
    this->currProgress = 0;
    this->bestProgress = 0;
    this->lastUpdatedProgress = 0;

    this->cloudCAD = OtsUtils::readPointCloud(this->pathCAD);
    this->cloudTemplate = OtsUtils::readPointCloud(this->pathCAD);
    this->cloudInitialCAD = OtsUtils::readPointCloud(this->pathCAD);
    
    this->pubProgress = this->nh.advertise<std_msgs::Float64>("icp_tracker/progress", 1);
    this->pubPauseRobot = this->nh.advertise<std_msgs::Bool>("icp_tracker/pause", 1);
    this->pubCloudCAD = this->nh.advertise<sensor_msgs::PointCloud2>("icp_tracker/CAD", 1);
    this->pubTemplate = this->nh.advertise<sensor_msgs::PointCloud2>("icp_tracker/template", 1);
    this->pubCloudScanCropped = this->nh.advertise<sensor_msgs::PointCloud2>("icp_tracker/scan", 1);
    this->pubContour = this->nh.advertise<sensor_msgs::PointCloud2>("icp_tracker/powder_contour", 1);
    this->sub = this->nh.subscribe("/camera/depth_registered/points", 1, &IcpTracker::callback, this);

    double characLength = OtsUtils::calcCharacteristicLength(this->cloudCAD);
    std::cout << "characteristic length is: " << characLength << " cm" << std::endl;

    voxelFilter.setLeafSize (this->voxelLeafSize, this->voxelLeafSize, this->voxelLeafSize);
    voxelFilter.setInputCloud (this->cloudCAD);
    voxelFilter.filter(*this->cloudCAD);
    voxelFilter.setInputCloud (this->cloudInitialCAD);
    voxelFilter.filter(*this->cloudInitialCAD);

    this->myIcp.setMaximumIterations(30);
    this->myIcp.setMaxCorrespondenceDistance(this->templateUpdateDistThreshold);
    this->myIcp.setTransformationEpsilon(0.00005);
    this->myIcp.setEuclideanFitnessEpsilon(0.00005);

    this->currTansformation = Eigen::Matrix4f::Identity();
    this->currTansformation(0,3) = this->CAD_initial_X;
    this->currTansformation(1,3) = this->CAD_initial_Y;
    this->currTansformation(2,3) = this->CAD_initial_Z;
    this->lastUpdatedTransformation = this->currTansformation;

    // Transform pointcloud to the initial pose.
    pcl::transformPointCloud(*this->cloudCAD, *this->cloudCAD, this->currTansformation);
    pcl::transformPointCloud(*this->cloudTemplate, *this->cloudTemplate,this->currTansformation); 
}

void IcpTracker::getParams()
{
    ros::param::get("pathCAD", this->pathCAD);
    ros::param::get("CAD_initial_X", this->CAD_initial_X);
    ros::param::get("CAD_initial_Y", this->CAD_initial_Y);
    ros::param::get("CAD_initial_Z", this->CAD_initial_Z);
    ros::param::get("voxelLeafSize", this->voxelLeafSize);
    ros::param::get("deltaProgress", this->deltaProgress);
    ros::param::get("deltaRotation", this->deltaRotation);
    ros::param::get("deltaTranslation", this->deltaTranslation);
    ros::param::get("startTrackingThreshold", this->startTrackingThreshold);
    ros::param::get("templateUpdateDistThreshold", this->templateUpdateDistThreshold);
}

double IcpTracker::calculateProgressAndUpdateTemplate (const PcPtr& pcScan, const PcPtr& pcCAD, PcPtr& pcTemplate)
{
    int numNeighbors = 1; // find this many nearest neighbors
    std::vector<int> nnIndices(numNeighbors);
    std::vector<float> nnDists(numNeighbors);
    std::vector<int> scanIndices, templateIndices, contourIndices;

    // Find matched points.
    this->kdtree->setInputCloud(pcScan);
    for(size_t i = 0; i < pcCAD->size(); i++)
    {
        this->kdtree->nearestKSearch(pcCAD->points[i], numNeighbors, nnIndices, nnDists);
        float dist = std::sqrt(nnDists[numNeighbors - 1]);

        if(dist < this->templateUpdateDistThreshold)
        {
            scanIndices.push_back(nnIndices[0]);
            templateIndices.push_back(i);
        }
    }
    PcPtr matchedScan (new PointCloud);
    pcl::copyPointCloud(*pcScan, scanIndices, *matchedScan);

    // Update the CAD template if update criteria is met.
    auto [t, R] = OtsUtils::computePoseError(this->currTansformation, this->lastUpdatedTransformation);
    if(abs(this->currProgress - this->lastUpdatedProgress) >= this->deltaProgress
    || abs(R) > this->deltaRotation || abs(t) > this->deltaTranslation || this->firstIter )
    {
        ROS_INFO("Template updated");
        pcl::copyPointCloud(*pcCAD, templateIndices, *pcTemplate);
        this->lastUpdatedProgress = this->currProgress;
        this->prevTemplateUpdatePose = this->currPose;
        this->lastUpdatedTransformation = this->currTansformation;
        firstIter = false;
    }

    pcl::PointXYZ minPt, maxPt;
    pcl::getMinMax3D(*this->cloudCAD, minPt, maxPt); // Measure the max/min height of the current pose;

    // Extract powder contour.
    PcPtr powderProj (new PointCloud);
    PcPtr matchedScanProj (new PointCloud);
    pcl::copyPointCloud(*pcScan, *powderProj);
    pcl::copyPointCloud(*matchedScan, *matchedScanProj);
    std::for_each(matchedScanProj->begin(), matchedScanProj->end(), [](auto&& point){
        // Project the matched portion of scan (part segment) to the ground.
        point.z = 0;
    });
    std::for_each(powderProj->begin(), powderProj->end(), [](auto&& point){
        // Project the entire scan to the ground.
        point.z = 0;
    });
    std::vector<int> matchedIndices(1);
    std::vector<float> matchedDists(1);
    this->kdtree->setInputCloud(matchedScanProj);
    float totalHeight = 0;
    for(int i = 0; i < powderProj->size(); i++)
    {
        if(pcScan->points[i].z > maxPt.z)
            continue;

        this->kdtree->nearestKSearch(powderProj->points[i], 1, matchedIndices, matchedDists);
        float dist = std::sqrt(matchedDists[0]);
        if(dist > this->templateUpdateDistThreshold  && 
           dist < this->templateUpdateDistThreshold+0.5) // Add point to powder contour if it's certain distance away;
        {
            auto sourcePt = powderProj->points[i];
            auto targetPt = matchedScanProj->points[matchedIndices[0]];
            contourIndices.push_back(i);
            totalHeight += pcScan->points[i].z;
        }
    }

    // Calculate depowdering progress.
    float avrHeight = totalHeight/contourIndices.size();
    float heightCAD = maxPt.z - minPt.z;
    double score = (maxPt.z - avrHeight - 0.5)/heightCAD;
    score = std::min(score, 1.0);
    score = std::max(score, 0.0);
    pcl::copyPointCloud(*pcScan, contourIndices, *this->cloudPowderContour);
    return score;
}

bool IcpTracker::detectObjectMotion()
{
    if(this->locationInitialized == false)
    {
        this->locationInitialized = true;
        this->prevPausePose = this->currPose;
        return false;
    }
    else
    {
        if(std::abs(this->currPose.x - this->prevPausePose.x) > 3.5 ||
           std::abs(this->currPose.y - this->prevPausePose.y) > 3.5 ||
           std::abs(this->currPose.z - this->prevPausePose.z) > 3.5 ||
           std::abs(this->currPose.roll - this->prevPausePose.roll) > 25.0 ||
           std::abs(this->currPose.pitch - this->prevPausePose.pitch) > 25.0 ||
           std::abs(this->currPose.yaw - this->prevPausePose.yaw) > 25.0)
        {
            this->prevPausePose = this->currPose;
            return true;
        }
    }
    return false;
}

void IcpTracker::track()
{
    this->currPose = OtsUtils::computePoseFromTrans(this->currTansformation);
    this->objectMoved = this->detectObjectMotion();

    // Crop pointcloud scan to save some computation.
    float cropBoundary = 12.0;
    this->boxFilter.setMax(Eigen::Vector4f(currPose.x+cropBoundary, currPose.y+cropBoundary, currPose.z+cropBoundary, 1.0));
    this->boxFilter.setMin(Eigen::Vector4f(currPose.x-cropBoundary, currPose.y-cropBoundary, currPose.z-cropBoundary, 1.0));
    this->boxFilter.setInputCloud(this->cloudScan); 
    this->boxFilter.filter(*this->cloudScanCropped);

    // Start ICP tracking if the current progress exceeds the threshold.
    if(this->currProgress > this->startTrackingThreshold)
    {
        this->myIcp.setInputSource(this->cloudTemplate);
        this->myIcp.setInputTarget(this->cloudScanCropped);
        this->myIcp.align(*this->cloudTemplate);
        auto icp_trans = this->myIcp.getFinalTransformation();
        this->currTansformation = icp_trans * this->currTansformation; // Update transformation;
        pcl::transformPointCloud (*this->cloudInitialCAD, *this->cloudCAD, this->currTansformation); // Transform cloudCAD to the current pose;
    }
    this->currProgress = this->calculateProgressAndUpdateTemplate(this->cloudScanCropped, this->cloudCAD, this->cloudTemplate);
}

void IcpTracker::callback(const sensor_msgs::PointCloud2ConstPtr pc_msgs)
{
    const clock_t start = clock();
    pcl::fromROSMsg(*pc_msgs, *this->cloudScan);
    this->track();
    this->bestProgress = std::max(this->bestProgress, this->currProgress);
    this->publishTopics();
    auto execution_time = (double(clock()) - double(start))/ double(CLOCKS_PER_SEC);
    int frame_rate = 1.0/execution_time;

    std::cout << "Frame rate is: " << frame_rate << std::endl;
    std::cout << "Current progress: " << this->currProgress*100 << "%" << std::endl;
    std::cout << "Best progress: " << this->bestProgress*100 << "%" << std::endl;
}

void IcpTracker::publishTopics()
{
    std_msgs::Bool pauseSignal, completeSignal;
    if(this->objectMoved == true)
    {
        this->pubPauseRobot.publish(pauseSignal);
        std::cout << "Pause Signal Sent" << std::endl;
    }

    std_msgs::Float64 progressMsgs;
    progressMsgs.data = this->bestProgress;
    this->pubProgress.publish(progressMsgs);

    sensor_msgs::PointCloud2 pc2Scan, pc2CAD;
    sensor_msgs::PointCloud2 pc2Template, pc2PowderContour;
    pcl::toROSMsg(*this->cloudCAD, pc2CAD);
    pcl::toROSMsg(*this->cloudScanCropped, pc2Scan);
    pcl::toROSMsg(*this->cloudTemplate, pc2Template);
    pcl::toROSMsg(*this->cloudPowderContour, pc2PowderContour);
    pc2CAD.header.frame_id = "camera_link";
    pc2Scan.header.frame_id = "camera_link";
    pc2Template.header.frame_id = "camera_link";
    pc2PowderContour.header.frame_id = "camera_link";

    this->pubCloudCAD.publish(pc2CAD);
    this->pubCloudScanCropped.publish(pc2Scan);
    this->pubTemplate.publish(pc2Template);
    this->pubContour.publish(pc2PowderContour);
}

void IcpTracker::run()
{
    ros::Rate loopRate(30);
    while(ros::ok())
    {
        ros::spinOnce();
        loopRate.sleep();
    }
}

int main(int argc, char** argv)
{
    ros::init(argc, argv, "icp_tracker");
    IcpTracker tracker;
    tracker.run();
    return 0;
}