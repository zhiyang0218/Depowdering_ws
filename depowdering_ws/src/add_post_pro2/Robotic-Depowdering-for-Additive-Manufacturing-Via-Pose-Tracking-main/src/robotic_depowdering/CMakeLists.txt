cmake_minimum_required(VERSION 3.0.2)
project(robotic_depowdering)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  pcl_ros
  std_msgs
)

catkin_package(
  INCLUDE_DIRS include
)

include_directories(
  include
  ${PCL_INCLUDE_DIRS}
  ${catkin_INCLUDE_DIRS}
)

set(LIBRARIES ${catkin_LIBRARIES} ${PCL_LIBRARIES})
add_executable(icp_tracker src/icp_tracking.cpp)
add_executable(path_planner src/path_planning.cpp)
target_link_libraries(icp_tracker ${LIBRARIES})
target_link_libraries(path_planner ${LIBRARIES})