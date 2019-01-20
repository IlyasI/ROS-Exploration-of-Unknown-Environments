# ROS-Exploration-of-Unknown-Environments

Exploration and path finding in an unknown environment with ROS.

This report outlines the methods followed in order to create a fast exploration algorithm for application in
robotic systems. The explorer runs with a reactive controller which is used to manage sudden changes in the state
of the environment, therefore allowing for a smooth exploration process in completely unknown environments. The
framework used for simulation is ROS (Robotics Operating System) and the software was developed in Python.

The final report is provided in [Exploring_Unknown_Environments_REPORT.pdf](https://github.com/IlyasI/ROS-Exploration-of-Unknown-Environments/blob/master/Exploring_Unknown_Environments_REPORT.pdf). 

Created together with Nikolaos Manginas: https://github.com/nickmagginas/.

The initial codebase for ROS was provided for the assignment, the major additions we made to get a finished version are listed below.

## Major Additions:

In */src/comp313p/comp313p_explorer/explorer_node.py*: Modified to better explore the Map

In */src/comp313p/comp313p_explorer/explorer_node_base.py*: Small Changes to support Explorer

In */src/comp313p/comp313p_reactive_planner_controler/reactive_planner_controller.py*: Modified to Stop Simulation if current path is not tranversible

In */src/comp313p/comp313p_reactive_planner_controler/move2goal_controller.py*: Modified to include Metrics 

