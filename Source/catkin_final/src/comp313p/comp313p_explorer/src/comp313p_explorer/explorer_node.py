import rospy
import time
from explorer_node_base import ExplorerNodeBase
from nav_msgs.msg import Odometry
from math import hypot

# Robot Explorer V 1.0
# Ilyas Ibragimov , Nikolaos Manginas
# UCL Comp313p -- Robotics --

class ExplorerNode(ExplorerNodeBase):

	def __init__(self):
		# ------------ Define Starting Variables ---------------- #
		
		self.define_variables()
		
		# ------------ Call Constructor of Base  ---------------- #
		
		ExplorerNodeBase.__init__(self)

		
	def define_variables(self):
	
		# ------------- Variables For Later Use ----------------- #


		self.start_time = time.time()
		self.frontier_list = []
		self.blackList = []
		self.current_pose_subscriber = rospy.Subscriber('/robot0/odom', Odometry, self.current_callback)
		self.current_pose = Odometry()
		self.current_coordinates = (0,0)
		self.distances = []
		self.frontiers_next = []

	def current_callback(self, data):
		self.current_pose = data
		
	def updateFrontiers(self):
	
		# ------------ Iterate Though the Map and Only Keep Frontier Cells not in Blacklist ------------- #
		
		self.frontier_list = [(x,y) for x in self.width_range for y in self.height_range if (self.isFrontierCell(x,y) and (x,y) not in self.blackList)]
		return True if self.frontier_list else False

	def chooseNewDestination(self):
		# ------------ Construct List Again -------------------------------------------------------------- #
		
		self.frontier_list = [(x,y) for x in self.width_range for y in self.height_range if (self.isFrontierCell(x,y) and (x,y) not in self.blackList)] 
		
		# ------------ For Every Frontier Cell Check How Many Adjacent There Are ------------------------- #

		self.sensitivity = 5
		
		for i in self.frontier_list:
			frontiers = 0
			for x in range(i[0]-self.sensitivity, i[0]+self.sensitivity):
				for y in range(i[1]-self.sensitivity, i[1]+self.sensitivity):
					try:
						if self.checkIfCellIsUnknown(x,y,0,0):
							frontiers -= 1
					except:
						pass
			self.frontiers_next.append(frontiers)

		
		# ------------ Get Current Position --------------------------------------------------------------- #
		
		pose = self.current_pose.pose.pose
		position = pose.position
		self.current_coordinates = self.occupancyGrid.getCellCoordinatesFromWorldCoordinates((position.x, position.y))
		
		# ------------ Put Current Coordinate in BlackList if its not there -------------------------------- #
		
		if self.current_coordinates not in self.blackList:
			self.blackList.append(self.current_coordinates)
			
		# ------------- Get Eucledian Distance from Each Frontier Cell to Current Position ----------------- # 
		
		self.distances = map(lambda x : hypot(x[1] - self.current_coordinates[1] , x[0] - self.current_coordinates[0]) , self.frontier_list)
		
		# ------------- Scale List Containing Adjacent Frontier Number to Ensure Equal Weighting ----------- #
		try:
			self.scaling = abs(max(distances)/max(self.frontiers_next))
		except:
			self.scaling = 1
		
		self.frontiers_next = [x*self.scaling for x in self.frontiers_next]
		
		# ------------- Calculate Score by Averaging Distance and Number of Frontiers ---------------------- #
		self.score = [(2*a+b)/2 for a,b in zip(self.distances, self.frontiers_next)]
		
		# ------------ Order Frontier List Depending on Score ---------------------------------------------- # 
		
		self.frontier_list = [x for _,x in sorted(zip(self.score,self.frontier_list))]
		 
		# ----------- Empty List Terminates or Get First Cell not in Blacklist as Target ------------------- #
		
		if self.frontier_list == []:
			print('No Frontiers Available')
			return False, None
			
		for index,i in enumerate(self.frontier_list):
			if i not in self.blackList:
				self.target = i
				break
				
		# ----------- Append Blacklist with Target ---------------------------------------------------------- #		
				
		self.blackList.append(self.target)	

		# ----------- Return Target ------------------------------------------------------------------------- #
		
		return True , self.target

	def destinationReached(self, goal, goalReached):
		if goalReached is False:
			self.blackList.append(goal)
            
			
