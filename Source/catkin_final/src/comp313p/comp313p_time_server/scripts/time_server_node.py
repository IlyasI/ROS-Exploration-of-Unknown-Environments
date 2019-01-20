#!/usr/bin/env python
import rospy
import time
from rosgraph_msgs.msg import Clock

# Self class generates a periodic clock signal which is used as the
# simulation server. It is controlled by two parameters:
# clock_send_rate: How many times should a clock message be sent per second?
# time_scale_factor: What is the rate at which the simulation runs? 1s
#      wall clock time = time_scale_factor s simulation time

class TimeServerNode(object):

    def __init__(self):
        rospy.init_node('time_server', anonymous=True)
        
        # How many times do we send a clock message per (wallclock) second?
        self.clockSendRate = rospy.get_param('clock_send_rate', 10)

        # For each step, how far does the clock advance?
        self.timeScaleFactor = rospy.get_param('time_scale_factor', 1.5)

        # The publisher used to send the clock messages
        self.clockPublisher = rospy.Publisher('/clock', Clock, queue_size=10)
        
    def run(self):
        rospy.loginfo('Starting with the send rate ' + str(self.clockSendRate))
        
        # Get the current time
        startWallclockTime = time.time()
        currentWallclockTime = startWallclockTime

        # Set the current simulation time to now
        startSimulationTime = startWallclockTime
        currentSimulationTime = startSimulationTime
        
        # Sleep period - self is how long to sleep before sending out
        # the next clock message
        sleepWallclockPeriod = 1.0 / float(self.clockSendRate)

        # Simulation time increment with each message
        simulationTimeIncrement = self.timeScaleFactor * sleepWallclockPeriod
        
        # Get the next sleep time and seed it
        sleepUntilWallclockTime = startWallclockTime + sleepWallclockPeriod
        
        # Message to send
        clockMessage = Clock()

        # Next debug message time to print
        debugMessageWallclockTime = currentWallclockTime
        
        while not rospy.is_shutdown():

            # Publish the simulation time
            clockMessage.clock = rospy.Time.from_sec(currentSimulationTime)
            self.clockPublisher.publish(clockMessage)

            # Print debug message if required
            if (debugMessageWallclockTime <= currentWallclockTime):
                rospy.loginfo('Real duration=' + str(currentWallclockTime - startSimulationTime) \
                              + '; simulated duration=' + str(currentSimulationTime - startSimulationTime))
                debugMessageWallclockTime += 2

            # Work out how long to sleep for. If we've missed a sleep
            # period, thrown a warning and skip it
            currentWallclockTime = time.time()
            timeToSleep = sleepUntilWallclockTime - currentWallclockTime            
            if (timeToSleep < 0):
                rospy.logwarn('Cannot keep up; timeToSleep=' + str(timeToSleep) + '; skipping sleep step')
                sleepUntilWallclockTime = currentWallclockTime
            else:
                time.sleep(timeToSleep)

            # Work out when the next sleep time will be
            sleepUntilWallclockTime += sleepWallclockPeriod

            # Advance the simulation time
            currentSimulationTime += simulationTimeIncrement

if __name__ == '__main__':
    try:
        timeServer = TimeServerNode()
        timeServer.run()
    except rospy.ROSInterruptException:
        pass
