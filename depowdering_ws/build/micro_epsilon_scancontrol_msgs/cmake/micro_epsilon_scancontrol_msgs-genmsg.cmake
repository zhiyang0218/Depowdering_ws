# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "micro_epsilon_scancontrol_msgs: 0 messages, 5 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(micro_epsilon_scancontrol_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv" NAME_WE)
add_custom_target(_micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "micro_epsilon_scancontrol_msgs" "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv" ""
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv" NAME_WE)
add_custom_target(_micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "micro_epsilon_scancontrol_msgs" "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv" ""
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv" NAME_WE)
add_custom_target(_micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "micro_epsilon_scancontrol_msgs" "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv" ""
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv" NAME_WE)
add_custom_target(_micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "micro_epsilon_scancontrol_msgs" "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv" ""
)

get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv" NAME_WE)
add_custom_target(_micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "micro_epsilon_scancontrol_msgs" "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_cpp(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_cpp(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_cpp(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_cpp(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)

### Generating Module File
_generate_module_cpp(micro_epsilon_scancontrol_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(micro_epsilon_scancontrol_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages micro_epsilon_scancontrol_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_cpp _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_cpp _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_cpp _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_cpp _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_cpp _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(micro_epsilon_scancontrol_msgs_gencpp)
add_dependencies(micro_epsilon_scancontrol_msgs_gencpp micro_epsilon_scancontrol_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS micro_epsilon_scancontrol_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_eus(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_eus(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_eus(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_eus(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)

### Generating Module File
_generate_module_eus(micro_epsilon_scancontrol_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(micro_epsilon_scancontrol_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages micro_epsilon_scancontrol_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_eus _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_eus _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_eus _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_eus _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_eus _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(micro_epsilon_scancontrol_msgs_geneus)
add_dependencies(micro_epsilon_scancontrol_msgs_geneus micro_epsilon_scancontrol_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS micro_epsilon_scancontrol_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_lisp(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_lisp(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_lisp(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_lisp(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)

### Generating Module File
_generate_module_lisp(micro_epsilon_scancontrol_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(micro_epsilon_scancontrol_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages micro_epsilon_scancontrol_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_lisp _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_lisp _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_lisp _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_lisp _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_lisp _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(micro_epsilon_scancontrol_msgs_genlisp)
add_dependencies(micro_epsilon_scancontrol_msgs_genlisp micro_epsilon_scancontrol_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS micro_epsilon_scancontrol_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_nodejs(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_nodejs(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_nodejs(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_nodejs(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)

### Generating Module File
_generate_module_nodejs(micro_epsilon_scancontrol_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(micro_epsilon_scancontrol_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages micro_epsilon_scancontrol_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_nodejs _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_nodejs _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_nodejs _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_nodejs _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_nodejs _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(micro_epsilon_scancontrol_msgs_gennodejs)
add_dependencies(micro_epsilon_scancontrol_msgs_gennodejs micro_epsilon_scancontrol_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS micro_epsilon_scancontrol_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_py(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_py(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_py(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)
_generate_srv_py(micro_epsilon_scancontrol_msgs
  "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
)

### Generating Module File
_generate_module_py(micro_epsilon_scancontrol_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(micro_epsilon_scancontrol_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages micro_epsilon_scancontrol_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetAvailableResolutions.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_py _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetResolution.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_py _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetResolution.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_py _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/SetFeature.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_py _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/cerlab/depowdering_ws/src/add_post_pro2/scancontrol/micro_epsilon_scancontrol_msgs/srv/GetFeature.srv" NAME_WE)
add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_py _micro_epsilon_scancontrol_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(micro_epsilon_scancontrol_msgs_genpy)
add_dependencies(micro_epsilon_scancontrol_msgs_genpy micro_epsilon_scancontrol_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS micro_epsilon_scancontrol_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/micro_epsilon_scancontrol_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/micro_epsilon_scancontrol_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/micro_epsilon_scancontrol_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/micro_epsilon_scancontrol_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/micro_epsilon_scancontrol_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(micro_epsilon_scancontrol_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
