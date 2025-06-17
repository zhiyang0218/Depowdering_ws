#!/usr/bin/env python

import rospy
import moveit_commander
import sys
from geometry_msgs.msg import Pose
from gazebo_ros_link_attacher.srv import Attach, AttachRequest, AttachResponse
from gazebo_msgs.srv import DeleteModel, SpawnModel, DeleteModelRequest
from add_post_pro_simulation.srv import DetectPose, DetectPoseRequest, DetectPoseResponse
import copy

class ControlRobotArmGripper:
    def __init__(self):
        moveit_commander.roscpp_initialize(sys.argv)
        rospy.init_node("control_robot_arm_gripper")
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

        self.group.set_max_velocity_scaling_factor(0.20)
        self.group.set_max_acceleration_scaling_factor(1)
        self.group.set_planning_time(1.0)

     #this for vacuum 

    def go_to_vacuum_up_waypoint1(self):
        pose = Pose()
        pose.position.x = -0.09906875630626127
        pose.position.y = -0.6559997532037656
        pose.position.z = 0.31771429183477845
        pose.orientation.x = 0.7577624154241352
        pose.orientation.y = 0.6519465605754492
        pose.orientation.z = -0.020909928208522447
        pose.orientation.w = 0.018016071345799984


        return pose


    def go_to_vacuum_waypoint1(self):
        pose = Pose()
        pose.position.x = -0.10086308469974403
        pose.position.y = -0.6673023258344255
        pose.position.z = 0.10970944725334826
        pose.orientation.x = 0.7578273913799617
        pose.orientation.y = 0.6518735549070339
        pose.orientation.z = -0.0208761794884259
        pose.orientation.w = 0.017963808534818493


        return pose

    def go_to_vacuum_waypoint2(self):
        pose = Pose()
        pose.position.x = 0.11444650795656078
        pose.position.y = -0.6643199423567164
        pose.position.z = 0.1141185949297874
        pose.orientation.x =  0.6511498888807039
        pose.orientation.y = 0.7589364745858908
        pose.orientation.z =  -0.001468090072077525
        pose.orientation.w = 0.0041345453591418325



        return pose


    def go_to_vacuum_waypoint3(self):
        pose = Pose()
        pose.position.x= 0.11785383161822512
        pose.position.y = -0.4981397662340049
        pose.position.z = 0.11291948049846307
        pose.orientation.x = 0.6276044277120523
        pose.orientation.y = 0.7785206318874496
        pose.orientation.z = -0.0021702542498981733
        pose.orientation.w = 0.003687551800906528



        return pose
    


    def go_to_vacuum_waypoint4(self):
        pose = Pose()
        pose.position.x= -0.09794876455616894
        pose.position.y = -0.4938931735848077
        pose.position.z = 0.11219929019219622
        pose.orientation.x = 0.7786514857105856
        pose.orientation.y = 0.6274464347253029
        pose.orientation.z = -0.002405015263710178
        pose.orientation.w = 0.002655419512052612



        return pose


      #this for extract object 
    def go_to_store_area(self):
        pose = Pose()
        pose.position.x = 0.0056611971651233 
        pose.position.y = 0.5998402874995086 
        pose.position.z = 0.16202849735804414
        pose.orientation.x = -0.018402053982585556
        pose.orientation.y = -0.9998255271849843  
        pose.orientation.z = -0.002261902773886345
        pose.orientation.w = 0.0022723103511008667

        return pose
    

    def go_to_tube_5(self):
        pose = Pose()
        pose.position.x = 0.00551786678077
        pose.position.y = -0.600218312771
        pose.position.z = 0.175643061502
        pose.orientation.x = -0.996016236022
        pose.orientation.y = 0.0856274797287
        pose.orientation.z = 0.000725908325593
        pose.orientation.w = 0.0248810239377
        return pose
    

    def go_to_up_tube_5(self):
        pose = Pose()
        pose.position.x =  -0.000706973795355 #0.012998472403810706
        pose.position.y = -0.600229906501 #-0.5902896815254348
        pose.position.z = 0.343354071506 #0.3376484475721861
        pose.orientation.x = -0.998329752457 #0.9993199317781233
        pose.orientation.y = 0.0524022584904  #-0.024402874687131797
        pose.orientation.z = 0.0242617191298 #0.0242617191298
        pose.orientation.w = 0.0017543227186 #0.0017543227186

        return pose
    
    def go_to_tube_6(self):
        pose = Pose()
        pose.position.x = -0.0738079991539
        pose.position.y = -0.59650919497
        pose.position.z = 0.175643061502
        pose.orientation.x = -0.999760126
        pose.orientation.y = -0.00873110816291
        pose.orientation.z = 2.96508182238e-06
        pose.orientation.w = 0.0200862689921

        return pose

    def go_to_up_tube_6(self):
        pose = Pose()
        pose.position.x = -0.069569680493
        pose.position.y = -0.597154937928
        pose.position.z = 0.34668462498
        pose.orientation.x = -0.99953987201
        pose.orientation.y = 0.0181125229779
        pose.orientation.z = 0.0241963141515
        pose.orientation.w = 0.00255326352525

        return pose
   

    def go_to_tube_4(self):
        pose = Pose()
        pose.position.x = 0.0883375329557
        pose.position.y = -0.597248502804
        pose.position.z = 0.175643061502
        pose.orientation.x = -0.998397821119
        pose.orientation.y = 0.0529128232285
        pose.orientation.z = 0.0012815954268
        pose.orientation.w = 0.0200095336384

        return pose

    def go_to_up_tube_4(self):
        pose = Pose()
        pose.position.x = 0.0667099648933
        pose.position.y = -0.594021194816
        pose.position.z = 0.340136137284
        pose.orientation.x = -0.998121901472
        pose.orientation.y = 0.0562198956062
        pose.orientation.z = 0.0242775740911
        pose.orientation.w = 0.00161013529454

        return pose
    
    def go_to_tube_2(self):
        pose = Pose()
        pose.position.x = 0.00840542751248
        pose.position.y = -0.667486273158
        pose.position.z = 0.175643061502
        pose.orientation.x = -0.998868749227
        pose.orientation.y = 0.0431064955875
        pose.orientation.z = 0.00104377389631
        pose.orientation.w = 0.0200489997867

        return pose
    
    def go_to_up_tube_2(self):
        pose = Pose()
        pose.position.x = 0.0195010230082
        pose.position.y = -0.652690734026
        pose.position.z = 0.338205805714
        pose.orientation.x = -0.996929790443
        pose.orientation.y = 0.0779140362044
        pose.orientation.z = 0.000164743642447
        pose.orientation.w = 0.00776973293718

        return pose
    
    def go_to_tube_3(self):
        pose = Pose()
        pose.position.x = -0.0742536809728
        pose.position.y = -0.669395730341
        pose.position.z = 0.175643061502
        pose.orientation.x = -0.99886749894
        pose.orientation.y = 0.0431258032514
        pose.orientation.z = 0.00107138400537
        pose.orientation.w = 0.0200683031347

        return pose
    
    def go_to_up_tube_3(self):
        pose = Pose()
        pose.position.x = -0.0892334959668
        pose.position.y = -0.652693195961
        pose.position.z = 0.338066417312
        pose.orientation.x = -0.996929059095
        pose.orientation.y = 0.0779219248459
        pose.orientation.z = 0.000177601314851
        pose.orientation.w = 0.00778416461364

        return pose

    def go_to_tube_1(self):
        pose = Pose()
        pose.position.x = 0.0848014171326
        pose.position.y = -0.669600442167
        pose.position.z = 0.175643061502
        pose.orientation.x = -0.998869099995
        pose.orientation.y = 0.04306430261
        pose.orientation.z = 0.00105347302391
        pose.orientation.w = 0.0201215583571

        return pose
    

    def go_to_up_tube_1(self):
        pose = Pose()
        pose.position.x = 0.100548163606
        pose.position.y = -0.666774303659
        pose.position.z = 0.338125566541
        pose.orientation.x = -0.998125930863
        pose.orientation.y = 0.0561465084674
        pose.orientation.z = 0.0242813489855
        pose.orientation.w = 0.00161611194783

        return pose

    def go_to_tube_8(self):
        pose = Pose()
        pose.position.x = 0.00860159729075
        pose.position.y = -0.521208120352
        pose.position.z = 0.175643061502
        pose.orientation.x = -0.0411867615955
        pose.orientation.y = -0.998919290055
        pose.orientation.z = -0.00659428479164
        pose.orientation.w = 0.0205040979525

        return pose

    def go_to_up_tube_8(self):
        pose = Pose()
        pose.position.x = 0.00542300721223
        pose.position.y = -0.524330304585
        pose.position.z = 0.295078427377 
        pose.orientation.x = -0.102350880218
        pose.orientation.y = -0.994712108056
        pose.orientation.z = -0.00845887518366
        pose.orientation.w = 0.000752884743174

        return pose

    def go_to_tube_9(self):
        pose = Pose()
        pose.position.x = -0.0620695970964
        pose.position.y = -0.517242703624
        pose.position.z = 0.175643061502
        pose.orientation.x = -0.0555803374212
        pose.orientation.y = -0.998153995727
        pose.orientation.z = -0.00154576079034
        pose.orientation.w = 0.0244343514238

        return pose

    def go_to_up_tube_9(self):
        pose = Pose()
        pose.position.x = -0.0868794152036
        pose.position.y = -0.516006261574
        pose.position.z = 0.295256437813
        pose.orientation.x = -0.0159254894403
        pose.orientation.y = 0.999838354521
        pose.orientation.z = 0.00789498391185
        pose.orientation.w = 0.00270422716292

        return pose

    def go_to_tube_7(self):
        pose = Pose()
        pose.position.x = 0.0921211349173
        pose.position.y = -0.522051241261
        pose.position.z = 0.168801488279
        pose.orientation.x = -0.0775263598906
        pose.orientation.y = -0.996689262322
        pose.orientation.z = -0.00108618728838
        pose.orientation.w = 0.0244744375251

        return pose



    def go_to_up_tube_7(self):
        pose = Pose()
        pose.position.x = 0.0788299023281
        pose.position.y = -0.51532073356
        pose.position.z = 0.296089724227
        pose.orientation.x = 0.0733785104021
        pose.orientation.y = 0.997268244431
        pose.orientation.z = 0.00823111808916
        pose.orientation.w = 0.0019727027105

        return pose
    
