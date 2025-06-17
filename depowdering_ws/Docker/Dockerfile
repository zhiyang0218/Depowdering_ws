# Use the official ROS Noetic base image
FROM osrf/ros:noetic-desktop-full
# create a cerlab user with uid/gid 1000 (adjust if your host uid/gid differ)
RUN groupadd -g 1000 cerlab \
 && useradd -m -u 1000 -g cerlab -s /bin/bash cerlab

# Install NVIDIA support dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    gnupg \
    lsb-release \ 
    gedit net-tools iputils-ping \
    python3-pip \
    python3-wstool \
    python3-catkin-tools \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-vcstool \
    python3-rospkg \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f /etc/ros/rosdep/sources.list.d/20-default.list \
    && rosdep init \
    && rosdep update

# Add the NVIDIA package repositories
RUN curl -s -L https://nvidia.github.io/libnvidia-container/gpgkey | apt-key add - && \
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && \
    curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

# Install CA Certificates
RUN apt-get update && apt-get install -y ca-certificates
RUN update-ca-certificates

# Install Python Packages
RUN apt-get update && apt-get install -y python3-tk

# Update pip to >=20.3
RUN pip install -U pip>=20.3

RUN pip install --ignore-installed\
    open3d

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Update all packages
RUN sudo apt update && sudo apt upgrade -y

# Install ROS Packages
RUN apt-get install -y \
    ros-${ROS_DISTRO}-realsense2-camera \
    ros-${ROS_DISTRO}-realsense2-description \
    ros-${ROS_DISTRO}-catkin \
    ros-${ROS_DISTRO}-moveit \
    ros-${ROS_DISTRO}-moveit-core \
    ros-${ROS_DISTRO}-moveit-ros-planning \
    ros-${ROS_DISTRO}-moveit-ros-perception \
    ros-${ROS_DISTRO}-moveit-visual-tools \
    ros-${ROS_DISTRO}-rosserial \
    ros-${ROS_DISTRO}-rosserial-arduino \
    ros-${ROS_DISTRO}-ros-control \
    ros-${ROS_DISTRO}-ros-controllers \
    ros-${ROS_DISTRO}-joint-state-controller \
    ros-${ROS_DISTRO}-joint-trajectory-controller \
    && rm -rf /var/lib/apt/lists/*

# 3) PCL bridge (if any of your packages depend on pcl_ros)
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ros-${ROS_DISTRO}-pcl-ros \
    && rm -rf /var/lib/apt/lists/*
    
# Rosdep update
RUN rosdep update

WORKDIR /home/catkin_ws

# Create a symbolic link for python3 -> python
RUN ln -s /usr/bin/python3 /usr/bin/python

# Source the ROS setup file
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc

