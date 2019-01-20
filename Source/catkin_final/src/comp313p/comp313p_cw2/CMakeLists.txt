cmake_minimum_required(VERSION 2.8.3)
project(comp313p_cw2)


find_package(catkin REQUIRED COMPONENTS roslaunch)
catkin_package()
roslaunch_add_file_check(launch)

# Install launcher files
file(GLOB launch_files "launch/*")
install(FILES ${launch_files} DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})

# Install map files
file(GLOB scenario_files "scenarios/*/*")
install(FILES ${scenario_files} DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION})
