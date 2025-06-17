#!/usr/bin/env python3

import rospy
import csv
from moveit_commander import RobotCommander, PlanningSceneInterface
from geometry_msgs.msg import PoseStamped, TransformStamped
from tf.transformations import quaternion_from_euler, quaternion_multiply, quaternion_inverse
import tf2_ros
import tf2_geometry_msgs
from gazebo_msgs.srv import SpawnModel
from gazebo_msgs.msg import ModelState
from std_msgs.msg import ColorRGBA

def create_collision_object(scene, part_id, pose, size):
    object_id = f"part_{part_id}"
    scene.add_cylinder(object_id, pose, height=size['z'], radius=size['r'])

def spawn_cylinder_in_gazebo(part_id, pose, size):
    cylinder_sdf = f"""
    <sdf version="1.6">
        <model name="part_{part_id}">
            <static>false</static>
            <link name="link">
                <inertial>
                    <mass>10.0</mass>
                    <inertia>
                        <ixx>0.01</ixx>
                        <iyy>0.01</iyy>
                        <izz>0.01</izz>
                    </inertia>
                </inertial>
                <visual name="visual">
                    <geometry>
                        <cylinder>
                            <radius>{size['r']}</radius>
                            <length>{size['z']}</length>
                        </cylinder>
                    </geometry>
                    <material>
                        <ambient>0 0 1 1</ambient>
                    </material>
                </visual>
                <collision name="collision">
                    <geometry>
                        <cylinder>
                            <radius>{size['r']}</radius>
                            <length>{size['z']}</length>
                        </cylinder>
                    </geometry>
                </collision>
            </link>
        </model>
    </sdf>
    """

    robot_height = 0.096  # Adjust this value as needed
    pose.position.z += robot_height  # Adjust the height to avoid collision with the robot

    rospy.wait_for_service('/gazebo/spawn_sdf_model')
    spawn_model_prox = rospy.ServiceProxy('/gazebo/spawn_sdf_model', SpawnModel)
    pose_stamped = PoseStamped()
    pose_stamped.header.frame_id = "world"
    pose_stamped.pose = pose
    spawn_model_prox(model_name=f"cylinder_{part_id}", model_xml=cylinder_sdf, robot_namespace="", initial_pose=pose, reference_frame="world")

    rospy.sleep(0.5)  # Increase sleep duration between spawning cylinders


def transform_pose(input_pose, from_frame, to_frame):
    tf_buffer = tf2_ros.Buffer()
    listener = tf2_ros.TransformListener(tf_buffer)

    try:
        transform = tf_buffer.lookup_transform(to_frame, from_frame, rospy.Time(0), rospy.Duration(1.0))
        pose_transformed = tf2_geometry_msgs.do_transform_pose(input_pose, transform)
        return pose_transformed
    except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException) as e:
        rospy.logerr(f"Could not transform {from_frame} to {to_frame}: {e}")
        return None

def read_csv_and_add_objects(file_path):
    rospy.init_node('cylinder_collision_generator', anonymous=True)

    scene = PlanningSceneInterface()
    robot = RobotCommander()

    rospy.sleep(2)  # Give some time for the planning scene to be ready

    print("Reading CSV file and adding collision objects...")

    with open(file_path, 'r') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            part_id = int(row['id'])  # Assuming 'id' is the correct column name in your CSV
            x = float(row['px'])  # Assuming 'px' is the correct column name in your CSV
            y = float(row['py'])  # Assuming 'py' is the correct column name in your CSV
            z = float(row['pz'])  # Assuming 'pz' is the correct column name in your CSV
            o_x = float(row['ox'])
            o_y = float(row['oy'])
            o_z = float(row['oz'])
            o_w = float(row['ow'])
            print(f"Read part {part_id} at position ({x}, {y}, {z}) | Orientation ({o_x}, {o_y}, {o_z}, {o_w})")

            # Create PoseStamped for the collision object
            pose = PoseStamped()
            pose.header.frame_id = "powder_box"
            pose.pose.position.x = x
            pose.pose.position.y = y
            pose.pose.position.z = z
            pose.pose.orientation.x = o_x
            pose.pose.orientation.y = o_y
            pose.pose.orientation.z = o_z
            pose.pose.orientation.w = o_w

            # Define cylinder size
            size = {'r': 0.0075, 'z': 0.023}  # Radius and height -> Adjust these values as needed

            # Add the cylinder as a collision object in MoveIt!
            create_collision_object(scene, part_id, pose, size)

            # Transform pose from powder_box to world frame for Gazebo
            transformed_pose = transform_pose(pose, "powder_box", "world")
            if transformed_pose:
                # Spawn the cylinder in Gazebo with blue color
                spawn_cylinder_in_gazebo(part_id, transformed_pose.pose, size)
                print(f"Added cylinder {part_id} in Gazebo at transformed pose.")

            rospy.sleep(0.1)  # Short pause to ensure proper object creation

if __name__ == '__main__':
    try:
        file_path = '/home/aman/Desktop/test_config.csv'  # Update this path
        read_csv_and_add_objects(file_path)
    except rospy.ROSInterruptException:
        pass
