# This class manages the key logic for the reactive planner and
# controller. This monitors the the robot mtion.

import rospy
import threading
from cell import CellLabel
from planner_controller_base import PlannerControllerBase
from comp313p_mapper.msg import *
import random

class ReactivePlannerController(PlannerControllerBase):

    def __init__(self, occupancyGrid, planner, controller):
        PlannerControllerBase.__init__(self, occupancyGrid, planner, controller)



        self.mapUpdateSubscriber = rospy.Subscriber('updated_map', MapUpdate, self.mapUpdateCallback)
        self.gridUpdateLock =  threading.Condition()

    def mapUpdateCallback(self, mapUpdateMessage):
        print('+++ Map Update CALLBACK!')
        # Update the occupancy grid and search grid given the latest map update
        self.gridUpdateLock.acquire()
        self.occupancyGrid.updateGridFromVector(mapUpdateMessage.occupancyGrid)
        self.planner.handleChangeToOccupancyGrid()
        self.gridUpdateLock.release()

        # If we are not currently following any route, drop out here.
        if self.currentPlannedPath is None:
            return
        self.checkIfPathCurrentPathIsStillGood()

    def checkIfPathCurrentPathIsStillGood(self):
        plannedPathList = []
        print('+++ Check Path Called')
        #print('+++ LENGTH OF PATH: ',len(self.currentPlannedPath.waypoints))
        for i in self.currentPlannedPath.waypoints:
            #print('+++ Current Waypoint: ',self.occupancyGrid.getCell(i.coords[0],i.coords[1]))
            #print('+++ Current Waypoint:', cell, 'Current label:',label)

            if self.occupancyGrid.getCell(i.coords[0],i.coords[1]) == 1:
                print('+++ Stopping driving to current goal!')
                self.controller.stopDrivingToCurrentGoal()

        return True

        # This methods needs to check if the current path, whose
        # waypoints are in self.currentPlannedPath, can still be
        # traversed
                
        # If the route is not viable any more, call
        # self.controller.stopDrivingToCurrentGoal()

    def driveToGoal(self, goal):

        # Get the goal coordinate in cells
        goalCellCoords = self.occupancyGrid.getCellCoordinatesFromWorldCoordinates((goal.x,goal.y))

        # Reactive planner main loop - keep iterating until the goal is reached or the robot gets
        # stuck.

        goalReached = False
        
        while (goalReached is False) & (rospy.is_shutdown() is False):

            # Set the start conditions to the current position of the robot
            pose = self.controller.getCurrentPose()
            start = (pose.x, pose.y)
            startCellCoords = self.occupancyGrid.getCellCoordinatesFromWorldCoordinates(start)

            print 'Planning a new path: start=' + str(start) + '; goal=' + str(goal)
            
            # Plan a path using the current occupancy grid
            self.gridUpdateLock.acquire()
            pathToGoalFound = self.planner.search(startCellCoords, goalCellCoords)
            self.gridUpdateLock.release()

            # If we can't reach the goal, give up and return
            if pathToGoalFound is False:
                rospy.logwarn("Could not find a path to the goal at (%d, %d)", \
                              goalCellCoords[0], goalCellCoords[1])
                #pathToGoalFound = self.planner.search(startCellCoords, (goalCellCoords[0],goalCellCoords[1])) 
                return False           
            # Extract the path
            self.currentPlannedPath = self.planner.extractPathToGoal()

            # Drive along the path towards the goal. This returns True
            # if the goal was successfully reached. The controller
            # should stop the robot and return False if the
            # stopDrivingToCurrentGoal method is called.
            goalReached = self.controller.drivePathToGoal(self.currentPlannedPath, \
                                                          goal.theta, self.planner.getPlannerDrawer())

            rospy.logerr('goalReached=%d', goalReached)

        return goalReached
            
            
