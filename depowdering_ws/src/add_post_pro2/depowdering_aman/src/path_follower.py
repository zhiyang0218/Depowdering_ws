#!/usr/bin/env python3

import rospy
import moveit_commander
from geometry_msgs.msg import Pose, PoseStamped
import sys
import pandas as pd
import copy
import tf2_ros
import tf2_geometry_msgs
from controller_manager_msgs.srv import ListControllers, ListControllersRequest

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

def check_controllers_ready():
    """ Verify arm_controller is in running state """
    rospy.loginfo("Checking controller status...")
    try:
        rospy.wait_for_service('/add_post_pro_depowdering/controller_manager/list_controllers', 5.0)
        list_controllers = rospy.ServiceProxy(
            '/add_post_pro_depowdering/controller_manager/list_controllers', 
            ListControllers
        )
        response = list_controllers()
        for controller in response.controller:
            if controller.name == "arm_controller":
                rospy.loginfo(f"arm_controller state: {controller.state}")
                return controller.state == "running"
        rospy.logerr("arm_controller not found in controller list")
        return False
    except (rospy.ServiceException, rospy.ROSException) as e:
        rospy.logerr(f"Controller check failed: {e}")
        return False

def move_through_waypoints(waypoints_df, arm_group):
    waypoints = []
    fixed_orientation = Pose().orientation
    fixed_orientation.x = 0.0
    fixed_orientation.y = 1.0
    fixed_orientation.z = 0.0
    fixed_orientation.w = 0.0

    for _, row in waypoints_df.iterrows():
        pose = Pose()
        pose.position.x = row['x']
        pose.position.y = row['y']
        pose.position.z = row['z']
        pose.orientation = fixed_orientation
        waypoints.append(copy.deepcopy(pose))

    (plan, fraction) = arm_group.compute_cartesian_path(
        waypoints,
        eef_step=0.01,   # 1 cm 插值
        jump_threshold=0.0
    )
    if fraction < 1.0:
        rospy.logwarn(f"Path only achieved fraction: {fraction}")
    return arm_group.execute(plan, wait=True)



def path_follower_commander(path_points, sim=True):
    # Initialize MoveGroup with longer timeout
    try:
        arm_group = moveit_commander.MoveGroupCommander(
            "arm", 
            wait_for_servers=60.0  # Increased to 60s like working code
        )
    except RuntimeError as e:
        rospy.logerr(f"MoveGroup connection failed: {e}")
        return
    
    # Set parameters EXACTLY like your working grasping code
    arm_group.set_pose_reference_frame("base_link")
    arm_group.set_goal_position_tolerance(0.005)
    arm_group.set_goal_orientation_tolerance(0.01)
    arm_group.set_planning_time(10.0)  # Same as working code
    arm_group.allow_replanning(True)   # Same as working code
    
    # Verify controllers are running - CRITICAL
    if not check_controllers_ready():
        rospy.logerr("Aborting: arm_controller not ready")
        return
    
    input("Press Enter to move to 'ready' position...")
    
    # Slow down a bit
    arm_group.set_max_velocity_scaling_factor(0.2)
    arm_group.set_max_acceleration_scaling_factor(0.2)

    # Move to 'rest'
    rospy.loginfo("Moving to 'rest' position")
    arm_group.set_start_state_to_current_state()
    arm_group.set_named_target("rest")
    rospy.sleep(0.2)
    success_flag, plan, planning_time, error_code = arm_group.plan()
   # plan to the named target
    if not success_flag or not plan.joint_trajectory.points:
        rospy.logerr("Empty plan to 'rest'")
        return
    success = arm_group.execute(plan, wait=True)
    arm_group.stop()
    arm_group.clear_pose_targets()
    if not success:
        rospy.logerr("Failed to move to 'rest' position")
        return

     # Move to 'ready'
    rospy.loginfo("Moving to 'ready' position")
    arm_group.set_start_state_to_current_state()
    arm_group.set_named_target("ready")
    rospy.sleep(0.2)
    success_flag, plan, planning_time, error_code = arm_group.plan()
    if not success_flag or not plan.joint_trajectory.points:
        rospy.logerr("Empty plan to 'ready'")
        return
    success = arm_group.execute(plan, wait=True)
    arm_group.stop()
    arm_group.clear_pose_targets()
    if not success:
        rospy.logerr("Failed to move to 'ready' position")
        return

    input("Press Enter to start following the path...")
    
    # Execute path using waypoint method
    if not move_through_waypoints(path_points, arm_group):
        rospy.logerr("Path execution aborted")
        return

    # Move to rest position with same workflow
    rospy.loginfo("Moving to 'rest' position")
    arm_group.set_start_state_to_current_state()
    arm_group.set_named_target("rest")
    rospy.sleep(0.5)  # Same execution delay
    arm_group.go(wait=True)
    arm_group.stop()
    arm_group.clear_pose_targets()
    
    moveit_commander.roscpp_shutdown()
    rospy.signal_shutdown("Path following complete")


if __name__ == "__main__":
    rospy.init_node('path_follower_node', anonymous=True)
    
    # Longer initialization delay
    rospy.sleep(5.0)
    
    try:
        moveit_commander.roscpp_initialize(sys.argv)
        
        sim_mode = rospy.get_param('~sim', True)
        file_path = rospy.get_param('~path_file')
        
        rospy.loginfo(f"Reading path: {file_path}")
        df = pd.read_csv(file_path)
        
        path_follower_commander(df, sim=sim_mode)

    except Exception as e:
        rospy.logerr(f"Fatal error: {e}")
        moveit_commander.roscpp_shutdown()
