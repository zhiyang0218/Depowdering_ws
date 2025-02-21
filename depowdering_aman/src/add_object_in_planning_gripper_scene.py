#! /usr/bin/env python3

import os
import sys
import tf
import rospy
import rospkg
import moveit_commander
from moveit_msgs.msg import CollisionObject
from shape_msgs.msg import SolidPrimitive
import shape_msgs.msg
import moveit_msgs.msg
from geometry_msgs.msg import PoseStamped
from math import pi
from std_msgs.msg import String

class AddObjectInPlanningScene:
    def __init__(self):
        moveit_commander.roscpp_initialize(sys.argv)
        rospy.init_node("add_object_in_planning_gripper_scene",anonymous=True)
        group_name = "arm"
        self.move_group = moveit_commander.MoveGroupCommander(group_name, wait_for_servers=60.0)
        self.planning_scene_interface = moveit_commander.PlanningSceneInterface()
        self.ros_package = rospkg.RosPack()

    def add_object(self):
        '''
        add_object
        '''
        object_pose = PoseStamped()
        object_pose.header.frame_id = self.move_group.get_planning_frame()
        pkg_path = self.ros_package.get_path('add_post_pro_simulation')
        workspace_mesh_file = os.path.join(pkg_path, 'gazebo_models/support_frame/mesh/workspace.stl')
        object_pose.pose.position.x = -0.225
        object_pose.pose.position.y = -1.070
        object_pose.pose.position.z = -0.095
        object_pose.pose.orientation.x = 0.0
        object_pose.pose.orientation.y = 0.0
        object_pose.pose.orientation.z = 0.0
        object_pose.pose.orientation.w = 1.0
        object_name = 'workspace'
        object_size = (0.001, 0.001, 0.001)
        self.planning_scene_interface.add_mesh(object_name, object_pose, workspace_mesh_file, object_size)
        rospy.sleep(2)

'''
func main
make instance of class and call the func `add_object`
'''
def main():
    node = AddObjectInPlanningScene()
    node.add_object()

if __name__ == '__main__':
    main()
