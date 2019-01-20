# Install script for directory: /home/ros_user/catkin_final/src/comp313p/comp313p_cw2

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/ros_user/catkin_final/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/ros_user/catkin_final/build/comp313p/comp313p_cw2/catkin_generated/installspace/comp313p_cw2.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/comp313p_cw2/cmake" TYPE FILE FILES
    "/home/ros_user/catkin_final/build/comp313p/comp313p_cw2/catkin_generated/installspace/comp313p_cw2Config.cmake"
    "/home/ros_user/catkin_final/build/comp313p/comp313p_cw2/catkin_generated/installspace/comp313p_cw2Config-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/comp313p_cw2" TYPE FILE FILES "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/package.xml")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/comp313p_cw2" TYPE FILE FILES
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/launch/part_3_2_reactive_planner.launch"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/launch/mapping_simple_plus_scenario.launch"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/launch/map_test.launch"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/launch/part_4_reactive_exploration_mapping.launch"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/launch/part_1_2_mapping.launch"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/launch/part_2_exploration_mapping.launch"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/launch/part_1_1_mapping.launch"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/launch/mapping_simple_walls_scenario.launch"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/launch/part_3_1_reactive_planner.launch"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/comp313p_cw2" TYPE FILE FILES
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/scenarios/factory/part_3_1_reachable_goals.txt"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/scenarios/factory/s02_goals.txt"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/scenarios/factory/part_3_2_unreachable_goal.txt"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/scenarios/simple_maps/simple_walls_goal.txt"
    "/home/ros_user/catkin_final/src/comp313p/comp313p_cw2/scenarios/simple_maps/simple_plus_goal.txt"
    )
endif()

