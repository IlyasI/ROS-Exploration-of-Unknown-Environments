# This class handles the passive planner and controller. The passive planner controller simply
# drives the robots from start to goal and assumes that the robot can always get there. It cannot
# handle the case, for example, that an unexpected obstable appears.

import rospy

from comp313p_reactive_planner_controller.planner_controller_base import PlannerControllerBase

class PassivePlannerController(PlannerControllerBase):

    def __init__(self, occupancyGrid, planner, controller):
        PlannerControllerBase.__init__(self, occupancyGrid, planner, controller)

    def mapUpdateCallback(self, mapUpdateMessage):
        pass
    
    def driveToGoal(self, goal):

        # Exit if we need to
        if rospy.is_shutdown() is True:
            return False

        # Get the coal coordinate in cells
        goalCellCoords = self.occupancyGrid.getCellCoordinatesFromWorldCoordinates((goal.x,goal.y))

        # Set the start conditions to the current position of the robot
        pose = self.controller.getCurrentPose()
        start = (pose.x, pose.y)
        startCellCoords = self.occupancyGrid.getCellCoordinatesFromWorldCoordinates(start)

        # Plan a path using the current occupancy grid
        pathToGoalFound = self.planner.search(startCellCoords, goalCellCoords)

        # If we can't reach the goal, give up and return
        if pathToGoalFound is False:
            rospy.logwarn("Could not find a path to the goal at (%d, %d)", \
                          goalCellCoords[0], goalCellCoords[1])
            return False
            
        # Extract the path
        self.currentPlannedPath = self.planner.extractPathToGoal()

        # Drive along the path the goal
        goalReached = self.controller.drivePathToGoal(self.currentPlannedPath, goal.theta, self.planner.getPlannerDrawer())

        return goalReached
