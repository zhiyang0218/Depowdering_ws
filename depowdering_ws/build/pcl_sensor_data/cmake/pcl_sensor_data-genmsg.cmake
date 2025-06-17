# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "pcl_sensor_data: 0 messages, 7 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(pcl_sensor_data_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv" NAME_WE)
add_custom_target(_pcl_sensor_data_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pcl_sensor_data" "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv" ""
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv" NAME_WE)
add_custom_target(_pcl_sensor_data_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pcl_sensor_data" "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv" ""
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv" NAME_WE)
add_custom_target(_pcl_sensor_data_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pcl_sensor_data" "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv" ""
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv" NAME_WE)
add_custom_target(_pcl_sensor_data_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pcl_sensor_data" "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv" ""
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv" NAME_WE)
add_custom_target(_pcl_sensor_data_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pcl_sensor_data" "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv" ""
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv" NAME_WE)
add_custom_target(_pcl_sensor_data_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pcl_sensor_data" "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv" ""
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv" NAME_WE)
add_custom_target(_pcl_sensor_data_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "pcl_sensor_data" "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_cpp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_cpp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_cpp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_cpp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_cpp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_cpp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_sensor_data
)

### Generating Module File
_generate_module_cpp(pcl_sensor_data
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_sensor_data
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(pcl_sensor_data_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(pcl_sensor_data_generate_messages pcl_sensor_data_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_cpp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_cpp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_cpp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_cpp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_cpp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_cpp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_cpp _pcl_sensor_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pcl_sensor_data_gencpp)
add_dependencies(pcl_sensor_data_gencpp pcl_sensor_data_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pcl_sensor_data_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_eus(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_eus(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_eus(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_eus(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_eus(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_eus(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_sensor_data
)

### Generating Module File
_generate_module_eus(pcl_sensor_data
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_sensor_data
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(pcl_sensor_data_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(pcl_sensor_data_generate_messages pcl_sensor_data_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_eus _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_eus _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_eus _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_eus _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_eus _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_eus _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_eus _pcl_sensor_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pcl_sensor_data_geneus)
add_dependencies(pcl_sensor_data_geneus pcl_sensor_data_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pcl_sensor_data_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_lisp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_lisp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_lisp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_lisp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_lisp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_lisp(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_sensor_data
)

### Generating Module File
_generate_module_lisp(pcl_sensor_data
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_sensor_data
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(pcl_sensor_data_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(pcl_sensor_data_generate_messages pcl_sensor_data_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_lisp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_lisp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_lisp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_lisp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_lisp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_lisp _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_lisp _pcl_sensor_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pcl_sensor_data_genlisp)
add_dependencies(pcl_sensor_data_genlisp pcl_sensor_data_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pcl_sensor_data_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_nodejs(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_nodejs(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_nodejs(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_nodejs(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_nodejs(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_nodejs(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_sensor_data
)

### Generating Module File
_generate_module_nodejs(pcl_sensor_data
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_sensor_data
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(pcl_sensor_data_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(pcl_sensor_data_generate_messages pcl_sensor_data_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_nodejs _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_nodejs _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_nodejs _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_nodejs _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_nodejs _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_nodejs _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_nodejs _pcl_sensor_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pcl_sensor_data_gennodejs)
add_dependencies(pcl_sensor_data_gennodejs pcl_sensor_data_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pcl_sensor_data_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_py(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_py(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_py(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_py(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_py(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_sensor_data
)
_generate_srv_py(pcl_sensor_data
  "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_sensor_data
)

### Generating Module File
_generate_module_py(pcl_sensor_data
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_sensor_data
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(pcl_sensor_data_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(pcl_sensor_data_generate_messages pcl_sensor_data_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/avgZDistance.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_py _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/angleAdjust.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_py _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/laserMax.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_py _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/ProcessPointcloud.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_py _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StartRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_py _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/StopRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_py _pcl_sensor_data_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/pcl_sensor_data/srv/RestartRecording.srv" NAME_WE)
add_dependencies(pcl_sensor_data_generate_messages_py _pcl_sensor_data_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(pcl_sensor_data_genpy)
add_dependencies(pcl_sensor_data_genpy pcl_sensor_data_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS pcl_sensor_data_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_sensor_data)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/pcl_sensor_data
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(pcl_sensor_data_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_sensor_data)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/pcl_sensor_data
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(pcl_sensor_data_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_sensor_data)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/pcl_sensor_data
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(pcl_sensor_data_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_sensor_data)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/pcl_sensor_data
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(pcl_sensor_data_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_sensor_data)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_sensor_data\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/pcl_sensor_data
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(pcl_sensor_data_generate_messages_py std_msgs_generate_messages_py)
endif()
