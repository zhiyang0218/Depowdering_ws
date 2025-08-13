import pandas as pd
import numpy as np

def transform_and_filter_point_cloud(input_file, output_file_xyz, output_file_csv, x_rot_clockwise, y_rot_counter_clockwise, y_translation, z_translation, x_min, x_max, y_max, z_min, z_max):
    """
    Applies a sequence of 3D transformations, filters the points, and saves the result
    in both .xyz and .csv formats.
    1. Clockwise rotation around the X-axis.
    2. Counter-clockwise rotation around the Y-axis.
    3. Translation along the Y and Z axes.
    4. Filtering points based on final XYZ-coordinates.
    5. Saves the final point cloud with color.

    Args:
        input_file (str): Path to the input CSV file.
        output_file_xyz (str): Path to save the final .xyz file for 3D software.
        output_file_csv (str): Path to save the final .csv file for data analysis.
        x_rot_clockwise (float): Angle in degrees for clockwise rotation around X-axis.
        y_rot_counter_clockwise (float): Angle in degrees for counter-clockwise rotation around Y-axis.
        y_translation (float): Distance to move points along the Y-axis.
        z_translation (float): Distance to move points along the Z-axis.
        x_min (float): The minimum X-value to keep.
        x_max (float): The maximum X-value to keep.
        y_max (float): The maximum Y-value to keep.
        z_min (float): The minimum Z-value to keep.
        z_max (float): The maximum Z-value to keep.
    """
    # --- 1. Define Transformations ---

    # X-axis rotation matrix (clockwise)
    x_angle_rad = np.radians(-x_rot_clockwise)
    cx, sx = np.cos(x_angle_rad), np.sin(x_angle_rad)
    x_rotation_matrix = np.array([
        [1, 0, 0],
        [0, cx, -sx],
        [0, sx, cx]
    ])

    # Y-axis rotation matrix (counter-clockwise)
    y_angle_rad = np.radians(y_rot_counter_clockwise)
    cy, sy = np.cos(y_angle_rad), np.sin(y_angle_rad)
    y_rotation_matrix = np.array([
        [cy, 0, sy],
        [0, 1, 0],
        [-sy, 0, cy]
    ])

    # Translation vector
    translation_vector = np.array([0, y_translation, z_translation])

    # --- 2. Load and Process Data ---
    print(f"Reading data from {input_file}...")
    df = pd.read_csv(input_file)
    points = df[['x', 'y', 'z']].values

    # --- 3. Apply Transformations Sequentially ---
    
    print(f"Applying {x_rot_clockwise}-degree clockwise rotation around X-axis...")
    points_after_x_rot = points @ x_rotation_matrix.T

    print(f"Applying {y_rot_counter_clockwise}-degree rotation around Y-axis...")
    points_after_y_rot = points_after_x_rot @ y_rotation_matrix.T

    print(f"Applying translation [0, {y_translation}, {z_translation}]...")
    final_points = points_after_y_rot + translation_vector

    # --- 4. Create Final DataFrame and Filter ---
    df_transformed = df.copy()
    df_transformed[['x', 'y', 'z']] = final_points
    
    print(f"Filtering points with X outside ({x_min}, {x_max}), Y > {y_max}, or Z outside ({z_min}, {z_max})...")
    original_point_count = len(df_transformed)
    
    df_filtered = df_transformed[
        (df_transformed['x'] > x_min) & (df_transformed['x'] < x_max) &
        (df_transformed['y'] < y_max) &
        (df_transformed['z'] > z_min) & (df_transformed['z'] < z_max)
    ]
    
    filtered_point_count = len(df_filtered)
    print(f"Removed {original_point_count - filtered_point_count} points.")


    # --- 5. Save the Result in Both Formats ---
    
    # Save to .xyz format for MeshLab (space-separated, no header)
    xyz_columns = df_filtered[['x', 'y', 'z', 'r', 'g', 'b']]
    xyz_columns.to_csv(output_file_xyz, sep=' ', header=False, index=False)
    print(f"Successfully saved .xyz file to '{output_file_xyz}'")
    
    # Save to .csv format for data analysis (comma-separated, with header)
    df_filtered.to_csv(output_file_csv, index=False)
    print(f"Successfully saved .csv file to '{output_file_csv}'")
    
    print(f"\nAll operations complete.")

# --- Main execution ---
if __name__ == '__main__':
    INPUT_CSV = 'point_cloud_snapshot.csv'
    # Define both output file names
    OUTPUT_FILE_XYZ = 'point_cloud_final_filtered.xyz'
    OUTPUT_FILE_CSV = 'point_cloud_final_filtered.csv'
    
    # Set the desired transformation values
    X_ROTATION_ANGLE = 138      # degrees clockwise
    Y_ROTATION_ANGLE = 2        # degrees counter-clockwise
    Y_AXIS_MOVEMENT  = -0.38
    Z_AXIS_MOVEMENT  = 0.49     # units

    # Set the desired filtering bounds
    X_FILTER_MIN = -0.15
    X_FILTER_MAX = 0.15
    Y_FILTER_MAX = 0.13
    Z_FILTER_MIN = 0.05
    Z_FILTER_MAX = 0.1

    transform_and_filter_point_cloud(
        INPUT_CSV, 
        OUTPUT_FILE_XYZ,
        OUTPUT_FILE_CSV,
        X_ROTATION_ANGLE, 
        Y_ROTATION_ANGLE, 
        Y_AXIS_MOVEMENT, 
        Z_AXIS_MOVEMENT,
        X_FILTER_MIN,
        X_FILTER_MAX,
        Y_FILTER_MAX,
        Z_FILTER_MIN,
        Z_FILTER_MAX
    )

