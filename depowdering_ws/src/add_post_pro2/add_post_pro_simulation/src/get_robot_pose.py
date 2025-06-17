#!/usr/bin/env python3

import rospy
import sys
import moveit_commander

class GetRobotPose:
    def __init__(self):
        moveit_commander.roscpp_initialize(sys.argv)
        rospy.init_node("get_robot_pose")
        group_name = "arm"
        self.group = moveit_commander.MoveGroupCommander(group_name)
        rospy.loginfo("moveit connected")
    
    def run(self):
        pose = self.group.get_current_pose()
        #pose = self.group.get_current_joint_values()

        print(pose)
    
def main():
    node = GetRobotPose()
    node.run()


if __name__ == '__main__':
    main()
