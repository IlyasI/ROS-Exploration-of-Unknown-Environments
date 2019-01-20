# -*- coding: utf-8 -*-

# This class stores information about each cell - its coordinates in the grid,
# and its label

from enum import Enum

class CellLabel(Enum):
    OBSTRUCTED=-3
    START=-2
    GOAL=-1
    UNVISITED=0
    DEAD=1
    ALIVE=2

class Cell(object):

    def __init__(self, coords, isOccupied):

        # Set coordinates
        self.coords = coords

        # Label the cell
        if (isOccupied == 1):
            self.label = CellLabel.OBSTRUCTED;
        else:
            self.label = CellLabel.UNVISITED

        # Initially the cell has no parents.
        self.parent = None

        # The initial path cost is infinite. For algorithms that need
        # it, this is the necessary initial condition.
        self.pathCost = float("inf")

