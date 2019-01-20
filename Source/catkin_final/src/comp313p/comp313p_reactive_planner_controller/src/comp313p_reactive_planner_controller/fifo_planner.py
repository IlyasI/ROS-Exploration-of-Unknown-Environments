# -*- coding: utf-8 -*-

from cell_based_forward_search import CellBasedForwardSearch
from collections import deque

# This class implements the FIFO - or breadth first search - planning
# algorithm. It works by using a double ended queue: cells are pushed
# onto the back of the queue, and are popped from the front of the
# queue.

class FIFOPlanner(CellBasedForwardSearch):

    # self implements a simple FIFO search algorithm
    
    def __init__(self, title, occupancyGrid):
        CellBasedForwardSearch.__init__(self, title, occupancyGrid)
        self.fifoQueue = deque()

    # Simply put on the end of the queue
    def pushCellOntoQueue(self, cell):
        self.fifoQueue.append(cell)

    # Check the queue size is zero
    def isQueueEmpty(self):
        return not self.fifoQueue

    # Simply pull from the front of the list
    def popCellFromQueue(self):
        cell = self.fifoQueue.popleft()
        return cell

    def resolveDuplicate(self, cell, parentCell):
        # Nothing to do in self case
        pass
