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
import math
import time

# ---------- utilities ----------
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

# ---------- robust compute_cartesian_path wrapper ----------
def compute_cartesian_path_robust(group, waypoints, eef_step=0.01, jump_threshold=0.0):
    """
    Try several compute_cartesian_path call styles until one works.
    Returns (plan, fraction) or (None, 0.0) on failure.
    Logs which signature succeeded.
    """
    tried = []

    # candidate call patterns (positional)
    candidates = [
        # common MoveIt 1 / examples
        (lambda: group.compute_cartesian_path(waypoints, eef_step, jump_threshold)),
        # some installations expect avoid_collisions (bool) as 3rd arg
        (lambda: group.compute_cartesian_path(waypoints, eef_step, False)),
        # some possible 4-arg forms (eef_step, jump_threshold, avoid_collisions)
        (lambda: group.compute_cartesian_path(waypoints, eef_step, jump_threshold, False)),
        (lambda: group.compute_cartesian_path(waypoints, eef_step, jump_threshold, True)),
        # try with named argument if binding supports it (less common)
        (lambda: group.compute_cartesian_path(waypoints, eef_step, jump_threshold, avoid_collisions=True)),
    ]

    for idx, call in enumerate(candidates):
        try:
            res = call()
            # Many bindings return (plan, fraction) or return a tuple-like object.
            if isinstance(res, tuple) and len(res) >= 2:
                plan = res[0]
                fraction = res[1]
                rospy.loginfo(f"compute_cartesian_path succeeded with candidate #{idx}")
                return plan, fraction
            # Some older bindings return (trajectory_msg, fraction) as list-like - still works above
            # If it returns a MoveIt plan-like object directly:
            if hasattr(res, 'joint_trajectory') or hasattr(res, 'trajectory'):
                # unknown structure: try to detect fraction separately (default to 1.0)
                rospy.loginfo(f"compute_cartesian_path returned plan-like object with candidate #{idx}")
                return res, 1.0
            # otherwise treat as failure
            tried.append((idx, type(res), res))
        except TypeError as te:
            tried.append((idx, 'TypeError', str(te)))
        except Exception as e:
            # many possible errors: binding mismatch, runtime error (e.g. constraint type), etc.
            tried.append((idx, type(e).__name__, str(e)))

    rospy.logerr("compute_cartesian_path: all candidate signatures failed. Attempts:")
    for attempt in tried:
        rospy.logerr(f"  attempt: {attempt}")
    return None, 0.0

# ---------- waypoint execution ----------
def move_through_waypoints(waypoints_df, arm_group):
    waypoints = []
    fixed_orientation = Pose().orientation
    fixed_orientation.x = 0.0
    fixed_orientation.y = 1.0
    fixed_orientation.z = 0.0
    fixed_orientation.w = 0.0

    for i, row in waypoints_df.iterrows():
        pose = Pose()
        pose.position.x = float(row['x'])
        pose.position.y = float(row['y'])
        pose.position.z = float(row['z'])
        pose.orientation = fixed_orientation
        waypoints.append(copy.deepcopy(pose))

    # Use robust wrapper to call compute_cartesian_path
    plan, fraction = compute_cartesian_path_robust(arm_group, waypoints, eef_step=0.01, jump_threshold=0.0)

    if plan is None:
        rospy.logerr("Failed to compute cartesian path (no plan)")
        return False

    if fraction < 1.0:
        rospy.logwarn(f"Path only achieved fraction: {fraction}")

    # execute and check result
    success = False
    try:
        success = arm_group.execute(plan, wait=True)
    except Exception as e:
        rospy.logerr(f"Exception when executing cartesian plan: {e}")
        success = False

    if not success:
        rospy.logerr("Execution of cartesian path failed (CONTROL_FAILED or similar).")
    else:
        rospy.loginfo("Cartesian path executed successfully.")

    return bool(success)