# waypoints

    def go_to_first_waypoint(self):
        pose = Pose()
        pose.position.x = 0.5512594308798116
        pose.position.y = -0.23650871282249547
        pose.position.z = 0.3420418570511667
        pose.orientation.x = 0.842389461720819 
        pose.orientation.y = 0.5388597405591958
        pose.orientation.z = 0.0031411154797051886
        pose.orientation.w = 0.0005551393772194099

        return pose
    
    def go_to_first_waypoint11(self):
        pose = Pose()
        pose.position.x = 0.5552594308798116
        pose.position.y = -0.23650871282249547
        pose.position.z = 0.3420418570511667
        pose.orientation.x = 0.842389461720819 
        pose.orientation.y = 0.5388597405591958
        pose.orientation.z = 0.0031411154797051886
        pose.orientation.w = 0.0005551393772194099

        return pose
    
    def go_to_mid_waypoint(self):
        pose = Pose()
        pose.position.x = 0.5951647138048692 
        pose.position.y = -0.08570221947636202 
        pose.position.z = 0.3418586489764256
        pose.orientation.x = 0.7374673172773344 
        pose.orientation.y = 0.6752800094286565
        pose.orientation.z = 0.007476452345918293
        pose.orientation.w = 0.009108648314875019

        return pose

    def go_to_second_waypoint(self):
        pose = Pose()
        pose.position.x = 0.5562725072463317 
        pose.position.y = 0.22458545714909303 
        pose.position.z = 0.34205659945647726
        pose.orientation.x = -0.5706661302475668 
        pose.orientation.y = -0.8211756968436515
        pose.orientation.z = -0.0031941614712408376
        pose.orientation.w = 0.0006633506658671721

        return pose

    def go_to_third_waypoint(self):
        pose = Pose()
        pose.position.x = 0.0056611971651233 
        pose.position.y = 0.5998402874995086 
        pose.position.z = 0.34202849735804414
        pose.orientation.x = -0.018402053982585556
        pose.orientation.y = -0.9998255271849843  
        pose.orientation.z = -0.002261902773886345
        pose.orientation.w = 0.0022723103511008667

        return pose
    
    
    
    

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
    
    def turning_send_goal_cartesian(self, Pose):
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
    

    def send_goal_cartesian_turning_table(self, Pose):
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

    def send_goal_cartesian_turning_box(self, Pose , x , y ):
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


    def send_goal_cartesian(self, Pose):
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

    def send_goal(self, Pose):
        self.group.set_pose_target(Pose)
        plan = self.group.go(wait=True)
        # self.group.execute(plan, wait=True)
        self.group.clear_pose_targets()
    
    def attach(self, req):
        self.attach_client.call(req)

    def detach(self, req):
        self.detach_client.call(req)

    def delete_layer(self, model_name):
        req = DeleteModelRequest()
        req.model_name = model_name
        self.delete_model.call(req)

    def pick_object(self, name):
        req = DetectPoseRequest()
        req.name = name
        res = self.detect_pose_client.call(req)
        rospy.loginfo("%s object pose is x: %f, y: %f, z: %f".format(name, res.x, res.y, res.z))
        

    def run(self):
        # wait for 1 sec
        rospy.sleep(1.0)
        pose = self.go_to_up_tube_1()
        self.send_goal(pose)
        # wait for 1 sec
        rospy.sleep(1.0)
        pose = self.go_to_tube_1()
        self.send_goal(pose)
        print('tube 1 reached')
        rospy.sleep(4.0)
        pose = self.go_to_up_tube_1()
        self.send_goal(pose)
        print('tube 1 up reached')
        rospy.sleep(1.0)
        pose = self. go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        print('waypoint11 reached')
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self.go_to_store_area()
        self.send_goal(pose)
        print('store area reached')
        # wait for 1 sec
        rospy.sleep(2.0)
        pose = self. go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
