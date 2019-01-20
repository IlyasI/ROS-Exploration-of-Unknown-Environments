#!/usr/bin/env python

import rospy
from geometry_msgs.msg  import Twist
from nav_msgs.msg import Odometry
from math import pow,atan2,sqrt,pi

class RobotListener():

    def __init__(self):
        #Creating our node,publisher and subscriber
        rospy.init_node('robot_listener', anonymous=True)
        self.currentPoseSubscriber = rospy.Subscriber('/robot0/odom', Odometry, self.odometryCallback)
        self.currentTwistSubscriber = rospy.Subscriber('/robot0/cmd_vel',Twist, self.twistCallback)

    def odometryCallback(self, odometry):

        odometryPose = odometry.pose.pose

        position = odometryPose.position
        orientation = odometryPose.orientation
        
        theta = 2 * atan2(orientation.z, orientation.w)

        # rospy.loginfo("Current Pose: x: %f, y:%f, theta: %f", position.x, position.y, theta)

    def twistCallback(self, twist):
        rospy.loginfo("Current Twist: v: %f, w: %f", twist.linear.x, twist.angular.z)

    def twistCallback(self, twist):
        rospy.loginfo("Current Twist: v: %f, w: %f", twist.linear.x, twist.angular.z)

    def run(self):

        # Sleep for 1s before starting. This gives time for all the parts of stdr to start up
        rospy.wait_for_service('/robot0/replace')
        rospy.spin()
   
if __name__ == '__main__':
    try:
        #Testing our function
        x = RobotListener()
        x.run()

    except rospy.ROSInterruptException:
        pass
