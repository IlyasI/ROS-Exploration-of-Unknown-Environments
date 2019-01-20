from cell_based_forward_search import CellBasedForwardSearch
from Queue import PriorityQueue
import math

# This class implements Dijkstra's forward search algorithm

class DijkstraPlanner(CellBasedForwardSearch):
    
    def __init__(self, title, occupancyGrid):
        CellBasedForwardSearch.__init__(self, title, occupancyGrid)
        self.priorityQueue = PriorityQueue()

    # Update the cost to self cell and sort according to self cumulative cost
    def pushCellOntoQueue(self, cell):
    
        if (cell.parent is not None):
            # Work out the cost of the action from the parent to self cell
            d = self.computeLStageAdditiveCost(cell.parent, cell)
            cell.pathCost = cell.parent.pathCost + d
        else:
            cell.pathCost = 0
            
        self.priorityQueue.put((cell.pathCost, cell))

    # Check the queue size is zero
    def isQueueEmpty(self):
        return self.priorityQueue.empty()

    # Simply pull from the front of the list
    def popCellFromQueue(self):
        tuple = self.priorityQueue.get()
        return tuple[1]

    def resolveDuplicate(self, cell, parentCell):

        # See if the cost from the parent cell to this cell is shorter
        # than the existing path. If so, use it instead. NOTE: This should
        # reorder the priority queue, but my bad implementation does not.
        dX = cell.coords[0] - parentCell.coords[0]
        dY = cell.coords[1] - parentCell.coords[1]
        d = math.sqrt(dX * dX + dY * dY)
        pathCostThroughNewParent = parentCell.pathCost + d
        if (pathCostThroughNewParent < cell.pathCost):
            cell.parent = parentCell
            cell.pathCost = pathCostThroughNewParent
 