# ---------- main commander ----------
def path_follower_commander(path_points, sim=True):
    # Initialize full MoveIt interfaces (match trajectory_commander)
    moveit_commander.roscpp_initialize(sys.argv)  # ensure initialized (safe to call)
    robot = moveit_commander.RobotCommander()
    scene = moveit_commander.PlanningSceneInterface()
    arm_group = moveit_commander.MoveGroupCommander("arm")

    if sim:
        gripper_group = moveit_commander.MoveGroupCommander("gripper")
    else:
        gripper_group = None

    arm_group.set_pose_reference_frame("base_link")
    if sim and gripper_group is not None:
        gripper_group.set_pose_reference_frame("base_link")

    # same tolerances / settings as working script
    arm_group.set_goal_position_tolerance(0.005)
    arm_group.set_goal_orientation_tolerance(0.01)
    arm_group.set_planning_time(10.0)
    arm_group.allow_replanning(True)

    # check controllers
    if not check_controllers_ready():
        rospy.logerr("Aborting: arm_controller not ready")
        return

    input("Press Enter to move to 'ready' position...")

    # slow down
    arm_group.set_max_velocity_scaling_factor(0.2)
    arm_group.set_max_acceleration_scaling_factor(0.2)

    # small wait to allow state topics to propagate
    rospy.sleep(2.0)
    arm_group.set_start_state_to_current_state()

    # helper to attempt named-target with diagnostics and simple fallback
    def try_named_target_with_fallback(name, max_attempts=2):
        attempt = 0
        while attempt < max_attempts:
            attempt += 1
            rospy.loginfo(f"[attempt {attempt}] Move to named target '{name}'")
            arm_group.set_start_state_to_current_state()
            arm_group.set_named_target(name)
            # try direct go() like trajectory_commander
            ok = arm_group.go(wait=True)
            arm_group.stop()
            arm_group.clear_pose_targets()
            if ok:
                rospy.loginfo(f"Reached '{name}'")
                return True
            rospy.logwarn(f"Move to '{name}' returned failure (CONTROL_FAILED or TIMED_OUT). Dumping diagnostics...")

            # diagnostic info
            try:
                current_joints = arm_group.get_current_joint_values()
                rospy.logwarn(f"Current joints: {current_joints}")
            except Exception:
                rospy.logwarn("Could not read current joint values")

            # reduce speeds more aggressively and try a tiny nudge
            cur_vel = getattr(arm_group, '_max_velocity_scaling_factor', None)
            rospy.loginfo("Reducing velocity scaling and trying a small nudge before retrying.")
            arm_group.set_max_velocity_scaling_factor(0.05)
            arm_group.set_max_acceleration_scaling_factor(0.05)

            # tiny nudge: move to current joint state slightly away to wake controller
            try:
                jv = arm_group.get_current_joint_values()
                if jv and len(jv) > 0:
                    nudge = [v + (0.01 if i % 2 == 0 else -0.01) for i, v in enumerate(jv)]
                    arm_group.set_joint_value_target(nudge)
                    arm_group.go(wait=True)
                    arm_group.stop()
                    arm_group.clear_pose_targets()
                    rospy.loginfo("Performed small nudge.")
            except Exception as e:
                rospy.logwarn(f"Small nudge failed: {e}")

            # restore slightly higher but still conservative speed before retry
            arm_group.set_max_velocity_scaling_factor(0.1)
            arm_group.set_max_acceleration_scaling_factor(0.1)
            rospy.sleep(0.5)
        return False

    # Move to 'rest' then open gripper then 'ready' (same sequence as working file)
    if not try_named_target_with_fallback("rest"):
        rospy.logerr("Failed to reach 'rest' after retries; aborting.")
        return

    if sim and gripper_group is not None:
        rospy.loginfo("Opening gripper (release)")
        gripper_group.set_named_target("release")
        gripper_group.go(wait=True)
        gripper_group.stop()
        gripper_group.clear_pose_targets()

    if not try_named_target_with_fallback("ready"):
        rospy.logerr("Failed to reach 'ready' after retries; aborting.")
        return

    input("Press Enter to start following the path...")

    # follow waypoints
    ok = move_through_waypoints(path_points, arm_group)
    if not ok:
        rospy.logerr("Path execution aborted")
        return

    # return to rest
    rospy.loginfo("Moving back to 'rest' position'")
    arm_group.set_named_target("rest")
    arm_group.go(wait=True)
    arm_group.stop()
    arm_group.clear_pose_targets()

    moveit_commander.roscpp_shutdown()
    rospy.signal_shutdown("Path following complete")


if __name__ == "__main__":
    rospy.init_node('path_follower_node', anonymous=True)
    rospy.sleep(5.0)

    try:
        # ensure moveit_commander initialized later inside the function too
        sim_mode = rospy.get_param('~sim', True)
        file_path = rospy.get_param('~path_file')
        rospy.loginfo(f"Reading path: {file_path}")
        df = pd.read_csv(file_path)
        path_follower_commander(df, sim=sim_mode)
    except Exception as e:
        rospy.logerr(f"Fatal error: {e}")
        try:
            moveit_commander.roscpp_shutdown()
        except Exception:
            pass

