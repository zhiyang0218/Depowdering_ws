#!/usr/bin/env python3
import rospy
from sensor_msgs.msg import PointCloud2
import sensor_msgs.point_cloud2 as pc2
import pandas as pd
import os
from datetime import datetime

def capture_callback(msg):
    # Extract XYZ coordinates from the point cloud
    points = pc2.read_points(msg, field_names=("x", "y", "z"), skip_nans=True)
    data = []
    for p in points:
        data.append({
            "x (meters)": p[0],
            "y (meters)": p[1],
            "z (meters)": p[2]
        })
    
    # Save to CSV with timestamp
    timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    output_dir = os.path.expanduser("~/lidar_data")
    os.makedirs(output_dir, exist_ok=True)
    filename = os.path.join(output_dir, f"lidar_snapshot_{timestamp}.csv")
    
    df = pd.DataFrame(data)
    df.to_csv(filename, index=False)
    rospy.loginfo(f"Saved {len(data)} points to {filename}")
    
    # Shutdown after capturing one frame
    rospy.signal_shutdown("Data captured")

if __name__ == "__main__":
    rospy.init_node("capture_points")
    rospy.Subscriber("/filtered_points", PointCloud2, capture_callback)
    rospy.spin()
