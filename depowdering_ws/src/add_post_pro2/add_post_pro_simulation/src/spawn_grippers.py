#!/usr/bin/env python3

import rospy, tf, os, rospkg
from gazebo_msgs.srv import DeleteModel, SpawnModel, SpawnModelRequest
from geometry_msgs.msg import *
from add_post_pro_simulation.srv import *
from gazebo_ros_link_attacher.srv import *


class SpawnGrippers:
    def __init__(self):
        rospy.init_node('spawn_grippers')
        rospack = rospkg.RosPack()
        self.path = rospack.get_path('add_post_pro_simulation')
        self.orient = tf.transformations.quaternion_from_euler(0,0,0)
        rospy.loginfo("Waiting for gazebo services...")
        rospy.wait_for_service("gazebo/delete_model")
        rospy.wait_for_service("/gazebo/spawn_urdf_model")
        rospy.loginfo("Services available")
        self.delete_model = rospy.ServiceProxy("gazebo/delete_model", DeleteModel)
        self.spawn_model = rospy.ServiceProxy("/gazebo/spawn_urdf_model", SpawnModel)
        
    
    def read_model(self, model_name: str):
        with open(self.path + "/urdf/"+ model_name +".urdf","r") as f:
            surface_xml = f.read()
            rospy.loginfo("Got the model")
        return surface_xml

    def run(self):
        rospy.spin()

    def delete_model(self, model_name: str):
        self.delete_model(model_name)

    def prepare_models(self):
        # vaccum gripper
        xml_file = self.read_model("vaccum_gripper")
        item_name = 'vaccum_gripper'
        self.vaccum_gripper_request = SpawnModelRequest()
        self.vaccum_gripper_request.initial_pose.position.x = -0.448180
        self.vaccum_gripper_request.initial_pose.position.y = 0.0
        self.vaccum_gripper_request.initial_pose.position.z = 0.4
        quat = tf.transformations.quaternion_from_euler(1.571,0,0)
        self.vaccum_gripper_request.initial_pose.orientation.x = quat[0]
        self.vaccum_gripper_request.initial_pose.orientation.y = quat[1]
        self.vaccum_gripper_request.initial_pose.orientation.z = quat[2]
        self.vaccum_gripper_request.initial_pose.orientation.w = quat[3]
        self.vaccum_gripper_request.model_name = item_name
        self.vaccum_gripper_request.model_xml = xml_file
        self.vaccum_gripper_request.robot_namespace = '/'
        self.vaccum_gripper_request.reference_frame = 'world'

        # wire griper
        xml_file = self.read_model("wire_gripper")
        item_name = 'wire_gripper'
        self.wire_gripper_request = SpawnModelRequest()
        self.wire_gripper_request.initial_pose.position.x = -0.4
        self.wire_gripper_request.initial_pose.position.y = 0.2
        self.wire_gripper_request.initial_pose.position.z = 0.34
        quat = tf.transformations.quaternion_from_euler(0,0,0)
        self.wire_gripper_request.initial_pose.orientation.x = quat[0]
        self.wire_gripper_request.initial_pose.orientation.y = quat[1]
        self.wire_gripper_request.initial_pose.orientation.z = quat[2]
        self.wire_gripper_request.initial_pose.orientation.w = quat[3]
        self.wire_gripper_request.model_name = item_name
        self.wire_gripper_request.model_xml = xml_file
        self.wire_gripper_request.robot_namespace = '/'
        self.wire_gripper_request.reference_frame = 'world'

    def spawn_plate_model(self):
        
        self.prepare_models()
        self.spawn_model(self.vaccum_gripper_request)
        self.spawn_model(self.wire_gripper_request)
        rospy.loginfo("successfully spawned the model")

def main():
    node = SpawnGrippers()
    rospy.sleep(1)
    node.spawn_plate_model()
    # node.run()

if __name__ == '__main__':
    main()
