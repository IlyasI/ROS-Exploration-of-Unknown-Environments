from dijkstra_planner import DijkstraPlanner
import math
import rospy

# This class implements the A* search algorithm

from enum import Enum

class CostToComeHeuristic(Enum):
    EUCLIDEAN = 1
    MANHATTAN = 2
    OCTILE = 3

class AStarPlanner(DijkstraPlanner):
    
    def __init__(self, title, occupancyGrid):
        DijkstraPlanner.__init__(self, title, occupancyGrid)

        # Set up the heuristic and the weight from the parameters
        heuristic = rospy.get_param('a_star_heuristic', 'euclidean')

        if heuristic == 'octile':
            self.heuristic = CostToComeHeuristic.OCTILE
        elif heuristic == 'manhattan':
            self.heuristic = CostToComeHeuristic.MANHATTAN
        elif heuristic == 'euclidean':
            self.heuristic = CostToComeHeuristic.EUCLIDEAN
        else:
            rospy.logwarn('Unknown heuristic %s; defaulting to OCTILE', heuristic)
            self.heuristic = CostToComeHeuristic.OCTILE
            
        self.alpha = rospy.get_param('a_star_heuristic_weight', 1)

    # Update the cost to self cell and sort according to the cumulative cost
    def pushCellOntoQueue(self, cell):

        # Work out the cost of the action from the parent to this cell
        # which defines the cost so far
        if (cell.parent is not None):
            d = self.computeLStageAdditiveCost(cell.parent, cell)
            cell.pathCost = cell.parent.pathCost + d
        else:
            cell.pathCost = 0

        # Compute the cost-to-go using a suitable heuristic
        dXG = abs(cell.coords[0] - self.goal.coords[0])
        dYG = abs(cell.coords[1] - self.goal.coords[1])
 
        if self.heuristic is CostToComeHeuristic.EUCLIDEAN:
            G = math.sqrt(dXG * dXG + dYG * dYG)
        elif self.heuristic is CostToComeHeuristic.MANHATTAN:
            G = dXG + dYG
        elif self.heuristic is CostToComeHeuristic.OCTILE:
            G = max(dXG, dYG) + (math.sqrt(2) -1) * min(dXG, dYG)
 
        # Compute the cost using weighted A*
        cost = cell.pathCost + self.alpha * G
        
        self.priorityQueue.put((cost, cell))
