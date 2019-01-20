# -*- coding: utf-8 -*-

import math
import rospy
import copy
 
def clamp(x, minimum, maximum):
    return max(minimum, min(x, maximum))

# This class stores the occupancy grid. This is a "chessboard-like"
# representation of the environment. The environment is represented by
# a set of square cells. Each cell encodes whether that bit of the
# environment is free, or whether it is blocked. A "0" says that a
# cell is free and so the robot can travel over it. A "1" means that
# it is blocked and the robot cannot travel over it.

class OccupancyGrid(object):

    # Construct a new occupancy grid with a given width and
    # height. The resolution says the length of the side of each cell
    # in metres. By default, all the cells are set to "0" which means
    # that there are no obstacles.
    def __init__(self, widthInCells, heightInCells, resolution, initialValue = 0.0):
        self.scale = 1
        self.widthInCells = widthInCells
        self.heightInCells = heightInCells
        self.extentInCells = (self.widthInCells, self.heightInCells)
        self.resolution = resolution
        self.width = widthInCells * self.resolution
        self.height = heightInCells * self.resolution
        self.extent = (self.width, self.height)
        self.grid = [[initialValue for y in range(self.heightInCells)] for x in range(self.widthInCells)]


    # Construct the class from a map update message
    @classmethod
    def fromMapUpdateMessage(cls, mapUpdateMessage):

        self = cls(mapUpdateMessage.extentInCells[0], mapUpdateMessage.extentInCells[1], mapUpdateMessage.resolution)
        self.scale = mapUpdateMessage.scale

        return self
        
    # Set the scale for the map.
    def setScale(self, scale):
        self.scale = scale

    def getScale(self):
        return self.scale
        
    def getExtent(self):
        return self.extent

    def getExtentInCells(self):
        return self.extentInCells

    def getGridAsVector(self):
        return sum(self.grid, [])

    def updateGridFromVector(self, gridAsVector):
        # Make sure it's the right length
        assert len(gridAsVector) == self.widthInCells * self.heightInCells

        # Now assign; adapted from https://stackoverflow.com/questions/14681609/create-a-2d-list-out-of-1d-list
        #self.grid = [gridAsVector[i:i+self.widthInCells] for i in xrange(0, len(gridAsVector), self.widthInCells)]
        self.grid = [gridAsVector[i:i+self.heightInCells] for i in xrange(0, len(gridAsVector), self.heightInCells)]
    
    def scaleEmptyMap(self):

        planning_map = [[self.getCell(0, 0) for y in range(self.heightInCells / self.scale)] for x in
                        range(self.widthInCells / self.scale)]

        self.grid = planning_map

        self.widthInCells = self.widthInCells / self.scale
        self.heightInCells = self.heightInCells / self.scale
        self.extentInCells = (self.widthInCells, self.heightInCells)

        self.resolution = self.resolution * self.scale

        self.width = self.widthInCells * self.resolution
        self.height = self.heightInCells * self.resolution
        self.extent = (self.width, self.height)

    def clearMap(self, initialValue=0):
        """
        Function to clear the entire map
        :param val: cell value
        :return:
        """
        self.grid = [[initialValue for y in range(self.heightInCells)] for x in
                        range(self.widthInCells)]

    # Set the data from the array received from the map server. The
    # memory layout is different, so we have to flip it here. The map
    # server also scales 100 to mean free and 0 to mean blocked. We
    # use 0 for free and 1 for blocked.
    def setFromDataArrayFromMapServer(self, data):
        print("Length of Map: {}".format(len(data)))
        print("Map Resolution: {}".format(str(self.resolution)))
        print("Map Width: {}".format(self.width))
        print("Map Height: {}".format(self.height))
        print("Map Width (cells): {}".format(self.widthInCells))
        print("Map Height (cells): {}".format(self.heightInCells))

        # Copy the data from the occupancy grid message
        self.grid = [[0 for y in range(self.heightInCells)] for x in range(self.widthInCells)]

        for x in range(self.widthInCells):
            for y in range(self.heightInCells):
                self.grid[x][self.heightInCells-y-1] = float(data[len(data)-(self.widthInCells-x-1)-self.widthInCells*y-1]) \
                                                       / 100.0
                
        # Process the map
        self.scaleMap()
                         
    def scaleMap(self):
    
        planning_map = [[0 for y in range(self.heightInCells/self.scale)] for x in range(self.widthInCells/self.scale)]
        print("Planning map size\nWidth: {}\nHeight: {}".format(len(planning_map), len(planning_map[0])))

        plan_x_range = range(self.widthInCells)[0::self.scale]
        plan_y_range = range(self.heightInCells)[0::self.scale]

        # Checks every cell in the range and if any is occupied the scaled is occupied
        for x in range(len(plan_x_range)):
            for y in range(len(plan_y_range)):

                # if it is the last planning cell just use that single cell
                if x == len(plan_x_range) - 1:
                    x_range = [plan_x_range[x]]
                else:
                    x_range = range(plan_x_range[x], plan_x_range[x+1] - 1)

                if y == len(plan_y_range) - 1:
                    y_range = [plan_y_range[y]]
                else:
                    y_range = range(plan_y_range[y], plan_y_range[y + 1] - 1)

                # Start with the planning cell being unoccupied and search for an occupied cell as soon as you find one
                # stop searching.
                occupied = 0

                for x_check in x_range:

                    if occupied == 1:
                        break

                    for y_check in y_range:
                        occupied = max(occupied, self.grid[x_check][y_check])

                        if occupied == 1:
                            break

                planning_map[x][y] = occupied

        self.widthInCells = self.widthInCells / self.scale
        self.heightInCells = self.heightInCells / self.scale
        self.extentInCells = (self.widthInCells, self.heightInCells)
        self.resolution = self.resolution * self.scale
        self.width = self.widthInCells * self.resolution
        self.height = self.heightInCells * self.resolution
        self.extent = (self.width, self.height)
        self.grid = planning_map

    # The width of the occupancy map in cells
    def getWidth(self):
        return self.width

    # The height of the occupancy map in cells                
    def getHeight(self):
        return self.height

    # The resolution of each cell (the length of its side in metres)
    def getResolution(self):
        return self.resolution
    
    # Take a position in world coordinates (i.e., m) and turn it into
    # cell coordinates. Clamp the value so that it always falls within
    # the grid. The conversion uses integer rounding.
    def getCellCoordinatesFromWorldCoordinates(self, worldCoords):

        cellCoords = (clamp(int(worldCoords[0] / self.resolution), 0, self.widthInCells - 1), \
                      clamp(int(worldCoords[1] / self.resolution), 0, self.heightInCells - 1))
        
        return cellCoords
    
    # Convert a position in cell coordinates to world coordinates. The
    # conversion uses the centre of a cell, hence the mysterious 0.5
    # addition. No clamping is currently done.
    def getWorldCoordinatesFromCellCoordinates(self, cellCoords):

        worldCoords = ((cellCoords[0] + 0.5) * self.resolution, \
                      (cellCoords[1] + 0.5) * self.resolution)

        return worldCoords
 
    # The width of the occupancy map in cells                
    def getWidthInCells(self):
        return self.widthInCells

    # The height of the occupancy map in cells                
    def getHeightInCells(self):
        return self.heightInCells

    def getExtentInCells(self):
        return self.extentInCells

    # The resolution of each cell (the length of its side in metres)
    def getResolution(self):
        return self.resolution

    # Get the status of a cell.
    def getCell(self, x, y):
        return self.grid[x][y]

    # Set the status of a cell.
    def setCell(self, x, y, c):
        self.grid[x][y] = c
    
    # Take a position in workspace coordinates (i.e., m) and turn it into
    # cell coordinates. Clamp the value so that it always falls within
    # the grid. The conversion uses integer rounding.
    def getCellCoordinatesFromWorldCoordinates(self, worldCoords):

        cellCoords = (clamp(int(round(worldCoords[0] / self.resolution)), 0, self.extentInCells[0]), \
                      clamp(int(round(worldCoords[1] / self.resolution)), 0, self.extentInCells[1]))
        
        return cellCoords
    
    # Convert a position in cell coordinates to workspace coordinates. The
    # conversion uses the centre of a cell, hence the mysterious 0.5
    # addition. No clamping is currently done.
    def getWorldCoordinatesFromCellCoordinates(self, cellCoords):

        worldCoords = ((cellCoords[0] + 0.5) * self.resolution, \
                      (cellCoords[1] + 0.5) * self.resolution)

        return worldCoords
