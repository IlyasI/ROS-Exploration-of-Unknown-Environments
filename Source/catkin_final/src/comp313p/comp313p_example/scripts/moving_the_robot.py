#!/usr/bin/env python

import rospy
from geometry_msgs.msg  import Twist
from nav_msgs.msg import Odometry
from math import pow,atan2,sqrt,pi

class stdr_controller():

    def __init__(self):
        #Creating our node,publisher and subscriber
        rospy.init_node('stdr_controller', anonymous=True)
        self.velocity_publisher = rospy.Publisher('/robot0/cmd_vel', Twist, queue_size=10)
        self.current_pose_subscriber = rospy.Subscriber('/robot0/odom', Odometry, self.current_callback)
        self.current_pose = Odometry()
        self.distance_tolerance = 0.01
 
    def current_callback(self, data):
        self.current_pose = data

    def run(self):

        # Sleep for 1s before starting. This gives time for all the parts of stdr to start up
        rospy.wait_for_service('/robot0/replace')
        rospy.sleep(1.0)

        while not rospy.is_shutdown():
 
            vel_msg = Twist()
	    
            pose = self.current_pose.pose.pose

            # Get the position vector. ROS uses nested types for generality, but it gets to be a bit
            # cumbersome
            position = pose.position
 
            # The pose returns the orientation as a quaternion, which is a 4D representation of 3D
            # rotations. We just want the heading angle, so some conversion is required
            # 
            orientation = pose.orientation

            theta = 2 * atan2(orientation.z, orientation.w) * 180 / pi

            # Show the output
            rospy.loginfo('Current position, x: {}, y:{}, theta:{}'.format(position.x,
                position.y, theta))

            try:
                lin_velocity = float(raw_input('Enter desired linear velocity: '))
                rot_velocity = float(raw_input('Enter desired rotational velocity: '))
                duration = float(raw_input('Enter desired duration: '))
                vel_msg.linear.x = lin_velocity
                vel_msg.angular.z = rot_velocity * pi / 180.0
                self.velocity_publisher.publish(vel_msg)
                rospy.sleep(duration)
            except ValueError:
                rospy.loginfo('Illegal value entered; try again')

            vel_msg.linear.x = 0.0
            vel_msg.angular.z = 0.0
            self.velocity_publisher.publish(vel_msg)

   
if __name__ == '__main__':
    try:
        #Testing our function
        x = stdr_controller()
        x.run()

    except rospy.ROSInterruptException: pass
