# -*- coding: utf-8 -*-

from cell import *

import math

def clamp(x, minimum, maximum):
    return max(minimum, min(x, maximum))

class SearchGrid(object):

    # This class stores the state of a search grid to illustrate forward search

    def __init__(self, width, height, robotRadius):
        self.width = width
        self.height = height
        self.robotRadius = robotRadius

    # Construct the class using an occupancy grid object
    @classmethod
    def fromOccupancyGrid(cls, occupancyGrid, robotRadius):

        self = cls(occupancyGrid.getWidthInCells(), occupancyGrid.getHeightInCells(), robotRadius)

        self.occupancyGrid = occupancyGrid
        
        # Populate the search grid from the occupancy grid
        self.updateFromOccupancyGrid()
        
        return self

    def getExtent(self):
        return self.occupancyGrid.getExtent()

    def getExtentInCells(self):
        return self.occupancyGrid.getExtentInCells()

    def getResolution(self):
        return self.occupancyGrid.getResolution()

    def getRobotRadius(self):
        return self.robotRadius

    # Reset the state of the search grid to the value of the occupancy grid

    def getCellFromCoords(self, coords):
        return self.grid[coords[0]][coords[1]]
    
    # Pre process the map so that we expand all the obstacles by a
    # circle of radius robotRadius metres. This is a way to account
    # for the geometry. Technically, this is known as taking the
    # Minkowski sum. Practically, this is a really bad way to write
    # this! It also currently uses the crude aproximation that the
    # robot shape is a square
    def updateFromOccupancyGrid(self):

        # Compute the size we need to grow the obstacle
        s = int(math.ceil(self.robotRadius / self.occupancyGrid.getResolution()))

        widthInCells = self.occupancyGrid.getWidthInCells()
        heightInCells = self.occupancyGrid.getHeightInCells()
        
        # Allocate the new occupancy grid, which will contain the new obstacles
        newGrid = [[Cell((x, y), self.occupancyGrid.getCell(x,y)) for y in range(heightInCells)] \
                   for x in range(widthInCells)]

        print 'newGrid size = ' + str(widthInCells) + 'x' + str(heightInCells)
        
        # Iterate through all the cells in the first grid. If they are
        # marked as OBSTRUCTED, set all cells within radius
        # robotRadius to occupied as well. Note the magic +1 in the
        # range. This is needed because range(a,b) actually gives [a,
        # a+1, ..., b-1]. See
        # https://www.pythoncentral.io/pythons-range-function-explained/
        for x in range(widthInCells):
            for y in range(heightInCells):
                if self.occupancyGrid.getCell(x,y) == 1:
                    for gridX in range(clamp(x-s, 0, widthInCells),clamp(x+s+1, 0, widthInCells)):
                        for gridY in range(clamp(y-s, 0, heightInCells),clamp(y+s+1, 0, heightInCells)):
                            newGrid[gridX][gridY] = Cell((gridX, gridY), 1)

        self.grid = newGrid
