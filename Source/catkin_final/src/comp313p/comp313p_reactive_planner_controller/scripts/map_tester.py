#!/usr/bin/env python

import sys
import rospy
from nav_msgs.srv import GetMap
from comp313p_reactive_planner_controller.occupancy_grid import OccupancyGrid
from comp313p_reactive_planner_controller.search_grid import SearchGrid
from comp313p_reactive_planner_controller.grid_drawer import GridDrawer

# This class pings the map server and gets the map. It then draws it to the screen.

class MapTester(object):

    def __init__(self):
        rospy.loginfo('Waiting for static_map to become available.')
        print "Hello1"
        rospy.wait_for_service('static_map') 
        print "Hello2"
        self.mapServer = rospy.ServiceProxy('static_map', GetMap)
        print "Hello3"

    def getMapFromServer(self):
        print "starting"
        resp = self.mapServer()
        print "got from server"
        occupancyGrid = OccupancyGrid(resp.map.info.width, resp.map.info.height, resp.map.info.resolution)
        print "make grid"
        occupancyGrid.setFromDataArrayFromMapServer(resp.map.data)
        searchGrid = SearchGrid.fromOccupancyGrid(occupancyGrid)
        print resp.map.data
        gridDrawer = GridDrawer(searchGrid)
        gridDrawer.update()
        gridDrawer.waitForKeyPress()

        pass
        
if __name__ == '__main__':
    mapTester = MapTester()
    mapTester.getMapFromServer()

  
