# -*- coding: utf-8 -*-

from occupancy_grid import OccupancyGrid
from search_grid import SearchGrid
from grid_drawer import *
import time
from collections import deque
from cell import *
from planned_path import PlannedPath
from math import *

class PlannerBase(object):

    # This class implements the basic graphical support for the planners
    
    def __init__(self, title, occupancyGrid):
        self.title = title
        self.occupancyGrid = occupancyGrid
        self.searchGrid = None

        self.robotRadius = rospy.get_param('robot_radius', 0.2)

        rospy.loginfo("Occupancy grid dimensions = %dx%d", occupancyGrid.getWidthInCells(), occupancyGrid.getHeightInCells())

        self.handleChangeToOccupancyGrid()
        
        # Graphics and debug output support
        self.showGraphics = True
        self.pauseTimeInSeconds = 0
        self.iterationsBetweenGraphicsUpdate = 10000
        self.iterationsSinceLastGraphicsUpdate = 0
        self.searchGridDrawer = None
        self.occupancyGridDrawer = None
        self.windowHeightInPixels = 700
        self.runInteractively = False

    # This method is called if the occupancy grid changes
    def handleChangeToOccupancyGrid(self):
        raise NotImplementedError()

    # Pause for key presses?
    def setRunInteractively(self, runInteractively):

        # Record the decision here. We can only configure the drawer if it's already been
        # created.
        self.runInteractively = runInteractively
        if self.searchGridDrawer is not None:
            self.searchGridDrawer.setRunInterctively(runInteractively)
        
    # Show graphics?
    def setShowGraphics(self, showGraphics):
        self.showGraphics = showGraphics

    # Getter to get the graphics
    def getPlannerDrawer(self):
        return self.searchGridDrawer
        
    # Change the default window height in pixels
    def setWindowHeightInPixels(self, windowHeightInPixels):
        self.windowHeightInPixels = windowHeightInPixels
        
    # Set the pause time. When a window is updated, how long
    # should we pause for? Default is 0s.
    def setDrawingPauseTime(self, pauseTimeInSeconds):
        self.pauseTimeInSeconds = pauseTimeInSeconds
        
    # Set the number of iterations between drawning the window. The
    # default is 50
    def setIterationsBetweenDrawing(self, iterationsBetweenGraphicsUpdate):
        self.iterationsBetweenGraphicsUpdate = iterationsBetweenGraphicsUpdate

    # Reset the graphics; clear and close the window and then open a new window
    def resetGraphics(self):
        
        if (self.showGraphics == False):
            return
        
        # If we don't have the drawers set up yet, create them
        if (self.searchGridDrawer is None):
            self.createPlannerDrawer()
            self.searchGridDrawer.setRunInteractively(self.runInteractively)
            self.searchGridDrawer.open()
            self.occupancyGridDrawer.open()
        else:
            self.searchGridDrawer.reset()
            self.occupancyGridDrawer.reset()
            
        # Draw the start and end points
        self.searchGridDrawer.setStartAndGoal(self.start, self.goal)
        
        # Now force an initial draw
        self.drawCurrentState(forceUpdate=True)
        
    # Draw the output and sleep for the pause time.
    def drawCurrentState(self, forceUpdate=False):

        # If graphics is disabled, return
        if self.showGraphics is False:
            return
            
        # Check if we need to do an update
        self.iterationsSinceLastGraphicsUpdate = self.iterationsSinceLastGraphicsUpdate + 1
        if forceUpdate is False:     
            if (self.iterationsSinceLastGraphicsUpdate < self.iterationsBetweenGraphicsUpdate):
                return

        # Reset the draw counter
        self.iterationsSinceLastGraphicsUpdate = 0

        self.searchGridDrawer.update()
        self.occupancyGridDrawer.update()
        time.sleep(self.pauseTimeInSeconds)

    # Create the drawer which shows the planner's progress
    def createPlannerDrawer(self):
        self.searchGridDrawer = SearchGridDrawer('SG: ' + self.title, self.searchGrid, self.windowHeightInPixels)
        self.occupancyGridDrawer = OccupancyGridDrawer('OG :' + self.title, self.occupancyGrid, self.windowHeightInPixels)

    # Set the pause time
    def setPauseTime(self, pauseTimeInSeconds):
        self.pauseTimeInSeconds = pauseTimeInSeconds
