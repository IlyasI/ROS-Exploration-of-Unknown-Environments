# -*- coding: utf-8 -*-

from shapely.geometry.polygon import Polygon
from shapely.geometry.point import Point
from nav_msgs.msg import OccupancyGrid
from nav_msgs.msg import MapMetaData

# This class represents the workspace, which is the representation of the actual environment.

class Workspace(object):

    def __init__(self, extent):
        self.extent = extent
        self.objects = {}
 
    # Add new object if it's not been added already
    def addObject(self, newObject):
        if (newObject not in self.objects):
            self.objects[newObject] = None

    def getExtent(self):
        return self.extent
        
    def getObjects(self):
        return self.objects.keys()

    # Check if the test coordinates lie in free space or not.
    def coordinatesInFreeSpace(self, testCoordinates):
        testPoint = Point(testCoordinates)
        return self.polygonInFreeSpace(testPoint)

    # Test if the object lies in free space or not    
    def objectInFreeSpace(self, testObject, ignoreBorder = False):
        if (testObject.getIntersectable() is False):
            return True
        return self.polygonInFreeSpace(testObject.getGeometryInWorkspace(),
                                       ignoreBorder)

    # This method checks if the test object collides with any
    # object. There are many ways to efficiently test self. self
    # method, however, uses none of them.
    def polygonInFreeSpace(self, testGeometry, ignoreBorder = False):
        
        # If the geometry falls outside the extent of the workspace, it's not free
        bounds = testGeometry.bounds
        
        if (ignoreBorder == False):
            if ((bounds[0] < 0) | (bounds[1] < 0) | (bounds[2] > self.extent[0])
                | (bounds[3] > self.extent[1])):
                return False
        
        for o in self.objects.keys():
            # Do not intersect with non-intersectables
            if o.getIntersectable() is False:
                continue            
            # Do not intersect with self
            objectGeometry = o.getGeometryInWorkspace()
            if (objectGeometry == testGeometry):
                continue
            # If the test geometry touches any other object, then it's not in free space
            if (testGeometry.disjoint(objectGeometry) == False):
                return False
        return True
    
    # Iterate over all the objects and compute the intersected geometry
    def getIntersections(self, testGeometry):
        intersections = list()
        
        for o in self.objects.keys():        
            # Do not intersect with self
            objectGeometry = o.getGeometryInWorkspace()
            if (objectGeometry == testGeometry):
                continue
            i = testGeometry.intersection(objectGeometry.buffer(0.01))
            if (i.is_empty is False):
                intersections.append(i)
                
        return intersections

        
    def getROSOccupancyMap(self, resolution):
        # First figure out how large the occupancy grid needs to be in cells
        widthInCells = math.ceil(self.extent[0] / resolution))
        heightInCells = int(math.ceil(self.extent[1] / resolution))

        # Create the occupancy grid object
        rosMAP = OccupancyGrid()

        # Assign the map meta data
        rosMap.info = MapMetaData()
        rosMAP.info.resolution = resolution
        rosMAP.info.width = uint(widthInCells)
        rosMAP.info.height = uint(heightInCells)
        rosMAP.info.pose = new Pose()
        

        ROSMAP(widthInCells, heightInCells, resolution)

        # First add a border. This stops STDR falling off the edge of the world.
        # Don't have time to work out what the proper Python iterator is for this.
        for y in range(heightInCells):
            occupancyGrid.grid[0][y] = 1
            occupancyGrid.grid[widthInCells-1][y] = 1

        for x in range(1, widthInCells-1):
            occupancyGrid.grid[x][0] = 1
            occupancyGrid.grid[x][heightInCells] = 1
    
        # Rasterise into cells. This can be SLOW
        print 'Rasterising workspace into cells'
        lastPercentPrint = 10
        print 'Finished 0.0%'
    
        for x in range(widthInCells):
        
            percentProgress = math.floor(100.0 * x / widthInCells)
            if (percentProgress > lastPercentPrint):
                print 'Finished ' + str(percentProgress) + '%'
            lastPercentPrint = lastPercentPrint + 10
        
            for y in range(heightInCells):
                xl = x * resolution + 1e-3
                xr = xl + resolution - 2e-3
                yb = y * resolution + 1e-3
                yt = yb + resolution - 2e-3
                cellPolygon = Polygon(((xl, yb), (xr, yb), (xr, yt), (xl, yt), (xl, yb)))
                if self.polygonInFreeSpace(cellPolygon, ignoreBorder = True) == True:
                    occupancyGrid.grid[x][y] = 0
                else:
                    occupancyGrid.grid[x][y] = 1

        return occupancyGrid

        

