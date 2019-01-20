#! /usr/bin/env python

# See run_fifo_standalone.py for documentation. The only difference is that
# a LIFO planner is created instead of a FIFO planner.

from comp313p_reactive_planner_controller.occupancy_grid import OccupancyGrid
from comp313p_reactive_planner_controller.lifo_planner import LIFOPlanner

occupancyGrid = OccupancyGrid(21, 21, 0.5)

for y in xrange(1, 19):
    occupancyGrid.setCell(11, y, 1)

start = (3, 18)
goal = (20, 0)

planner = LIFOPlanner('Depth First Search', occupancyGrid);
planner.setRunInteractively(True)

planner.setWindowHeightInPixels(400)

goalReached = planner.search(start, goal)

path = planner.extractPathToGoal()
