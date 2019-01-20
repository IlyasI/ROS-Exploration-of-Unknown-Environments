# -*- coding: utf-8 -*-

import rospy
from search_grid import SearchGrid
from cell import *
from graphics import Rectangle
from graphics import Point
import graphics

# This file contains some generic routines for managing the graphics display window.

class BaseDrawer(object):

    # Create the graphics window, and figure out the scale
    def __init__(self, title, extent, maximumWindowHeightInPixels):
        # Make sure that the height of the window is less than the specified maximum
        self.pixelsPerMetre = float(maximumWindowHeightInPixels) / float(extent[1])
        self.width = 2 + extent[0] * self.pixelsPerMetre
        self.height = 2 + extent[1] * self.pixelsPerMetre
        self.title = title
        self.start = None
        self.goal = None
        self.runInteractively = False
        self.cellExtent = extent
        
        # Work out the cell size
        cellSize = self.pixelsPerMetre

        # Set up the rectangles which will be drawn        
        self.rectangles = [[Rectangle(Point(i * cellSize, (extent[1] - j - 1) * cellSize), \
                                    Point((i+1)*cellSize, (extent[1] - j)*cellSize)) \
                            for j in range(extent[1])] for i in range(extent[0])]

        
    # Open the window and intialise the graphics
    def open(self):
        self.window = graphics.GraphWin(self.title, self.width, self.height, autoflush = False)
        self.initialize()
        graphics.update(5)

    # Close the window
    def close(self):
        if (self.window is not None):
            self.window.close()
            self.window = None

    # Reset the graphics to the default state
    def reset(self):
        raise NotImplementedError()

    # Reset the graphics to the default state
    def update(self):
        raise NotImplementedError()

    # Convert workspace coordinates to window coordinates. This has to
    # take account of the scaling and the fact that graphics packages
    # use a left handed coordinate system with the origin in the top
    # left hand corner.
    def convertWorkspaceCoordinateToScreenCoordinate(self, workspaceCoordinate):
        screenCoordinate = (1 + workspaceCoordinate[0] * self.pixelsPerMetre, 
                             1 + self.height - workspaceCoordinate[1] * self.pixelsPerMetre)
        return screenCoordinate
 
    def initialize(self):
        for i in range(self.cellExtent[0]):
            for j in range(self.cellExtent[1]):
                self.rectangles[i][j].draw(self.window)

    # Set the start and goal. The type stored here depends upon the planning algorithm 
    def setStartAndGoal(self, start, goal):
        self.start = start
        self.goal = goal

    # Specify if the drawer runs interactively. This causes it to pause
    def setRunInteractively(self, runInteractively):
        self.runInteractively = runInteractively

    def flushAndUpdateWindow(self):
        # Flush the results
        self.window.update()
        self.window.flush()
                          
    def waitForKeyPress(self):

        # If not running interactively, return
        if not self.runInteractively:
            return
        
        # This always hangs for me:
        #self.win.getKey()
        try:
            input("Press enter to continue...")
        except SyntaxError:
            pass

class SearchGridDrawer(BaseDrawer):

    def __init__(self, title, searchGrid, maximumWindowHeightInPixels):
        BaseDrawer.__init__(self, title, searchGrid.getExtentInCells(), 
                            maximumWindowHeightInPixels)
        self.searchGrid = searchGrid;
                
    def reset(self):
        self.start = None
        self.goal = None

    # Go through and draw all objects        
    def update(self):
        
        # Draw the current plan
        self.drawPlanGraphics()
        
        # Overlay on top the start and the goal
        self.drawStartAndGoalGraphics()

        # Flush the graphics
        self.flushAndUpdateWindow()

    def setSearchGrid(self,new_sg):
	self.searchGrid=new_sg
            
    def drawPlanGraphics(self):
        
        # First iterate over all the cells and mark them up
        cellExtent = self.searchGrid.getExtentInCells()
        for i in range(cellExtent[0]):
            if rospy.is_shutdown():
                return
            for j in range(cellExtent[1]):
                cellLabel = self.searchGrid.getCellFromCoords((i, j)).label
                if cellLabel == CellLabel.OBSTRUCTED:
                    colour = 'purple'		    
                elif cellLabel == CellLabel.START:
                    colour = 'green'
                elif cellLabel == CellLabel.GOAL:
                    colour = 'blue'
                elif cellLabel == CellLabel.UNVISITED:
                    colour = 'gray'
	  	    
                elif cellLabel == CellLabel.DEAD:
                    colour = 'black'
                else:
                    colour = 'white'
                self.rectangles[i][j].setFill(colour);

    # Draw the path with a custom colour
    def drawPathGraphicsWithCustomColour(self, path, colour):
        for p in path.waypoints:
            self.rectangles[p.coords[0]][p.coords[1]].setFill(colour)
            
        self.drawStartAndGoalGraphics()
        self.window.update()
        self.window.flush()

    # Draw the path
    def drawPathGraphics(self, path):
        self.drawPathGraphicsWithCustomColour(path, 'yellow')
 
    def drawStartAndGoalGraphics(self):
        # Now manually mark up the start and goal cells
        if (self.start is not None):
            coords = self.start.coords
            self.rectangles[coords[0]][coords[1]].setFill('green')

        if (self.goal is not None):
            coords = self.goal.coords
            self.rectangles[coords[0]][coords[1]].setFill('blue')

class OccupancyGridDrawer(BaseDrawer):

    def __init__(self, title, occupancyGrid, maximumWindowHeightInPixels):
        BaseDrawer.__init__(self, title, occupancyGrid.getExtentInCells(), 
                            maximumWindowHeightInPixels)
        self.occupancyGrid = occupancyGrid;

    def drawGrid(self):

        # Draw the cells using shading
        cellExtent = self.occupancyGrid.getExtentInCells()
        for i in range(cellExtent[0]):
            if rospy.is_shutdown():
                return
            for j in range(cellExtent[1]):
                cellWeight = 1.0 - self.occupancyGrid.getCell(i, j)
                hexWeight = '{:02x}'.format(int(cellWeight*255))
                colour = '#' + hexWeight + hexWeight + hexWeight
                self.rectangles[i][j].setFill(colour);

                
    def reset(self):
        # Nothing to do - rendering is stateless
        pass

    # Go through and draw all objects        
    def update(self):
        
        # Draw the current plan
        self.drawGrid()

        # Flush the graphics
        self.flushAndUpdateWindow()
