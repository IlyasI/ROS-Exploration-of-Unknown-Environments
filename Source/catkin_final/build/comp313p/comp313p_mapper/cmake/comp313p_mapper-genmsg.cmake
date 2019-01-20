# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "comp313p_mapper: 1 messages, 2 services")

set(MSG_I_FLAGS "-Icomp313p_mapper:/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(comp313p_mapper_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg" NAME_WE)
add_custom_target(_comp313p_mapper_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "comp313p_mapper" "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv" NAME_WE)
add_custom_target(_comp313p_mapper_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "comp313p_mapper" "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv" ""
)

get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv" NAME_WE)
add_custom_target(_comp313p_mapper_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "comp313p_mapper" "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv" "comp313p_mapper/MapUpdate:std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/comp313p_mapper
)

### Generating Services
_generate_srv_cpp(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv"
  "${MSG_I_FLAGS}"
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/comp313p_mapper
)
_generate_srv_cpp(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/comp313p_mapper
)

### Generating Module File
_generate_module_cpp(comp313p_mapper
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/comp313p_mapper
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(comp313p_mapper_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(comp313p_mapper_generate_messages comp313p_mapper_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_cpp _comp313p_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_cpp _comp313p_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_cpp _comp313p_mapper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(comp313p_mapper_gencpp)
add_dependencies(comp313p_mapper_gencpp comp313p_mapper_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS comp313p_mapper_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/comp313p_mapper
)

### Generating Services
_generate_srv_eus(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv"
  "${MSG_I_FLAGS}"
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/comp313p_mapper
)
_generate_srv_eus(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/comp313p_mapper
)

### Generating Module File
_generate_module_eus(comp313p_mapper
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/comp313p_mapper
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(comp313p_mapper_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(comp313p_mapper_generate_messages comp313p_mapper_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_eus _comp313p_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_eus _comp313p_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_eus _comp313p_mapper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(comp313p_mapper_geneus)
add_dependencies(comp313p_mapper_geneus comp313p_mapper_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS comp313p_mapper_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/comp313p_mapper
)

### Generating Services
_generate_srv_lisp(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv"
  "${MSG_I_FLAGS}"
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/comp313p_mapper
)
_generate_srv_lisp(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/comp313p_mapper
)

### Generating Module File
_generate_module_lisp(comp313p_mapper
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/comp313p_mapper
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(comp313p_mapper_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(comp313p_mapper_generate_messages comp313p_mapper_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_lisp _comp313p_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_lisp _comp313p_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_lisp _comp313p_mapper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(comp313p_mapper_genlisp)
add_dependencies(comp313p_mapper_genlisp comp313p_mapper_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS comp313p_mapper_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/comp313p_mapper
)

### Generating Services
_generate_srv_nodejs(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv"
  "${MSG_I_FLAGS}"
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/comp313p_mapper
)
_generate_srv_nodejs(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/comp313p_mapper
)

### Generating Module File
_generate_module_nodejs(comp313p_mapper
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/comp313p_mapper
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(comp313p_mapper_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(comp313p_mapper_generate_messages comp313p_mapper_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_nodejs _comp313p_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_nodejs _comp313p_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_nodejs _comp313p_mapper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(comp313p_mapper_gennodejs)
add_dependencies(comp313p_mapper_gennodejs comp313p_mapper_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS comp313p_mapper_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/comp313p_mapper
)

### Generating Services
_generate_srv_py(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv"
  "${MSG_I_FLAGS}"
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/comp313p_mapper
)
_generate_srv_py(comp313p_mapper
  "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/comp313p_mapper
)

### Generating Module File
_generate_module_py(comp313p_mapper
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/comp313p_mapper
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(comp313p_mapper_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(comp313p_mapper_generate_messages comp313p_mapper_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/msg/MapUpdate.msg" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_py _comp313p_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/ChangeMapperState.srv" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_py _comp313p_mapper_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/ros_user/catkin_final/src/comp313p/comp313p_mapper/srv/RequestMapUpdate.srv" NAME_WE)
add_dependencies(comp313p_mapper_generate_messages_py _comp313p_mapper_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(comp313p_mapper_genpy)
add_dependencies(comp313p_mapper_genpy comp313p_mapper_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS comp313p_mapper_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/comp313p_mapper)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/comp313p_mapper
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(comp313p_mapper_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/comp313p_mapper)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/comp313p_mapper
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(comp313p_mapper_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/comp313p_mapper)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/comp313p_mapper
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(comp313p_mapper_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/comp313p_mapper)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/comp313p_mapper
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(comp313p_mapper_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/comp313p_mapper)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/comp313p_mapper\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/comp313p_mapper
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/comp313p_mapper
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/comp313p_mapper/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(comp313p_mapper_generate_messages_py std_msgs_generate_messages_py)
endif()
