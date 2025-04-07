#!/usr/bin/env python

import rospy
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
from sensor_msgs.msg import PointField
from std_msgs.msg import Header
import pcl
import numpy as np

class PassThroughFilterNode:
    def __init__(self):
        rospy.init_node('lidar_passthrough_filter')

        self.input_topic = rospy.get_param('~input_topic', '/camera/depth/points')
        self.output_topic = rospy.get_param('~output_topic', '/camera/depth/points_filtered')
        self.min_z = rospy.get_param('~min_z', 0.0)
        self.max_z = rospy.get_param('~max_z', 0.5)

        self.sub = rospy.Subscriber(self.input_topic, PointCloud2, self.callback, queue_size=1)
        self.pub = rospy.Publisher(self.output_topic, PointCloud2, queue_size=1)

    def callback(self, msg):
        cloud_points = list(pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True))
        filtered_points = [p for p in cloud_points if self.min_z <= p[2] <= self.max_z]

        header = Header()
        header.stamp = rospy.Time.now()
        header.frame_id = msg.header.frame_id

        filtered_cloud = pc2.create_cloud_xyz32(header, filtered_points)
        self.pub.publish(filtered_cloud)

if __name__ == '__main__':
    try:
        PassThroughFilterNode()
        rospy.spin()
    except rospy.ROSInterruptException:
        pass

