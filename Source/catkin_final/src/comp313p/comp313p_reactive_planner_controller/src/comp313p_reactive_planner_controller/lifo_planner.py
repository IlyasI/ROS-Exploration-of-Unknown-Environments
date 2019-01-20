# -*- coding: utf-8 -*-

from cell_based_forward_search import CellBasedForwardSearch

class LIFOPlanner(CellBasedForwardSearch):

    # This implements a simple LIFO search algorithm
    
    def __init__(self, title, occupancyGrid):
        CellBasedForwardSearch.__init__(self, title, occupancyGrid)
        self.lifoQueue = list()

    # Simply put on the end of the queue
    def pushCellOntoQueue(self, cell):
        self.lifoQueue.append(cell)

    # Check the queue size is zero
    def isQueueEmpty(self):
        return not self.lifoQueue

    # Simply pull from the front of the list
    def popCellFromQueue(self):
        cell = self.lifoQueue.pop()
        return cell

    def resolveDuplicate(self, cell, parentCell):
        # Nothing to do in self case
        pass
