#!/usr/bin/env python

import rospy
import moveit_commander
import sys
from geometry_msgs.msg import Pose
from gazebo_ros_link_attacher.srv import Attach, AttachRequest, AttachResponse
from gazebo_msgs.srv import DeleteModel, SpawnModel, DeleteModelRequest
from add_post_pro_simulation.srv import DetectPose, DetectPoseRequest, DetectPoseResponse
import copy

class ControlRobotArm:
    def __init__(self):
        moveit_commander.roscpp_initialize(sys.argv)
        rospy.init_node("control_robot_arm")
        group_name = "arm"
        self.eef_step = 0.05
        self.jump_threshold = 0.0
        self.group = moveit_commander.MoveGroupCommander(group_name)
        # Get the joint limits
        # joint_limits = self.group.get_active_joint_limits()

        # # Extract the maximum velocity scaling factor
        # max_velocity_scaling_factor = joint_limits.velocity

        # # Print the maximum velocity scaling factor
        # rospy.loginfo("Maximum Velocity Scaling Factor: {}".format(max_velocity_scaling_factor))
        # joint_names = self.group.get_active_joints()
        # vel_limits = [1.0] * len(joint_names)  # Adjust the values as needed
        # acc_limits = [1.0] * len(joint_names)  # Adjust the values as needed

        self.group.set_max_velocity_scaling_factor(1)
        self.group.set_max_acceleration_scaling_factor(1)
        self.group.set_planning_time(15.0)
        
        rospy.loginfo("moveit connected")
        rospy.wait_for_service("/link_attacher_node/attach")
        rospy.wait_for_service("/link_attacher_node/detach")
        rospy.loginfo("Services available")
        self.attach_client = rospy.ServiceProxy("/link_attacher_node/attach", Attach)
        self.detach_client = rospy.ServiceProxy("/link_attacher_node/detach", Attach)
        # Set up services
        print("Waiting for gazebo services...")
        rospy.wait_for_service("gazebo/delete_model")
        rospy.wait_for_service("gazebo/spawn_sdf_model")
        print("Services available")
        self.delete_model = rospy.ServiceProxy("gazebo/delete_model", DeleteModel)
        self.spawn_model = rospy.ServiceProxy("gazebo/spawn_sdf_model", SpawnModel)
        # rospy.wait_for_service("detect_pose")
        # self.detect_pose_client = rospy.ServiceProxy("detect_pose", DetectPose)
        # rospy.loginfo("detect pose service connected")

    def home(self):
        pose = Pose()
        pose.position.x = -0.015
        pose.position.y = 0.0
        pose.position.z = 1.185
        pose.orientation.w = 1.0
        return pose

    def pick_pose(self):
        pose = Pose()
        pose.position.x = 0.06617507827038122
        pose.position.y = 0.598002376397993
        pose.position.z = 0.4867784820963679
        pose.orientation.x = -0.9995618702389268
        pose.orientation.y = -0.007961467475101734
        pose.orientation.z = -0.021388665963334778
        pose.orientation.w = 0.01884695117015885
        return pose

    def get_vaccum_gripper_up(self):
        pose = Pose()
        pose.position.x = -0.40572
        pose.position.y = -0.04445
        pose.position.z = 0.6
        pose.orientation.x = -2.8278477451551256e-05
        pose.orientation.y = -0.9998405738649745
        pose.orientation.z = -3.892520732662404e-05
        pose.orientation.w = 0.017855658445275573
        return pose

    def right_side_points(self):
        pose = Pose()
        pose.position.x = -0.4280439692585026
        pose.position.y = 0.036278613022619914
        pose.position.z =  0.6197435598542494
        pose.orientation.x = -0.7077726492223453 #0.5351962426881547
        pose.orientation.y = 0.706087347618269 #-0.5255623336620492
        pose.orientation.z = 0.020629305663132248 #0.46389648001736433
        pose.orientation.w = 0.008542031025348283 #0.47132713806408577
        '''
        pose: 
            position: 
                x: -0.4280439692585026
                y: 0.036278613022619914
                z: 0.6197435598542494
            orientation: 
                x: 0.12903299463848536
                y: 0.9910376178534425
                z: -0.033910562507977984
                w: 0.00670820724122646
        '''
        return pose

    def get_vaccum_gripper(self):
        pose = Pose()
        pose.position.x = -0.40572
        pose.position.y = -0.04445
        pose.position.z =  0.4386 # 0.475
        pose.orientation.x = -2.8278477451551256e-05
        pose.orientation.y = -0.9998405738649745
        pose.orientation.z = -3.892520732662404e-05
        pose.orientation.w = 0.017855658445275573
        return pose
    
    def get_wire_gripper(self):
        pose = Pose()
        pose.position.x = -0.40572
        pose.position.y = 0.20443 #-0.20443
        pose.position.z = 0.445
        pose.orientation.x = -6.35332521390375e-05
        pose.orientation.y = -0.999840739145919
        pose.orientation.z = -0.00020056780730984768
        pose.orientation.w = 0.01784522569829262
        return pose
    
    def get_wire_gripper_up(self):
        pose = Pose()
        pose.position.x = 0.40572
        pose.position.y = 0.20443 #-0.20443
        pose.position.z = 0.6
        pose.orientation.x = -6.35332521390375e-05
        pose.orientation.y = -0.999840739145919
        pose.orientation.z = -0.00020056780730984768
        pose.orientation.w = 0.01784522569829262
        return pose

    def vaccum_depowdering(self):
        pose = Pose()
        pose.position.x = -0.048984702235388825
        pose.position.y = 0.5519118578464464
        pose.position.z = 0.23350416881651526
        pose.orientation.x = -0.9992046447871745
        pose.orientation.y = -0.02818107376989991
        pose.orientation.z = -0.021340453010279477
        pose.orientation.w = 0.01845237063978171
        return pose
    
    def claw_depowdering(self):
        pose = Pose()
        pose.position.x = -0.048984702235388825
        pose.position.y = 0.5519118578464464
        pose.position.z = 0.23350416881651526
        pose.orientation.x = -0.9992046447871745
        pose.orientation.y = -0.02818107376989991
        pose.orientation.z = -0.021340453010279477
        pose.orientation.w = 0.01845237063978171
        return pose
    
    def turn_table(self):
        pose = Pose()
        pose.position.x = -0.0045782635387886725 #0.0020324533439694467
        pose.position.y = -0.5881878711981184 #-0.35740284149839047
        pose.position.z = 0.582838281098707 #0.47093740875328916
        pose.orientation.x = -0.7077726492223453 #0.5351962426881547
        pose.orientation.y = 0.706087347618269 #-0.5255623336620492
        pose.orientation.z = 0.020629305663132248 #0.46389648001736433
        pose.orientation.w = 0.008542031025348283 #0.47132713806408577
        return pose

    def prepare_vaccum_attachment(self):
        req = AttachRequest()
        req.model_name_1 = 'add_post_pro_robot'
        req.link_name_1 = 'J6'
        req.model_name_2 = 'vaccum_gripper'
        req.link_name_2 = 'vaccum_link'
        return req
    
    def prepare_claw_attachment(self):
        req = AttachRequest()
        req.model_name_1 = 'add_post_pro_robot'
        req.link_name_1 = 'J6'
        req.model_name_2 = 'wire_gripper'
        req.link_name_2 = 'gripper_link'
        return req
    
    def turning_send_goal_cartesian(self, pose: Pose) -> Pose:
        '''
        send goal cartesian
        '''
        waypoints = []

        # pose.position.x = -0.048984702235388825
        # pose.position.y = 0.5519118578464464
        # pose.position.z = 0.23350416881651526

        # pose.position.x = 0.0045782635387886725 #0.0020324533439694467
        # pose.position.y = -0.5881878711981184 #-0.35740284149839047
        # pose.position.z = 0.582838281098707 #0.47093740875328916

        # also move along z
        pose.position.z = 0.6
        waypoints.append(copy.deepcopy(pose))

        # first move along y
        pose.position.y = 0.258818
        waypoints.append(copy.deepcopy(pose))

        # second move along x
        pose.position.x = 0.3
        waypoints.append(copy.deepcopy(pose))
        
         # first move along y
        pose.position.y = 0.0
        waypoints.append(copy.deepcopy(pose))

        # # second move along x
        # pose.position.x = -0.3
        # waypoints.append(copy.deepcopy(pose))

        # first move along y
        pose.position.y = -0.58818
        waypoints.append(copy.deepcopy(pose))

        # second move along x
        pose.position.x = 0.004578
        waypoints.append(copy.deepcopy(pose))

        # # first move along y
        # pose.position.y = -0.58818
        # waypoints.append(copy.deepcopy(pose))


        # second move along z
        pose.position.z = 0.5828
        waypoints.append(copy.deepcopy(pose))


        # self.group.set_pose_target(pose)
        (plan, fraction) = self.group.compute_cartesian_path(
            waypoints, self.eef_step, self.jump_threshold
        )
        # plan = self.group.go(wait=True)
        self.group.execute(plan, wait=True)
        waypoints.clear()
        self.group.clear_pose_targets()

        return pose
    

    def send_goal_cartesian_turning_table(self, pose: Pose):
        '''
        send goal cartesian
        '''
        waypoints = []

        # pose.position.x = -0.048984702235388825
        # pose.position.y = 0.5519118578464464
        # pose.position.z = 0.23350416881651526

        # pose.position.x = 0.0045782635387886725 #0.0020324533439694467
        # pose.position.y = -0.5881878711981184 #-0.35740284149839047
        # pose.position.z = 0.582838281098707 #0.47093740875328916
        pose.position.y = -0.258818
        waypoints.append(copy.deepcopy(pose))

        pose.position.x = 0.3
        waypoints.append(copy.deepcopy(pose))

        pose.position.y = 0.0
        waypoints.append(copy.deepcopy(pose))

        pose.position.y = 0.5519118578464464
        waypoints.append(copy.deepcopy(pose))

        pose.position.x = -0.048984702235388825
        waypoints.append(copy.deepcopy(pose))

        pose.position.z = 0.23350416881651526
        waypoints.append(copy.deepcopy(pose))



        # self.group.set_pose_target(pose)
        (plan, fraction) = self.group.compute_cartesian_path(
            waypoints, self.eef_step, self.jump_threshold
        )
        # plan = self.group.go(wait=True)
        self.group.execute(plan, wait=True)
        waypoints.clear()
        self.group.clear_pose_targets()

    def send_goal_cartesian_turning_box(self, pose: Pose, x: float, y: float):
        '''
        send goal cartesian
        '''
        waypoints = []

        # pose.position.x = -0.048984702235388825
        # pose.position.y = 0.5519118578464464
        # pose.position.z = 0.23350416881651526

        # pose.position.x = 0.0045782635387886725 #0.0020324533439694467
        # pose.position.y = -0.5881878711981184 #-0.35740284149839047
        # pose.position.z = 0.582838281098707 #0.47093740875328916
        pose.position.y = -0.258818
        waypoints.append(copy.deepcopy(pose))

        pose.position.x = 0.3
        waypoints.append(copy.deepcopy(pose))

        pose.position.y = 0.0
        waypoints.append(copy.deepcopy(pose))

        pose.position.y = y
        waypoints.append(copy.deepcopy(pose))

        pose.position.x = x
        waypoints.append(copy.deepcopy(pose))

        pose.position.z = 0.23350416881651526
        waypoints.append(copy.deepcopy(pose))



        # self.group.set_pose_target(pose)
        (plan, fraction) = self.group.compute_cartesian_path(
            waypoints, self.eef_step, self.jump_threshold
        )
        # plan = self.group.go(wait=True)
        self.group.execute(plan, wait=True)
        waypoints.clear()
        self.group.clear_pose_targets()


    def send_goal_cartesian(self, pose: Pose):
        '''
        send goal cartesian
        '''
        waypoints = []

        # pose.position.x = -0.048984702235388825
        # pose.position.y = 0.5519118578464464
        # pose.position.z = 0.23350416881651526

        # pose.position.x = 0.0045782635387886725 #0.0020324533439694467
        # pose.position.y = -0.5881878711981184 #-0.35740284149839047
        # pose.position.z = 0.582838281098707 #0.47093740875328916

        # also move along z
        pose.position.z = 0.6
        waypoints.append(copy.deepcopy(pose))

        # first move along y
        pose.position.y = 0.258818
        waypoints.append(copy.deepcopy(pose))

        # second move along x
        pose.position.x = 0.3
        waypoints.append(copy.deepcopy(pose))
        
         # first move along y
        pose.position.y = 0.0
        waypoints.append(copy.deepcopy(pose))

        # # second move along x
        # pose.position.x = -0.3
        # waypoints.append(copy.deepcopy(pose))

        # first move along y
        pose.position.y = -0.58818
        waypoints.append(copy.deepcopy(pose))

        # second move along x
        pose.position.x = 0.004578
        waypoints.append(copy.deepcopy(pose))

        # # first move along y
        # pose.position.y = -0.58818
        # waypoints.append(copy.deepcopy(pose))


        # second move along z
        pose.position.z = 0.5828
        waypoints.append(copy.deepcopy(pose))


        # self.group.set_pose_target(pose)
        (plan, fraction) = self.group.compute_cartesian_path(
            waypoints, self.eef_step, self.jump_threshold
        )
        # plan = self.group.go(wait=True)
        self.group.execute(plan, wait=True)
        waypoints.clear()
        self.group.clear_pose_targets()

    def send_goal(self, pose: Pose):
        self.group.set_pose_target(pose)
        plan = self.group.go(wait=True)
        # self.group.execute(plan, wait=True)
        self.group.clear_pose_targets()
    
    def attach(self, req: AttachRequest):
        self.attach_client.call(req)

    def detach(self, req: AttachRequest):
        self.detach_client.call(req)

    def delete_layer(self, model_name: str):
        req = DeleteModelRequest()
        req.model_name = model_name
        self.delete_model.call(req)

    def pick_object(self, name:str):
        req = DetectPoseRequest()
        req.name = name
        res = self.detect_pose_client.call(req)
        rospy.loginfo("%s object pose is x: %f, y: %f, z: %f".format(name, res.x, res.y, res.z))
        

    def run(self):
        # self.got_turn_table()
        # go to vaccum
        #pose = self.get_vaccum_gripper_up()
        #self.send_goal(pose)
        #pose = self.get_vaccum_gripper()
        #self.send_goal(pose)
        # attach griper
        #req = self.prepare_vaccum_attachment()
        #self.attach(req)
        #pose = self.get_vaccum_gripper_up()
        #self.send_goal(pose)
        # wait for 1 sec
        #rospy.sleep(1.0)
        # go to depowdering
        #pose = self.vaccum_depowdering()
        #self.send_goal(pose)
        # wait for 1 sec
        rospy.sleep(1.0)
        # delete top layer
        #self.delete_model("layer4")
        # go to vaccum
        #pose = self.get_vaccum_gripper()
        self.send_goal(pose)
        # attach griper
        req = self.prepare_vaccum_attachment()
        self.detach(req)
        # wait for 1 sec
        rospy.sleep(1.0)
        pose = self.get_vaccum_gripper_up()
        self.send_goal(pose)
        # go to vaccum
        pose = self.get_wire_gripper_up()
        self.send_goal(pose)
        pose = self.get_wire_gripper()
        self.send_goal(pose)
        # attach griper
        req = self.prepare_claw_attachment()
        self.attach(req)
        # wait for 1 sec
        rospy.sleep(1.0)
        # for x in range(5):
            # go to depowdering
        
        x = -0.048984702235388825
        y = 0.5519118578464464

        pose = self.claw_depowdering()
        self.send_goal(pose)
        print("reached the box")
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")
        self.send_goal_cartesian_turning_box(pose, x, y+0.05)
        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")
        self.send_goal_cartesian_turning_box(pose, x, y+0.05)
        print("reached the box")
        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")
        self.send_goal_cartesian_turning_box(pose, x, y+0.1)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")
        self.send_goal_cartesian_turning_box(pose, x, y+0.15)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")
        self.send_goal_cartesian_turning_box(pose, x + 0.065, y+0.15)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")
        self.send_goal_cartesian_turning_box(pose, x + 0.065, y+0.1)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")

        self.send_goal_cartesian_turning_box(pose, x + 0.065, y+0.05)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")
        self.send_goal_cartesian_turning_box(pose, x + 0.065, y)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")

        self.send_goal_cartesian_turning_box(pose, x + 0.125, y)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")

        # next

        self.send_goal_cartesian_turning_box(pose, x + 0.125, y+0.05)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")

        self.send_goal_cartesian_turning_box(pose, x + 0.125, y+0.1)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")


        self.send_goal_cartesian_turning_box(pose, x + 0.125, y+0.15)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")


        self.send_goal_cartesian_turning_box(pose, x + 0.2, y+0.15)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")

        self.send_goal_cartesian_turning_box(pose, x + 0.2, y+0.1)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")

        self.send_goal_cartesian_turning_box(pose, x + 0.2, y+0.05)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")

        self.send_goal_cartesian_turning_box(pose, x + 0.2, y)
        print("reached the box")

        pose = self.claw_depowdering()
        pose = self.turning_send_goal_cartesian(pose)
        print("reached turning table")
        # self.got_turn_table()
        
        # pose.position.y += 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.y += 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.y += 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.x += 0.075
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.y -= 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.y -= 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.y -= 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.x += 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.y += 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.y += 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.y += 0.05
        # self.send_goal(pose)
        # self.got_turn_table()

        # pose.position.x += 0.075
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.y -= 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.y -= 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        # pose.position.y -= 0.05
        # self.send_goal(pose)
        # self.got_turn_table()
        
            
        # x: -0.019535291593920152
        # y: 0.09820443882349049
        # z: 0.488
        # pose = self.group.get_current_pose().pose
        # pose.position.x += -0.019535291593920152
        # pose.position.y += -0.09820443882349049
        # pose.position.z += -0.1
        # self.send_goal(pose)

    def got_turn_table(self):
        # go to turn table
        pose = self.turn_table()
        self.send_goal(pose)
        # wait for 1 sec
        rospy.sleep(1.0)

def main():
    node = ControlRobotArm()
    node.run()

if __name__ == '__main__':
    main()
