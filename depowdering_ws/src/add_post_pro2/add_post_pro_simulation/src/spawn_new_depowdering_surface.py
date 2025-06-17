#!/usr/bin/env python3

import rospy, tf, os, rospkg
from gazebo_msgs.srv import DeleteModel, SpawnModel, SpawnModelRequest
from geometry_msgs.msg import *
from add_post_pro_simulation.srv import *
from gazebo_ros_link_attacher.srv import *


class SpawnNewDepowderingSurface:
    def __init__(self):
        rospy.init_node('spawn_depowdering_surface_node')
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

    
    #def prepare_models(self):
        # blue tube
        xml_file = self.read_model("blue_tube")
        item_name = 'blue_tube'
        self.blue_tube_request = SpawnModelRequest()
        self.blue_tube_request.initial_pose.position.x = -0.1
        self.blue_tube_request.initial_pose.position.y = 0.635
        self.blue_tube_request.initial_pose.position.z = 0.03
        quat = tf.transformations.quaternion_from_euler(1.571,0,0)
        self.blue_tube_request.initial_pose.orientation.x = quat[0]
        self.blue_tube_request.initial_pose.orientation.y = quat[1]
        self.blue_tube_request.initial_pose.orientation.z = quat[2]
        self.blue_tube_request.initial_pose.orientation.w = quat[3]
        self.blue_tube_request.model_name = item_name
        self.blue_tube_request.model_xml = xml_file
        self.blue_tube_request.robot_namespace = '/'
        self.blue_tube_request.reference_frame = 'world'


        # red tube
        xml_file = self.read_model("red_tube")
        item_name = 'red_tube'
        self.red_tube_request = SpawnModelRequest()
        self.red_tube_request.initial_pose.position.x = 0.025
        self.red_tube_request.initial_pose.position.y = 0.635
        self.red_tube_request.initial_pose.position.z = 0.03
        self.red_tube_request.initial_pose.orientation.x = quat[0]
        self.red_tube_request.initial_pose.orientation.y = quat[1]
        self.red_tube_request.initial_pose.orientation.z = quat[2]
        self.red_tube_request.initial_pose.orientation.w = quat[3]
        self.red_tube_request.model_name = item_name
        self.red_tube_request.model_xml = xml_file
        self.red_tube_request.robot_namespace = '/'
        self.red_tube_request.reference_frame = 'world'


        # green tube
        xml_file = self.read_model("green_tube")
        item_name = 'green_tube'
        self.green_tube_request = SpawnModelRequest()
        self.green_tube_request.initial_pose.position.x = -0.025
        self.green_tube_request.initial_pose.position.y = 0.635
        self.green_tube_request.initial_pose.position.z = 0.03
        quat = tf.transformations.quaternion_from_euler(1.571,0,0)
        self.green_tube_request.initial_pose.orientation.x = quat[0]
        self.green_tube_request.initial_pose.orientation.y = quat[1]
        self.green_tube_request.initial_pose.orientation.z = quat[2]
        self.green_tube_request.initial_pose.orientation.w = quat[3]
        self.green_tube_request.model_name = item_name
        self.green_tube_request.model_xml = xml_file
        self.green_tube_request.robot_namespace = '/'
        self.green_tube_request.reference_frame = 'world'

        # another blue tube
        xml_file = self.read_model("blue_tube")
        item_name = 'another_blue_tube'
        self.another_blue_tube_request = SpawnModelRequest()
        self.another_blue_tube_request.initial_pose.position.x = 0.1
        self.another_blue_tube_request.initial_pose.position.y = 0.635
        self.another_blue_tube_request.initial_pose.position.z = 0.03
        quat = tf.transformations.quaternion_from_euler(1.571,0,0)
        self.another_blue_tube_request.initial_pose.orientation.x = quat[0]
        self.another_blue_tube_request.initial_pose.orientation.y = quat[1]
        self.another_blue_tube_request.initial_pose.orientation.z = quat[2]
        self.another_blue_tube_request.initial_pose.orientation.w = quat[3]
        self.another_blue_tube_request.model_name = item_name
        self.another_blue_tube_request.model_xml = xml_file
        self.another_blue_tube_request.robot_namespace = '/'
        self.another_blue_tube_request.reference_frame = 'world'

        # layer
        xml_file = self.read_model('white_plate')
        item_pose = Pose(position=Point(x=0, y=0.635,z=0.078), orientation=self.orient)
        item_name = 'layer1'
        self.layer_request = SpawnModelRequest()
        self.layer_request.initial_pose.position.x = 0
        self.layer_request.initial_pose.position.y = 0.635
        self.layer_request.initial_pose.position.z = 0.02
        self.layer_request.initial_pose.orientation.z = 1.0
        self.layer_request.model_name = item_name
        self.layer_request.model_xml = xml_file
        self.layer_request.robot_namespace = '/'
        self.layer_request.reference_frame = 'world'
    
    #def spawn_plate_model(self):
        
        self.prepare_models()
        self.blue_tube_request.initial_pose.position.y -= 0.025
        self.another_blue_tube_request.initial_pose.position.y -= 0.025
        self.green_tube_request.initial_pose.position.y -= 0.025
        self.red_tube_request.initial_pose.position.y -= 0.025
        self.spawn_model(self.layer_request)
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.x += 0.025
        # self.green_tube_request.initial_pose.position.x += 0.025
        # self.red_tube_request.initial_pose.position.x += 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)
        self.blue_tube_request.model_name+="2"
        self.another_blue_tube_request.model_name+="2"
        self.green_tube_request.model_name+="2"
        self.red_tube_request.model_name+="2"
        self.blue_tube_request.initial_pose.position.y += 0.05
        self.another_blue_tube_request.initial_pose.position.y += 0.05
        self.green_tube_request.initial_pose.position.y += 0.05
        self.red_tube_request.initial_pose.position.y += 0.05
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.x -= 0.025
        # self.green_tube_request.initial_pose.position.x -= 0.025
        # self.red_tube_request.initial_pose.position.x -= 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)
        self.blue_tube_request.model_name+="2"
        self.another_blue_tube_request.model_name+="2"
        self.green_tube_request.model_name+="2"
        self.red_tube_request.model_name+="2"
        self.blue_tube_request.initial_pose.position.y += 0.05
        self.another_blue_tube_request.initial_pose.position.y += 0.05
        self.green_tube_request.initial_pose.position.y += 0.05
        self.red_tube_request.initial_pose.position.y += 0.05
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.x += 0.025
        # self.green_tube_request.initial_pose.position.x += 0.025
        # self.red_tube_request.initial_pose.position.x += 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)


        self.blue_tube_request.model_name+="1"
        self.another_blue_tube_request.model_name+="1"
        self.green_tube_request.model_name+="1"
        self.red_tube_request.model_name+="1"
        self.blue_tube_request.initial_pose.position.y -= 0.15
        self.another_blue_tube_request.initial_pose.position.y -= 0.15
        self.green_tube_request.initial_pose.position.y -= 0.15
        self.red_tube_request.initial_pose.position.y -= 0.15
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)

        # self.blue_tube_request.model_name+="2"
        # self.green_tube_request.model_name+="2"
        # self.red_tube_request.model_name+="2"

        # self.blue_tube_request.initial_pose.position.x -= 0.025
        # self.green_tube_request.initial_pose.position.x -= 0.025
        # self.red_tube_request.initial_pose.position.x -= 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)


        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.y += 0.05
        # self.green_tube_request.initial_pose.position.y += 0.05
        # self.red_tube_request.initial_pose.position.y += 0.05
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="2"
        # self.green_tube_request.model_name+="2"
        # self.red_tube_request.model_name+="2"

        # self.blue_tube_request.initial_pose.position.x += 0.025
        # self.green_tube_request.initial_pose.position.x += 0.025
        # self.red_tube_request.initial_pose.position.x += 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)
        self.layer_request.initial_pose.position.z = 0.04
        self.layer_request.model_name = 'layer2'
        self.spawn_model(self.layer_request)
        self.blue_tube_request.initial_pose.position.z = 0.05
        self.blue_tube_request.initial_pose.position.y = 0.635
        self.blue_tube_request.initial_pose.position.x = -0.1
        self.blue_tube_request.model_name = 'blue_tube_layer2'
        self.another_blue_tube_request.initial_pose.position.z = 0.05
        self.another_blue_tube_request.initial_pose.position.y = 0.635
        self.another_blue_tube_request.initial_pose.position.x = 0.1
        self.another_blue_tube_request.model_name = 'another_blue_tube_layer2'
        self.red_tube_request.initial_pose.position.z = 0.05
        self.red_tube_request.initial_pose.position.y = 0.635
        self.red_tube_request.initial_pose.position.x = 0.025
        self.red_tube_request.model_name = 'red_tube_layer2'
        self.green_tube_request.initial_pose.position.z = 0.05
        self.green_tube_request.initial_pose.position.y = 0.635
        self.green_tube_request.initial_pose.position.x = -0.025
        self.green_tube_request.model_name = 'green_tube_layer_2'
        self.blue_tube_request.initial_pose.position.y -= 0.025
        self.green_tube_request.initial_pose.position.y -= 0.025
        self.red_tube_request.initial_pose.position.y -= 0.025
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.x += 0.025
        # self.green_tube_request.initial_pose.position.x += 0.025
        # self.red_tube_request.initial_pose.position.x += 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)
        self.blue_tube_request.model_name+="2"
        self.another_blue_tube_request.model_name+="2"
        self.green_tube_request.model_name+="2"
        self.red_tube_request.model_name+="2"
        self.blue_tube_request.initial_pose.position.y += 0.05
        self.another_blue_tube_request.initial_pose.position.y += 0.05
        self.green_tube_request.initial_pose.position.y += 0.05
        self.red_tube_request.initial_pose.position.y += 0.05
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.x -= 0.025
        # self.green_tube_request.initial_pose.position.x -= 0.025
        # self.red_tube_request.initial_pose.position.x -= 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)
        self.blue_tube_request.model_name+="2"
        self.another_blue_tube_request.model_name+="2"
        self.green_tube_request.model_name+="2"
        self.red_tube_request.model_name+="2"
        self.blue_tube_request.initial_pose.position.y += 0.05
        self.another_blue_tube_request.initial_pose.position.y += 0.05
        self.green_tube_request.initial_pose.position.y += 0.05
        self.red_tube_request.initial_pose.position.y += 0.05
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.x += 0.025
        # self.green_tube_request.initial_pose.position.x += 0.025
        # self.red_tube_request.initial_pose.position.x += 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)


        self.blue_tube_request.model_name+="1"
        self.another_blue_tube_request.model_name+="1"
        self.green_tube_request.model_name+="1"
        self.red_tube_request.model_name+="1"
        self.blue_tube_request.initial_pose.position.y -= 0.15
        self.another_blue_tube_request.initial_pose.position.y -= 0.15
        self.green_tube_request.initial_pose.position.y -= 0.15
        self.red_tube_request.initial_pose.position.y -= 0.15
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="2"
        # self.green_tube_request.model_name+="2"
        # self.red_tube_request.model_name+="2"

        # self.blue_tube_request.initial_pose.position.x -= 0.025
        # self.green_tube_request.initial_pose.position.x -= 0.025
        # self.red_tube_request.initial_pose.position.x -= 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)


        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.y += 0.05
        # self.green_tube_request.initial_pose.position.y += 0.05
        # self.red_tube_request.initial_pose.position.y += 0.05
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="2"
        # self.green_tube_request.model_name+="2"
        # self.red_tube_request.model_name+="2"

        # self.blue_tube_request.initial_pose.position.x += 0.025
        # self.green_tube_request.initial_pose.position.x += 0.025
        # self.red_tube_request.initial_pose.position.x += 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)

        self.layer_request.initial_pose.position.z = 0.06
        self.layer_request.model_name = 'layer3'
        self.spawn_model(self.layer_request)

        self.blue_tube_request.initial_pose.position.z = 0.07
        self.blue_tube_request.initial_pose.position.y = 0.635
        self.blue_tube_request.initial_pose.position.x = -0.1
        self.blue_tube_request.model_name = 'blue_tube_layer3'
        self.another_blue_tube_request.initial_pose.position.z = 0.07
        self.another_blue_tube_request.initial_pose.position.y = 0.635
        self.another_blue_tube_request.initial_pose.position.x = 0.1
        self.another_blue_tube_request.model_name = 'another_blue_tube_layer3'
        self.red_tube_request.initial_pose.position.z = 0.07
        self.red_tube_request.initial_pose.position.y = 0.635
        self.red_tube_request.initial_pose.position.x = 0.025
        self.red_tube_request.model_name = 'red_tube_layer3'
        self.green_tube_request.initial_pose.position.z = 0.07
        self.green_tube_request.initial_pose.position.y = 0.635
        self.green_tube_request.initial_pose.position.x = -0.025
        self.blue_tube_request.initial_pose.position.y -= 0.025
        self.another_blue_tube_request.initial_pose.position.y -= 0.025
        self.green_tube_request.initial_pose.position.y -= 0.025
        self.red_tube_request.initial_pose.position.y -= 0.025
        self.green_tube_request.model_name = 'green_tube_layer3'
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)


        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.x += 0.025
        # self.green_tube_request.initial_pose.position.x += 0.025
        # self.red_tube_request.initial_pose.position.x += 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)
        self.blue_tube_request.model_name+="2"
        self.another_blue_tube_request.model_name+="2"
        self.green_tube_request.model_name+="2"
        self.red_tube_request.model_name+="2"
        self.blue_tube_request.initial_pose.position.y += 0.05
        self.another_blue_tube_request.initial_pose.position.y += 0.05
        self.green_tube_request.initial_pose.position.y += 0.05
        self.red_tube_request.initial_pose.position.y += 0.05
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.x -= 0.025
        # self.green_tube_request.initial_pose.position.x -= 0.025
        # self.red_tube_request.initial_pose.position.x -= 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)
        self.blue_tube_request.model_name+="2"
        self.another_blue_tube_request.model_name+="2"
        self.green_tube_request.model_name+="2"
        self.red_tube_request.model_name+="2"
        self.blue_tube_request.initial_pose.position.y += 0.05
        self.another_blue_tube_request.initial_pose.position.y += 0.05
        self.green_tube_request.initial_pose.position.y += 0.05
        self.red_tube_request.initial_pose.position.y += 0.05
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.x += 0.025
        # self.green_tube_request.initial_pose.position.x += 0.025
        # self.red_tube_request.initial_pose.position.x += 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)


        self.blue_tube_request.model_name+="1"
        self.another_blue_tube_request.model_name+="1"
        self.green_tube_request.model_name+="1"
        self.red_tube_request.model_name+="1"
        self.blue_tube_request.initial_pose.position.y -= 0.15
        self.another_blue_tube_request.initial_pose.position.y -= 0.15
        self.green_tube_request.initial_pose.position.y -= 0.15
        self.red_tube_request.initial_pose.position.y -= 0.15
        self.spawn_model(self.blue_tube_request)
        self.spawn_model(self.another_blue_tube_request)
        self.spawn_model(self.red_tube_request)
        self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="2"
        # self.green_tube_request.model_name+="2"
        # self.red_tube_request.model_name+="2"

        # self.blue_tube_request.initial_pose.position.x -= 0.025
        # self.green_tube_request.initial_pose.position.x -= 0.025
        # self.red_tube_request.initial_pose.position.x -= 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)


        # self.blue_tube_request.model_name+="1"
        # self.green_tube_request.model_name+="1"
        # self.red_tube_request.model_name+="1"
        # self.blue_tube_request.initial_pose.position.y += 0.05
        # self.green_tube_request.initial_pose.position.y += 0.05
        # self.red_tube_request.initial_pose.position.y += 0.05
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)
        # self.blue_tube_request.model_name+="2"
        # self.green_tube_request.model_name+="2"
        # self.red_tube_request.model_name+="2"

        # self.blue_tube_request.initial_pose.position.x += 0.025
        # self.green_tube_request.initial_pose.position.x += 0.025
        # self.red_tube_request.initial_pose.position.x += 0.025
        # self.spawn_model(self.blue_tube_request)
        # self.spawn_model(self.red_tube_request)
        # self.spawn_model(self.green_tube_request)
        self.layer_request.initial_pose.position.z = 0.08
        self.layer_request.model_name = 'layer4'
        self.spawn_model(self.layer_request)
        rospy.loginfo("successfully spawned the model")

def main():
    node = SpawnNewDepowderingSurface()
    rospy.sleep(1)
    node.spawn_plate_model()
    # node.run()

if __name__ == '__main__':
    main()
