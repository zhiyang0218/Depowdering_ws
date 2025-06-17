#!/usr/bin/env python3
import rospy
import rospkg
import sensor_msgs.point_cloud2 as pc2
from sensor_msgs.msg import PointCloud2
import csv
import struct
import os

def get_package_path():
    rospack = rospkg.RosPack()
    return rospack.get_path('lidar_zhiyan')

def callback(cloud_msg):
    pkg_path = get_package_path()
    output_dir = os.path.join(pkg_path, 'data')
    os.makedirs(output_dir, exist_ok=True)
    
    filename = os.path.join(output_dir, 'point_cloud_data.csv')
    write_header = not os.path.exists(filename)
    
    with open(filename, 'a') as csvfile:
        writer = csv.writer(csvfile)
        if write_header:
            writer.writerow(['x', 'y', 'z', 'r', 'g', 'b', 'timestamp'])
        
        field_names = [f.name for f in cloud_msg.fields]
        has_rgb = 'rgb' in field_names
        
        for p in pc2.read_points(cloud_msg, field_names=field_names, skip_nans=True):
            try:
                x = p[field_names.index('x')]
                y = p[field_names.index('y')]
                z = p[field_names.index('z')]
                r = g = b = 0
                
                if has_rgb:
                    rgb_float = p[field_names.index('rgb')]
                    rgb_bytes = struct.pack('f', rgb_float)
                    rgb_int = struct.unpack('I', rgb_bytes)[0]
                    r = (rgb_int >> 16) & 0xFF
                    g = (rgb_int >> 8) & 0xFF
                    b = rgb_int & 0xFF
                
                timestamp = cloud_msg.header.stamp.to_sec()
                writer.writerow([x, y, z, r, g, b, timestamp])
            except Exception as e:
                rospy.logerr(f"Error processing point: {str(e)}")

def listener():
    rospy.init_node('pointcloud_to_csv')
    rospy.Subscriber('/filtered_points', PointCloud2, callback)
    rospy.spin()

if __name__ == '__main__':
    listener()
