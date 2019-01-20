import rospy
import threading
import math

from comp313p_mapper.msg import *
from comp313p_mapper.srv import *
from comp313p_reactive_planner_controller.srv import *
from comp313p_reactive_planner_controller.occupancy_grid import OccupancyGrid
from comp313p_reactive_planner_controller.grid_drawer import OccupancyGridDrawer
from geometry_msgs.msg  import Twist

class ExplorerNodeBase(object):

    def __init__(self):
        rospy.init_node('explorer')

        # Get the drive robot service
        rospy.loginfo('Waiting for service drive_to_goal')
        rospy.wait_for_service('drive_to_goal')
        self.driveToGoalService = rospy.ServiceProxy('drive_to_goal', Goal)
        rospy.loginfo('Got the drive_to_goal service')

        self.waitForGoal =  threading.Condition()
        self.waitForDriveCompleted =  threading.Condition()
        self.goal = None

        # Subscribe to get the map update messages
        self.mapUpdateSubscriber = rospy.Subscriber('updated_map', MapUpdate, self.mapUpdateCallback)
        self.noMapReceived = True

        # Clear the map variables
        self.occupancyGrid = None
        self.deltaOccupancyGrid = None

        # Flags used to control the graphical output. Note that we
        # can't create the drawers until we receive the first map
        # message.
        self.showOccupancyGrid = rospy.get_param('show_explorer_occupancy_grid', True)
        self.showDeltaOccupancyGrid = rospy.get_param('show_explorer_delta_occupancy_grid', True)
        self.occupancyGridDrawer = None
        self.deltaOccupancyGridDrawer = None
        self.visualisationUpdateRequired = False

        # Request an initial map to get the ball rolling
        rospy.loginfo('Waiting for service request_map_update')
        rospy.wait_for_service('request_map_update')
        mapRequestService = rospy.ServiceProxy('request_map_update', RequestMapUpdate)
        mapUpdate = mapRequestService(True)

        while mapUpdate.initialMapUpdate.isPriorMap is True:
            self.kickstartSimulator()
            mapUpdate = mapRequestService(True)

	# ------------------------ Register Width and Heights ------------------------ #

	self.width_range = range(0,self.occupancyGrid.getWidthInCells())
	self.height_range = range(0,self.occupancyGrid.getHeightInCells())
            
        self.mapUpdateCallback(mapUpdate.initialMapUpdate)
        
    def mapUpdateCallback(self, msg):
        rospy.loginfo("map update received")
        
        # If the occupancy grids do not exist, create them
        if self.occupancyGrid is None:
            self.occupancyGrid = OccupancyGrid.fromMapUpdateMessage(msg)
            self.deltaOccupancyGrid = OccupancyGrid.fromMapUpdateMessage(msg)

        # Update the grids
        self.occupancyGrid.updateGridFromVector(msg.occupancyGrid)
        self.deltaOccupancyGrid.updateGridFromVector(msg.deltaOccupancyGrid)
        
        # Update the frontiers
        self.updateFrontiers()

        # Flag there's something to show graphically
        self.visualisationUpdateRequired = True

    # This method determines if a cell is a frontier cell or not. A
    # frontier cell is open and has at least one neighbour which is
    # unknown.
    def isFrontierCell(self, x, y):

        # Check the cell to see if it's open
        if self.occupancyGrid.getCell(x, y) != 0:
            return False

        # Check the neighbouring cells; if at least one of them is unknown, it's a frontier
        return self.checkIfCellIsUnknown(x, y, -1, -1) | self.checkIfCellIsUnknown(x, y, 0, -1) \
            | self.checkIfCellIsUnknown(x, y, 1, -1) | self.checkIfCellIsUnknown(x, y, 1, 0) \
            | self.checkIfCellIsUnknown(x, y, 1, 1) | self.checkIfCellIsUnknown(x, y, 0, 1) \
            | self.checkIfCellIsUnknown(x, y, -1, 1) | self.checkIfCellIsUnknown(x, y, -1, 0)
            
    def checkIfCellIsUnknown(self, x, y, offsetX, offsetY):
        newX = x + offsetX
        newY = y + offsetY
        return (newX >= 0) & (newX < self.occupancyGrid.getWidthInCells()) \
            & (newY >= 0) & (newY < self.occupancyGrid.getHeightInCells()) \
            & (self.occupancyGrid.getCell(newX, newY) == 0.5)

    # You should provide your own implementation of this method which
    # maintains and updates the frontiers.  The method should return
    # True if any outstanding frontiers exist. If the method returns
    # False, it is assumed that the map is completely explored and the
    # explorer will exit.
    def updateFrontiers(self):
        raise NotImplementedError()

    def chooseNewDestination(self):
        raise NotImplementedError()

    def destinationReached(self, goalReached):
        raise NotImplementedError()

    def updateVisualisation(self):

        # If we don't need to do an update, simply flush the graphics
        # to make sure everything appears properly in VNC
        
        if self.visualisationUpdateRequired is False:

            if self.occupancyGridDrawer is not None:
                self.occupancyGridDrawer.flushAndUpdateWindow()

            if self.deltaOccupancyGridDrawer is not None:
                self.deltaOccupancyGridDrawer.flushAndUpdateWindow()

            return
                

        # Update the visualisation; note that we can only create the
        # drawers here because we don't know the size of the map until
        # we get the first update from the mapper.
        if self.showOccupancyGrid is True:
            if self.occupancyGridDrawer is None:
                windowHeight = rospy.get_param('maximum_window_height_in_pixels', 600)
                self.occupancyGridDrawer = OccupancyGridDrawer('Explorer Node Occupancy Grid',\
                                                               self.occupancyGrid, windowHeight)
	        self.occupancyGridDrawer.open()
	    self.occupancyGridDrawer.update()

        if self.showDeltaOccupancyGrid is True:
            if self.deltaOccupancyGridDrawer is None:
                windowHeight = rospy.get_param('maximum_window_height_in_pixels', 600)
                self.deltaOccupancyGridDrawer = OccupancyGridDrawer('Explorer Node Delta Occupancy Grid',\
                                                                    self.deltaOccupancyGrid, windowHeight)
	        self.deltaOccupancyGridDrawer.open()
	    self.deltaOccupancyGridDrawer.update()

        self.visualisationUpdateRequired = False

    def sendGoalToRobot(self, goal):
        rospy.logwarn("Sending the robot to " + str(goal))
        try:
            response = self.driveToGoalService(goal[0], goal[1], 0)
            return response.reachedGoal
        except rospy.ServiceException, e:
            print "Service call failed: %s"%e
            return False

    # Special case. If this is the first time everything has
    # started, stdr needs a kicking to generate the first
    # laser message. Telling it to take a very small movement appears to be sufficient
    def kickstartSimulator(self):
        velocityPublisher = rospy.Publisher('/robot0/cmd_vel', Twist, queue_size=1)
        velocityMessage = Twist()
        velocityPublisher.publish(velocityMessage)
        rospy.sleep(1)
            
    class ExplorerThread(threading.Thread):
        def __init__(self, explorer):
            threading.Thread.__init__(self)
            self.explorer = explorer
            self.running = False
            self.completed = False;


        def isRunning(self):
            return self.running

        def hasCompleted(self):
            return self.completed

        def run(self):

            self.running = True

            while (rospy.is_shutdown() is False) & (self.completed is False):

                # Special case. If this is the first time everything
                # has started, stdr needs a kicking to generate laser
                # messages. To do this, we get the robot to
                

                # Create a new robot waypoint if required
                newDestinationAvailable, newDestination = self.explorer.chooseNewDestination()

                # Convert to world coordinates, because this is what the robot understands
                if newDestinationAvailable is True:
                    print 'newDestination = ' + str(newDestination)
                    newDestinationInWorldCoordinates = self.explorer.occupancyGrid.getWorldCoordinatesFromCellCoordinates(newDestination)
                    attempt = self.explorer.sendGoalToRobot(newDestinationInWorldCoordinates)
                    self.explorer.destinationReached(newDestination, attempt)
                else:
                    self.completed = True
                    
       
    def run(self):

        explorerThread = ExplorerNodeBase.ExplorerThread(self)

        keepRunning = True
        
        while (rospy.is_shutdown() is False) & (keepRunning is True):

            rospy.sleep(0.1)
            
            self.updateVisualisation()

            if self.occupancyGrid is None:
                continue

            if explorerThread.isRunning() is False:
                explorerThread.start()

            if explorerThread.hasCompleted() is True:
                explorerThread.join()
                keepRunning = False

            
            