# wait for 1 sec
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        print('waypoint11 reached')
        pose = self. go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
# wait for 1 sec
        pose = self.go_to_up_tube_2()
        self.send_goal(pose)
        print('tube 2 up reached')
        # wait for 1 sec
        rospy.sleep(1.0)
        pose = self.go_to_tube_2()
        self.send_goal(pose)
        print('tube 2 reached')
        # wait for 1 sec
        rospy.sleep(4.0)
        pose = self.go_to_up_tube_2()
        self.send_goal(pose)
        print('tube 2 up reached')
        # wait for 1 sec
        rospy.sleep(1.0)
        pose = self.go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        print('waypoint11 reached')
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self.go_to_store_area()
        self.send_goal(pose)
        print('store area reached')
        # wait for 1 sec
        rospy.sleep(2.0)
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        print('waypoint11 reached')
        pose = self. go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
# wait for 1 sec
        rospy.sleep(1.0)
        pose = self.go_to_up_tube_3()
        self.send_goal(pose)
        # wait for 1 sec
        rospy.sleep(1.0)
        pose = self.go_to_tube_3()
        self.send_goal(pose)
        print(' tube 3 reached')
        # wait for 1 sec
        rospy.sleep(4.0)
        pose = self.go_to_up_tube_3()
        self.send_goal(pose)
        # wait for 1 sec
        rospy.sleep(1.0)
        pose = self.go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        print('waypoint11 reached')
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self.go_to_store_area()
        self.send_goal(pose)
        print('store area reached')
        # wait for 1 sec
        rospy.sleep(2.0)
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
# wait for 1 sec
        rospy.sleep(0.05)
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        print('waypoint11 reached')
        pose = self.go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
