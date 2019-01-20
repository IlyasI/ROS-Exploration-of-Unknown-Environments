# -*- coding: utf-8 -*-

from occupancy_grid import OccupancyGrid
from search_grid import SearchGrid
from planner_base import PlannerBase
from collections import deque
from cell import *
from planned_path import PlannedPath
from math import *
import rospy

class GeneralForwardSearchAlgorithm(PlannerBase):

    # This class implements the basic framework for LaValle's general
    # template for forward search. It includes a lot of methods for
    # managing the graphical output as well
    
    def __init__(self, title, occupancyGrid):
        PlannerBase.__init__(self, title, occupancyGrid)

        # If the goal cell is occupied, the planner will still find a
        # route. If the following flag is set to true the planner
        # will, however, not go to the goal but stop one cell short.
        self.removeGoalCellFromPathIfOccupied = False
        self.goalCellLabel = None

        # Flag to store if the last plan was successful
        self.goalReached = None

    def setRemoveGoalCellFromPathIfOccupied(self, newValue):
        self.removeGoalCellFromPathIfOccupied = newValue
        
    # These methods manage the queue of cells to be visied.
    def pushCellOntoQueue(self, cell):
        raise NotImplementedError()

    # Self method returns a boolean - true if the queue is empty,
    # false if it still has some cells on it.
    def isQueueEmpty(self):
        raise NotImplementedError()

    # Self method finds the first cell (at the head of the queue),
    # removes it from the queue, and returns it.
    def popCellFromQueue(self):
        raise NotImplementedError()

    # Self method determines if the goal has been reached.
    def hasGoalBeenReached(self, cell):
        raise NotImplementedError()

    # Self method gets the list of cells which could be visited next.
    def getNextSetOfCellsToBeVisited(self, cell):
        raise NotImplementedError()

    # Self method determines whether a cell has been visited already.
    def hasCellBeenVisitedAlready(self, cell):
        raise NotImplementedError()

    def markCellAsVisitedAndRecordParent(self, cell, parentCell):
        cell.label = CellLabel.ALIVE
        cell.parent = parentCell

    # Mark that a cell is dead. A dead cell is one in which all of its
    # immediate neighbours have been visited.
    def markCellAsDead(self, cell):
        cell.label = CellLabel.DEAD
    
    # Handle the case that a cell has been visited already.
    def resolveDuplicate(self, cell):
        raise NotImplementedError()

    # Get the search grid
    def getSearchGrid(self):
        return self.searchGrid
    
    # Compute the additive cost of performing a step from the parent to the
    # current cell. This calculation is carried out the same way no matter
    # what heuristics, etc. are used
    def computeLStageAdditiveCost(self, parentCell, cell):
        
        # If the parent is empty, this is the start of the path and the
        # cost is 0.
        if (parentCell is None):
            return 0
        
        # Cost is the Cartesian distance
        dX = cell.coords[0] - parentCell.coords[0]
        dY = cell.coords[1] - parentCell.coords[1]
        L = sqrt(dX * dX + dY * dY)
        
        return L

    # Update the seach grid
    def handleChangeToOccupancyGrid(self):
        # Create the search grid from the occupancy grid and seed
        # unvisited and occupied cells.
        if (self.searchGrid is None):
            self.searchGrid = SearchGrid.fromOccupancyGrid(self.occupancyGrid, self.robotRadius)
        else:
            self.searchGrid.updateFromOccupancyGrid()
    
    # The main search routine. The routine searches for a path between a given
    # set of coordinates. These are then converted into start and destination
    # cells in the search grid and the search algorithm is then run.
    def search(self, startCoords, goalCoords):

        self.handleChangeToOccupancyGrid()
        
        # Empty the queue. self is needed to make sure everything is reset
        while (self.isQueueEmpty() == False):
            self.popCellFromQueue()

        # Check the start and end are not occupied
        if (self.occupancyGrid.getCell(startCoords[0], startCoords[1]) == 1):
            return False

        if (self.occupancyGrid.getCell(goalCoords[0], goalCoords[1]) == 1):
            return False

        # Get the start cell object and label it as such. Also set its
        # path cost to 0.
        self.start = self.searchGrid.getCellFromCoords(startCoords)

        #if self.start.label is CellLabel.OBSTRUCTED:
        #    return False
        
        self.start.label = CellLabel.START
        self.start.pathCost = 0

        self.goal = self.searchGrid.getCellFromCoords(goalCoords)
        self.goalCellLabel = self.goal.label
        
        #if self.goal.label is CellLabel.OBSTRUCTED:
        #    return False
        
        self.goal.label = CellLabel.GOAL

        if rospy.is_shutdown():
            return False

        # Draw the initial state
        self.resetGraphics()

        # Insert the start on the queue to start the process going.
        self.markCellAsVisitedAndRecordParent(self.start, None)
        self.pushCellOntoQueue(self.start)

        # Reset the count
        self.numberOfCellsVisited = 0

        # Indicates if we reached the goal or not
        self.goalReached = False

        # Iterate until we have run out of live cells to try or we reached the goal
        while (self.isQueueEmpty() == False):

            # Check if ROS is shutting down; if so, abort. This stops the
            # planner from hanging
            if rospy.is_shutdown():
                return False
            
            cell = self.popCellFromQueue()
            if (self.hasGoalBeenReached(cell) == True):
                self.goalReached = True
                break
            cells = self.getNextSetOfCellsToBeVisited(cell)
            for nextCell in cells:
                if (self.hasCellBeenVisitedAlready(nextCell) == False):
                    self.markCellAsVisitedAndRecordParent(nextCell, cell)
                    self.pushCellOntoQueue(nextCell)
                    self.numberOfCellsVisited = self.numberOfCellsVisited + 1
                else:
                    self.resolveDuplicate(nextCell, cell)

            # Now that we've checked all the actions for this cell,
            # mark it as dead
            self.markCellAsDead(cell)

            # Draw the update if required
            self.drawCurrentState()

        # Do a final draw to make sure that the graphics are shown, even at the end state
        self.drawCurrentState()
        
        print "numberOfCellsVisited = " + str(self.numberOfCellsVisited)
        
        if self.goalReached:
            print "Goal reached"
        else:
            print "Goal not reached"

        return self.goalReached

    # This method extracts a path from the pathEndCell to the start
    # cell. The path is a list actually sorted in the order:
    # cell(x_I), cell(x_1), ... , cell(x_K), cell(x_G). You can use
    # this method to try to find the path from any end cell. However,
    # depending upon the planner used, the results might not be
    # valid. In this case, the path will probably not terminate at the
    # start cell.
    def extractPathEndingAtCell(self, pathEndCell, colour):

        # Construct the path object and mark if the goal was reached
        path = PlannedPath()

        path.goalReached = self.goalReached

        # Add the first cell to the path. We actually grow the path
        # backwards from the goal to the start. For the goal cell, we
        # do not include it if (a) the goal cell was occupied when we
        # started planning and (b) trimming the path is enabled.
        if (self.removeGoalCellFromPathIfOccupied is False) or \
           (self.goalCellLabel is not CellLabel.OBSTRUCTED):
            path.waypoints.append(pathEndCell)
            
        # Start at the goal and find the parent. Find the cost associated with the parent
        cell = pathEndCell.parent
        path.travelCost = self.computeLStageAdditiveCost(pathEndCell.parent, pathEndCell)
        
        # Iterate back through and extract each parent in turn and add
        # it to the path. To work out the travel length along the
        # path, you'll also have to add self at self stage.
        while (cell is not None):
            path.waypoints.appendleft(cell)
            path.travelCost = path.travelCost + self.computeLStageAdditiveCost(cell.parent, cell)
            cell = cell.parent
            
        # Update the stats on the size of the path
        path.numberOfWaypoints = len(path.waypoints)

        # Note that if we failed to reach the goal, the above mechanism computes a path length of 0.
        # Therefore, if we didn't reach the goal, change it to infinity
        if path.goalReached is False:
            path.travelCost = float("inf")

        print "Path travel cost = " + str(path.travelCost)
        print "Path cardinality = " + str(path.numberOfWaypoints)
        
        # Draw the path if requested
        if (self.showGraphics == True):
            self.searchGridDrawer.update()
            self.searchGridDrawer.drawPathGraphicsWithCustomColour(path, colour)
            self.searchGridDrawer.waitForKeyPress()
        
        # Return the path
        return path

    # Extract the path from a specified end cell to the start. This is not
    # necessarily the full path. Rather, it lets us illustrate parts of the
    # path.
    def extractPathEndingAtCoord(self, endCellCoord):
        endCell = self.searchGrid.getCellFromCoords(endCellCoord)
        self.extractPathEndingAtCell(endCell, 'red')

    # Extract the path between the start and goal.
    def extractPathToGoal(self):
        path = self.extractPathEndingAtCell(self.goal, 'yellow')
       
        return path
            
