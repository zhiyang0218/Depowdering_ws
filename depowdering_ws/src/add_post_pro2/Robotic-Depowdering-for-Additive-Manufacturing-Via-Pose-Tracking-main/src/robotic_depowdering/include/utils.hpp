#pragma once
#include <random>
#include <fstream>
#include <pcl/point_types.h>
#include <pcl/point_cloud.h>
#include <pcl/common/common.h>
#include <pcl/common/transforms.h>
#include <pcl/filters/voxel_grid.h>

#define PI 3.1415926 
typedef pcl::PointCloud<pcl::PointXYZ>::Ptr PcPtr;
typedef pcl::PointCloud<pcl::PointXYZ> PointCloud; 

namespace OtsUtils
{
    struct ObjectPose
    {
        float x = 0, y = 0, z = 0;
        float roll = 0, pitch = 0, yaw = 0;
    };

    PcPtr readPointCloud(const std::string file_name)
    {
        // Read point cloud from pcd file and load it to pcl::PointCloud<pcl::PointXYZ>.
        char* fname = (char*)file_name.data();
        std::ifstream myfile;
        myfile.open(fname);
        PcPtr cloud (new PointCloud); 

        if (myfile.is_open()) 
            std::cout << "read succeed!" << std::endl;
        else
            std::cout << "Read failed!" << std::endl;
        
        while(!myfile.eof())
        {
            float x,y,z; 
            myfile >> x >> y >> z;
            cloud->push_back({x,y,z});
        } 
        return cloud;
    }

    Eigen::Matrix4f getRollMatrix(double roll_angle)
    {
        Eigen::Matrix4f roll_matrix = Eigen::Matrix4f::Identity();
        double roll = roll_angle * PI / 180.0;
        roll_matrix(1,1) = cos(roll);
        roll_matrix(1,2) = -sin(roll);
        roll_matrix(2,1) = sin(roll);
        roll_matrix(2,2) = cos(roll);
        return roll_matrix;
    }

    Eigen::Matrix4f getPitchMatrix(double pitch_angle)
    {
        Eigen::Matrix4f pitch_matrix = Eigen::Matrix4f::Identity();
        double pitch = pitch_angle * PI / 180.0;
        pitch_matrix(0,0) = cos(pitch);
        pitch_matrix(0,2) = sin(pitch);
        pitch_matrix(2,0) = -sin(pitch);
        pitch_matrix(2,2) = cos(pitch);
        return pitch_matrix;
    }

    Eigen::Matrix4f getYawMatrix(double yaw_angle)
    {
        Eigen::Matrix4f yaw_matrix = Eigen::Matrix4f::Identity();
        double yaw = yaw_angle * PI / 180.0;
        yaw_matrix(0,0) = cos(yaw);
        yaw_matrix(0,1) = -sin(yaw);
        yaw_matrix(1,0) = sin(yaw);
        yaw_matrix(1,1) = cos(yaw);
        return yaw_matrix;
    }

    double calcCharacteristicLength(PcPtr& pcCAD)
    {
        pcl::PointXYZ minPt, maxPt;
        pcl::getMinMax3D(*pcCAD, minPt, maxPt);
        double volume = (maxPt.x - minPt.x)*(maxPt.y - minPt.y)*(maxPt.z - minPt.z);
        double characteristicLength = std::pow(volume, 1.0/3.0);
        return characteristicLength;
    }  

    ObjectPose computePoseFromTrans(const Eigen::Matrix4f& transCAD)
    {
        ObjectPose pose;
        pose.x = transCAD(0,3);
        pose.y = transCAD(1,3);
        pose.z = transCAD(2,3);
        float yawRadian = atan2(transCAD(1,0), transCAD(0,0));
        float pitchRadian = atan2(-transCAD(2,0), sqrt(pow(transCAD(2,1),2)+pow(transCAD(2,2),2)));
        float rollRadian = atan2(transCAD(2,1), transCAD(2,2));
        pose.yaw = yawRadian/3.14 * 180.0;
        pose.pitch = pitchRadian/3.14 * 180.0;
        pose.roll = rollRadian/3.14 * 180.0;
        return pose;
    }

    std::pair<float, float> computePoseError(Eigen::Matrix4f& currPose, Eigen::Matrix4f& gtPose)
    {
        float dX = currPose(0,3) - gtPose(0,3);
        float dY = currPose(1,3) - gtPose(1,3);
        float dZ = currPose(2,3) - gtPose(2,3);
        float translationError = std::sqrt(dX*dX + dY*dY + dZ*dZ);

        auto currR = currPose.block<3,3>(0,0);
        auto gtR = gtPose.block<3,3>(0,0);
        auto R = currR.transpose() * gtR;
        auto trace = std::min(3.0f ,R.trace());
        float rotationError = acos((trace - 1)/2) * 180.0 / PI;
        return {translationError, rotationError}; 
    }

    std::pair<float, float> computeSymmetricPoseError(Eigen::Matrix4f& currPose, Eigen::Matrix4f& gtPose)
    {
        float dX = currPose(0,3) - gtPose(0,3);
        float dY = currPose(1,3) - gtPose(1,3);
        float dZ = currPose(2,3) - gtPose(2,3);
        float translationError = std::sqrt(dX*dX + dY*dY + dZ*dZ);

        auto currR = currPose.block<3,3>(0,0);
        auto gtR = gtPose.block<3,3>(0,0);
        Eigen::Vector3f z(0,0,1);
        auto z1 = currR*z;
        auto z2 = gtR * z;
        float dot = z1.transpose() * z1;
        float norm1 = z1.norm();
        float norm2 = z2.norm();
        float rotationError = acos(1.0);
        return {translationError, rotationError}; 
    }
}