#         pose = self.go_to_small_up_tube_mid1()
#         self.send_goal(pose)
#         # wait for 1 sec
#         rospy.sleep(1.0)
#         pose = self.go_to_small_mid_tube1()
#         self.send_goal(pose)
#         print('mid small tube reached')
#         rospy.sleep(1.0)
#         pose = self.go_to_small_up_tube_mid1()
#         self.send_goal(pose)
#         print('small tube up reached')
#         rospy.sleep(1.0)
# # wait for 1 sec
#         rospy.sleep(0.05)
#         pose = self. go_to_first_waypoint()
#         self.send_goal(pose)
#         print('waypoint1 reached')
# # wait for 1 sec
#         rospy.sleep(0.05)
        pose = self.go_to_up_tube_4()
        self.send_goal(pose)
        print('tube 4 up reached')
        # wait for 1 sec
        rospy.sleep(1.0)
        pose = self.go_to_tube_4()
        self.send_goal(pose)
        print('tube 4 reached')
        # wait for 1 sec
        rospy.sleep(4.0)
        pose = self. go_to_up_tube_4()
        self.send_goal(pose)
        print('tube 4 up reached')
# wait for 1 sec
        rospy.sleep(1.0)
        pose = self.go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self.go_to_store_area()
        self.send_goal(pose)
        print('store area reached')
        # wait for 1 sec
        rospy.sleep(2.0)
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_up_tube_5()
        self.send_goal(pose)
        print('tube 5 up reached')
# wait for 1 sec
        rospy.sleep(4.0)
        pose = self. go_to_tube_5()
        self.send_goal(pose)
        print('tube 5 reached')
# wait for 1 sec
        rospy.sleep(1.0)
        pose = self. go_to_up_tube_5()
        self.send_goal(pose)
        print('tube 5 up reached')
