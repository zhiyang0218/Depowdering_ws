#!/usr/bin/env python3

import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image, CameraInfo
from geometry_msgs.msg import Pose, PoseArray
from cv_bridge import CvBridge, CvBridgeError
from add_post_pro_simulation.srv import DetectPose, DetectPoseRequest, DetectPoseResponse

class DetectPoseOfObject:
    def __init__(self):
        rospy.init_node('detect_pose_of_object')
        self.pose_pub = rospy.Publisher('object_poses', PoseArray, queue_size=10)
        # self.camera_sub = rospy.Subscriber('rgb_image', Image, self.img_cb)
        self.bridge = CvBridge()
        # define lower and upper bounds of the colors
        self.lower_red = np.array([0, 100, 100])  # Lower bound of red in HSV
        self.upper_red = np.array([10, 255, 255]) # Upper bound of red in HSV
        self.lower_blue = np.array([100, 40, 40])  # Lower bound of blue in HSV
        self.upper_blue = np.array([140, 255, 255]) # Upper bound of blue in HSV
        self.lower_green = np.array([40, 40, 40])  # Lower bound of green in HSV
        self.upper_green = np.array([80, 255, 255]) # Upper bound of green in HSV

        self.detectPoseService = rospy.Service("detect_pose", DetectPose, self.detect_pose_cb)

    def detect_pose_cb(self, req: DetectPoseRequest):
        res = DetectPoseResponse()
        ros_msg = rospy.wait_for_message("/D415/color/image_raw", Image, timeout=10)
        camera_info = rospy.wait_for_message("/D415/color/camera_info", CameraInfo, timeout=10)

        # camera_info = CameraInfo()
        focal_length_x = camera_info.K[0]   # Focal length in x-direction
        focal_length_y = camera_info.K[4]   # Focal length in y-direction
        camera_center_x = camera_info.K[2]         # Principal point x-coordinate
        camera_center_y = camera_info.K[5]         # Principal point y-coordinate
        depth_msg = rospy.wait_for_message("/D415/depth/image_raw", Image, timeout=10) 
        
        try:
            cv_img = self.bridge.imgmsg_to_cv2(ros_msg, 'bgr8')
            depth_cv_img = self.bridge.imgmsg_to_cv2(depth_msg, 'passthrough')
            mask = self.detect_color(cv_img, req.name)
            cv2.imshow("mask", mask)
            cv2.waitKey(0)
            # cv2.destroyAllWindows()
            
            (center_x, center_y) = self.find_center(mask)
            depth_value = depth_cv_img[center_y, center_x]
            # print('depth value', depth_value)
            z = depth_value / 1000.0 # convert depth value from mm to m

            x = (center_x - camera_center_x) * z / focal_length_x
            y = (center_y - camera_center_y) * z / focal_length_y
            # print(x)
            # print(y)
            # print(z)
            res.x = float(x)
            res.y = float(y)
            res.z = float(z)
            return res
            
        except CvBridgeError:
            rospy.logerr("cannot convert the ros msg to cv img")


    def find_center(self, mask):
        # Find contours in the mask
        contours, _ = cv2.findContours(mask, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)

        # Find and draw the center of each contour
        for contour in contours:
            # Calculate moments
            moments = cv2.moments(contour)
            
            # Avoid division by zero
            if moments["m00"] != 0:
                center_x = int(moments["m10"] / moments["m00"])
                center_y = int(moments["m01"] / moments["m00"])
                return (center_x, center_y)
            else:
                return (0, 0)

    def detect_color(self, img, name: str):
        '''
        function to detect the color of the objects and then predict the pose
        '''
        hsv_image = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
        if name == "red":
            mask = cv2.inRange(hsv_image, self.lower_red, self.upper_red)
        elif name == "blue":
            mask = cv2.inRange(hsv_image, self.lower_blue, self.upper_blue)
        elif name == "green":
            mask = cv2.inRange(hsv_image, self.lower_green, self.upper_green)
        return mask

    def img_cb(self, msg: Image):
        '''
        image callback function
        '''
        pass

    def run(self):
        '''
        spin the ros node
        '''
        rospy.spin()

def main():
    '''
    main func
    '''
    node = DetectPoseOfObject()
    node.run()

if __name__ == '__main__':
    main()