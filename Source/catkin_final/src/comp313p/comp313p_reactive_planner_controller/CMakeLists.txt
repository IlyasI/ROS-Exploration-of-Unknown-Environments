cmake_minimum_required(VERSION 2.8.3)
project(comp313p_reactive_planner_controller)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
)

catkin_python_setup()

add_service_files(DIRECTORY srv FILES
  Goal.srv
  )

generate_messages(
  DEPENDENCIES
  std_msgs
)

catkin_package()
