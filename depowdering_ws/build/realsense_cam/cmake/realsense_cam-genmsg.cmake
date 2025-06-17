# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "realsense_cam: 0 messages, 7 services")

set(MSG_I_FLAGS "-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(realsense_cam_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv" NAME_WE)
add_custom_target(_realsense_cam_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "realsense_cam" "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv" "std_msgs/Header:sensor_msgs/Image"
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv" NAME_WE)
add_custom_target(_realsense_cam_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "realsense_cam" "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv" "std_msgs/Header:sensor_msgs/PointField:sensor_msgs/PointCloud2"
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv" NAME_WE)
add_custom_target(_realsense_cam_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "realsense_cam" "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv" "std_msgs/Header:sensor_msgs/Image"
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv" NAME_WE)
add_custom_target(_realsense_cam_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "realsense_cam" "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv" "std_msgs/Header:geometry_msgs/Point:geometry_msgs/PointStamped"
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv" NAME_WE)
add_custom_target(_realsense_cam_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "realsense_cam" "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv" "geometry_msgs/Point:std_msgs/Header:sensor_msgs/PointCloud2:geometry_msgs/PointStamped:sensor_msgs/PointField"
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv" NAME_WE)
add_custom_target(_realsense_cam_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "realsense_cam" "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv" ""
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv" NAME_WE)
add_custom_target(_realsense_cam_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "realsense_cam" "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/realsense_cam
)
_generate_srv_cpp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/realsense_cam
)
_generate_srv_cpp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/realsense_cam
)
_generate_srv_cpp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PointStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/realsense_cam
)
_generate_srv_cpp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PointStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/realsense_cam
)
_generate_srv_cpp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/realsense_cam
)
_generate_srv_cpp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/realsense_cam
)

### Generating Module File
_generate_module_cpp(realsense_cam
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/realsense_cam
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(realsense_cam_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(realsense_cam_generate_messages realsense_cam_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_cpp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_cpp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_cpp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_cpp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_cpp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_cpp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_cpp _realsense_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(realsense_cam_gencpp)
add_dependencies(realsense_cam_gencpp realsense_cam_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS realsense_cam_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/realsense_cam
)
_generate_srv_eus(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/realsense_cam
)
_generate_srv_eus(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/realsense_cam
)
_generate_srv_eus(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PointStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/realsense_cam
)
_generate_srv_eus(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PointStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/realsense_cam
)
_generate_srv_eus(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/realsense_cam
)
_generate_srv_eus(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/realsense_cam
)

### Generating Module File
_generate_module_eus(realsense_cam
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/realsense_cam
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(realsense_cam_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(realsense_cam_generate_messages realsense_cam_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_eus _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_eus _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_eus _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_eus _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_eus _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_eus _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_eus _realsense_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(realsense_cam_geneus)
add_dependencies(realsense_cam_geneus realsense_cam_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS realsense_cam_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/realsense_cam
)
_generate_srv_lisp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/realsense_cam
)
_generate_srv_lisp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/realsense_cam
)
_generate_srv_lisp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PointStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/realsense_cam
)
_generate_srv_lisp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PointStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/realsense_cam
)
_generate_srv_lisp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/realsense_cam
)
_generate_srv_lisp(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/realsense_cam
)

### Generating Module File
_generate_module_lisp(realsense_cam
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/realsense_cam
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(realsense_cam_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(realsense_cam_generate_messages realsense_cam_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_lisp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_lisp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_lisp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_lisp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_lisp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_lisp _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_lisp _realsense_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(realsense_cam_genlisp)
add_dependencies(realsense_cam_genlisp realsense_cam_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS realsense_cam_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/realsense_cam
)
_generate_srv_nodejs(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/realsense_cam
)
_generate_srv_nodejs(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/realsense_cam
)
_generate_srv_nodejs(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PointStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/realsense_cam
)
_generate_srv_nodejs(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PointStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/realsense_cam
)
_generate_srv_nodejs(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/realsense_cam
)
_generate_srv_nodejs(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/realsense_cam
)

### Generating Module File
_generate_module_nodejs(realsense_cam
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/realsense_cam
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(realsense_cam_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(realsense_cam_generate_messages realsense_cam_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_nodejs _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_nodejs _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_nodejs _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_nodejs _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_nodejs _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_nodejs _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_nodejs _realsense_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(realsense_cam_gennodejs)
add_dependencies(realsense_cam_gennodejs realsense_cam_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS realsense_cam_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/realsense_cam
)
_generate_srv_py(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/realsense_cam
)
_generate_srv_py(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/realsense_cam
)
_generate_srv_py(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PointStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/realsense_cam
)
_generate_srv_py(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointCloud2.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PointStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/PointField.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/realsense_cam
)
_generate_srv_py(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/realsense_cam
)
_generate_srv_py(realsense_cam
  "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/realsense_cam
)

### Generating Module File
_generate_module_py(realsense_cam
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/realsense_cam
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(realsense_cam_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(realsense_cam_generate_messages realsense_cam_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneDepth.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_py _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOnePointCloud.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_py _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FetchOneRGB.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_py _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindWorkspaceCenter.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_py _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/FindBoxPoints.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_py _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOnePCL.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_py _realsense_cam_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/realsense_cam/srv/SaveOneRGB.srv" NAME_WE)
add_dependencies(realsense_cam_generate_messages_py _realsense_cam_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(realsense_cam_genpy)
add_dependencies(realsense_cam_genpy realsense_cam_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS realsense_cam_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/realsense_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/realsense_cam
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(realsense_cam_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(realsense_cam_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/realsense_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/realsense_cam
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(realsense_cam_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(realsense_cam_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/realsense_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/realsense_cam
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(realsense_cam_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(realsense_cam_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/realsense_cam)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/realsense_cam
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(realsense_cam_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(realsense_cam_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/realsense_cam)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/realsense_cam\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/realsense_cam
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(realsense_cam_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(realsense_cam_generate_messages_py sensor_msgs_generate_messages_py)
endif()