# wait for 1 sec
        rospy.sleep(1.0)
        pose = self.go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self.go_to_store_area()
        self.send_goal(pose)
        print('store area reached')
        # wait for 1 sec
        rospy.sleep(2.0)
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_up_tube_6()
        self.send_goal(pose)
        print('tube 6 up reached')
# wait for 1 sec
        rospy.sleep(1.0)
        pose = self. go_to_tube_6()
        self.send_goal(pose)
        print('tube 6 reached')
# wait for 1 sec
        rospy.sleep(4.0)
        pose = self. go_to_up_tube_6()
        self.send_goal(pose)
        print('tube 6 up reached')
# wait for 1 sec
        rospy.sleep(1.0)
        pose = self.go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self.go_to_store_area()
        self.send_goal(pose)
        print('store area reached')
        # wait for 1 sec
        rospy.sleep(2.0)
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_up_tube_7()
        self.send_goal(pose)
        print('tube 7 up reached')
# wait for 1 sec
        rospy.sleep(1.0)
        pose = self. go_to_tube_7()
        self.send_goal(pose)
        print('tube 7 reached')
# wait for 1 sec
        rospy.sleep(4.0)
        pose = self. go_to_up_tube_7()
        self.send_goal(pose)
        print('tube 7 up reached')
        pose = self.go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self.go_to_store_area()
        self.send_goal(pose)
        print('store area reached')
        # wait for 1 sec
        rospy.sleep(4.0)
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_up_tube_8()
        self.send_goal(pose)
        print('tube 8 up reached')
# wait for 1 sec
        rospy.sleep(1.0)
        pose = self. go_to_tube_8()
        self.send_goal(pose)
        print('tube 8 reached')
# wait for 1 sec
        rospy.sleep(4.0)
        pose = self. go_to_up_tube_8()
        self.send_goal(pose)
        print('tube 8 up reached')
        pose = self.go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self.go_to_store_area()
        self.send_goal(pose)
        print('store area reached')
        # wait for 1 sec
        rospy.sleep(4.0)
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
# wait for 1 sec
        rospy.sleep(0.05)
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')  
        pose = self. go_to_up_tube_9()
        self.send_goal(pose)
        print('tube 9 up reached')
# wait for 1 sec
        rospy.sleep(1.0)
        pose = self. go_to_tube_9()
        self.send_goal(pose)
        print('tube 9 reached')
# wait for 1 sec
        rospy.sleep(4.0)
        pose = self. go_to_up_tube_9()
        self.send_goal(pose)
        print('tube 9 up reached')
        pose = self.go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self.go_to_store_area()
        self.send_goal(pose)
        print('store area reached')
        # wait for 1 sec
        rospy.sleep(2.0)
        pose = self.go_to_third_waypoint()
        self.send_goal(pose)
        print('waypoint3 reached')
        pose = self. go_to_second_waypoint()
        self.send_goal(pose)
        print('waypoint2 reached')
        pose = self. go_to_first_waypoint11()
        self.send_goal(pose)
        pose = self. go_to_first_waypoint()
        self.send_goal(pose)
        print('waypoint1 reached')
        pose = self.go_to_up_tube_1()
        self.send_goal(pose)
        print('Congrat you extract all parts lets make party')


    def got_turn_table(self):
        # go to turn table
        pose = self.turn_table()
        self.send_goal(pose)
        # wait for 1 sec
        rospy.sleep(1.0)
# wait for 1 sec
        rospy.sleep(1.0)



# # Vacuum demo start here 
#           pose = self.go_to_vacuum_up_waypoint1()
#           self.send_goal(pose)
#           print('first vacuum up waypoint reached')
#           pose = self.go_to_vacuum_waypoint1()
#           self.send_goal(pose)
#           print('first vacuum waypoint1 reached')
#           pose = self.go_to_vacuum_waypoint2()
#           self.send_goal(pose)
#           print('first vacuum waypoint2 reached')
#           pose = self.go_to_vacuum_waypoint3()
#           self.send_goal(pose)
#           print('first vacuum waypoint3 reached')
#           pose = self.go_to_vacuum_waypoint4()
#           self.send_goal(pose)
#           print('first vacuum waypoint4 reached')
#           pose = self.go_to_vacuum_waypoint1()
#           self.send_goal(pose)
#           print('first vacuum waypoint1 reached')
#           pose = self.go_to_vacuum_up_waypoint1()
#           self.send_goal(pose)
#           print('finish cleaning good job:)')
def main():
    node = ControlRobotArmGripper()
    node.run()

if __name__ == '__main__':
    main()
