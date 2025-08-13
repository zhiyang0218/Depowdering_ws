import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D # <-- ADD THIS LINE

def generate_path_for_area(input_file, output_file, x_min, x_max, y_range, z_offset):
    """
    Generates a robot toolpath over a specified area of a point cloud.

    Args:
        input_file (str): Path to the filtered point cloud CSV file.
        output_file (str): Path to save the generated robot path CSV.
        x_min (float): The minimum X-boundary of the area.
        x_max (float): The maximum X-boundary of the area.
        y_range (tuple): A tuple containing the start and end Y-values for the path.
        z_offset (float): The constant height to maintain above the highest point.
    """
    # --- 1. Load and Filter Data for the Target Area ---
    print(f"Reading data from {input_file}...")
    df = pd.read_csv(input_file)

    print(f"Filtering points for X-area between {x_min} and {x_max}...")
    area_df = df[(df['x'] >= x_min) & (df['x'] <= x_max)].copy()

    if area_df.empty:
        print("No data points found in the specified area. Cannot generate path.")
        return

    # --- 2. Define Path Parameters ---
    
    # The robot's X-coordinate is fixed at the center of the area
    path_x = (x_min + x_max) / 2
    
    # Create 100 waypoints for the Y-axis sweep
    y_start, y_end = y_range
    path_y_waypoints = np.linspace(y_start, y_end, 100)
    
    robot_path = []

    # --- 3. Generate Path Waypoints ---
    print("Generating path waypoints...")
    # Determine a small slice width for finding the max Z at each Y step
    y_slice_width = (y_end - y_start) / 50 # A reasonable width for grouping points

    for y in path_y_waypoints:
        # Find points in the cloud that are near the current Y-waypoint
        nearby_points = area_df[
            (area_df['y'] >= y - y_slice_width / 2) & 
            (area_df['y'] <= y + y_slice_width / 2)
        ]
        
        if not nearby_points.empty:
            # Find the highest point in this slice
            max_z_in_slice = nearby_points['z'].max()
            # The path's Z is the offset above this highest point
            path_z = max_z_in_slice + z_offset
        else:
            # If no points are nearby, use the Z from the last waypoint
            # or a default starting height if it's the first point.
            if robot_path:
                path_z = robot_path[-1][2] # Use last Z
            else:
                path_z = area_df['z'].max() + z_offset # Fallback for the very first point
        
        robot_path.append([path_x, y, path_z])

    # --- 4. Save and Visualize the Path ---
    path_df = pd.DataFrame(robot_path, columns=['x', 'y', 'z'])
    path_df.to_csv(output_file, index=False)
    print(f"Successfully saved robot path to '{output_file}'")

    # Create a 3D visualization
    fig = plt.figure(figsize=(12, 9))
    ax = fig.add_subplot(111, projection='3d')
    
    # Plot the original point cloud data for the area
    ax.scatter(area_df['x'], area_df['y'], area_df['z'], c=area_df['z'], cmap='winter', s=5, label='Surface Points')
    
    # Plot the generated robot path
    ax.plot(path_df['x'], path_df['y'], path_df['z'], color='red', linewidth=3, label='Robot Path')
    
    ax.set_xlabel('X-axis')
    ax.set_ylabel('Y-axis')
    ax.set_zlabel('Z-axis')
    ax.set_title('Generated Robot Path over Point Cloud Surface')
    ax.legend()
    plt.show()


# --- Main execution ---
if __name__ == '__main__':
    INPUT_CSV = 'point_cloud_final_filtered.csv'
    OUTPUT_CSV = 'robot_path_area1.csv'
    
    # Define parameters for Area 1
    X_AREA_MIN = -0.14
    X_AREA_MAX = -0.05
    Y_PATH_RANGE = (-0.1, 0.1)
    Z_OFFSET_ABOVE_SURFACE = 0.1

    generate_path_for_area(
        INPUT_CSV,
        OUTPUT_CSV,
        X_AREA_MIN,
        X_AREA_MAX,
        Y_PATH_RANGE,
        Z_OFFSET_ABOVE_SURFACE
    )


