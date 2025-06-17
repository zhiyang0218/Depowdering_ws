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
        rospy.init_node("add_object_in_planning_vaccum_scene",anonymous=True)
        group_name = "arm"
        self.move_group = moveit_commander.MoveGroupCommander(group_name)
        self.planning_scene_interface = moveit_commander.PlanningSceneInterface()
        self.ros_package = rospkg.RosPack()

    def add_object(self):
        '''
        add_object
        '''
        object_pose = PoseStamped()
        object_pose.header.frame_id = self.move_group.get_planning_frame()

        object_pose.pose.position.x = -0.448180
        object_pose.pose.position.y = 0.0
        object_pose.pose.position.z = 0.3 # 0.4
        quat = tf.transformations.quaternion_from_euler(1.571,0,0)
        object_pose.pose.orientation.x = quat[0]
        object_pose.pose.orientation.y = quat[1]
        object_pose.pose.orientation.z = quat[2]
        object_pose.pose.orientation.w = quat[3]
        # object_pose.pose.orientation.w = 1.0

        object_name = "vaccum_gripper"
        # object_size = (1, 1, 1)
        object_size = (0.001, 0.001, 0.001)
        pkg_path = self.ros_package.get_path('add_post_pro_simulation')
        workspace_mesh_file = os.path.join(pkg_path, 'gazebo_models/support_frame/mesh/new_workspace.stl')
        #blower_mesh_file = os.path.join(pkg_path, 'mesh/Blower_Tool_v2.stl')
        wire_mesh_file = os.path.join(pkg_path, 'mesh/gripper_base_link.STL')
        # print(self.ros_package.get_path('add_post_pro_simulation'))
        # print('meshfile path', mesh_file)

        collision_object = CollisionObject()
        collision_object.id = object_name
        collision_object.header.frame_id = self.move_group.get_planning_frame()
        
        collision_object.primitives.append(
                shape_msgs.msg.SolidPrimitive(
                    type=shape_msgs.msg.SolidPrimitive.BOX, dimensions=object_size
                    )
                )

        collision_object.primitive_poses.append(object_pose.pose)
        collision_object.operation = moveit_msgs.msg.CollisionObject.ADD

        # self.planning_scene_interface.add_object(collision_object)
        #self.planning_scene_interface.add_mesh(object_name, object_pose, blower_mesh_file, object_size)

        object_pose.pose.position.x = -0.348180
        object_pose.pose.position.y = 0.2
        object_pose.pose.position.z = 0.42 # 0.34
        quat = tf.transformations.quaternion_from_euler(-3.14,0,3.14)
        object_pose.pose.orientation.x = quat[0]
        object_pose.pose.orientation.y = quat[1]
        object_pose.pose.orientation.z = quat[2]
        object_pose.pose.orientation.w = quat[3]
        object_name = 'wire_gripper'
        object_size = (1, 1, 1)
        self.planning_scene_interface.add_mesh(object_name, object_pose, wire_mesh_file, object_size)


        object_pose.pose.position.x = 0.0
        object_pose.pose.position.y = 0.0
        object_pose.pose.position.z = 0.0
        object_pose.pose.orientation.x = 0.0
        object_pose.pose.orientation.y = 0.0
        object_pose.pose.orientation.z = 0.0
        object_pose.pose.orientation.w = 1.0
        object_name = 'workspace'
        object_size = (1, 1, 1)
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
