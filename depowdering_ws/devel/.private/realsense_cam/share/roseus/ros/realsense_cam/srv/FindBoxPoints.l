;; Auto-generated. Do not edit!


(when (boundp 'realsense_cam::FindBoxPoints)
  (if (not (find-package "REALSENSE_CAM"))
    (make-package "REALSENSE_CAM"))
  (shadow 'FindBoxPoints (find-package "REALSENSE_CAM")))
(unless (find-package "REALSENSE_CAM::FINDBOXPOINTS")
  (make-package "REALSENSE_CAM::FINDBOXPOINTS"))
(unless (find-package "REALSENSE_CAM::FINDBOXPOINTSREQUEST")
  (make-package "REALSENSE_CAM::FINDBOXPOINTSREQUEST"))
(unless (find-package "REALSENSE_CAM::FINDBOXPOINTSRESPONSE")
  (make-package "REALSENSE_CAM::FINDBOXPOINTSRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass realsense_cam::FindBoxPointsRequest
  :super ros::object
  :slots ())

(defmethod realsense_cam::FindBoxPointsRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass realsense_cam::FindBoxPointsResponse
  :super ros::object
  :slots (_success _points _boundary_points ))

(defmethod realsense_cam::FindBoxPointsResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:points __points) (instance sensor_msgs::PointCloud2 :init))
    ((:boundary_points __boundary_points) ())
    )
   (send-super :init)
   (setq _success __success)
   (setq _points __points)
   (setq _boundary_points __boundary_points)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:boundary_points
   (&rest __boundary_points)
   (if (keywordp (car __boundary_points))
       (send* _boundary_points __boundary_points)
     (progn
       (if __boundary_points (setq _boundary_points (car __boundary_points)))
       _boundary_points)))
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; sensor_msgs/PointCloud2 _points
    (send _points :serialization-length)
    ;; geometry_msgs/PointStamped[] _boundary_points
    (apply #'+ (send-all _boundary_points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; sensor_msgs/PointCloud2 _points
       (send _points :serialize s)
     ;; geometry_msgs/PointStamped[] _boundary_points
     (write-long (length _boundary_points) s)
     (dolist (elem _boundary_points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; sensor_msgs/PointCloud2 _points
     (send _points :deserialize buf ptr-) (incf ptr- (send _points :serialization-length))
   ;; geometry_msgs/PointStamped[] _boundary_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _boundary_points (let (r) (dotimes (i n) (push (instance geometry_msgs::PointStamped :init) r)) r))
     (dolist (elem- _boundary_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass realsense_cam::FindBoxPoints
  :super ros::object
  :slots ())

(setf (get realsense_cam::FindBoxPoints :md5sum-) "5f515f4ac24677f0676cc1d53c1e289b")
(setf (get realsense_cam::FindBoxPoints :datatype-) "realsense_cam/FindBoxPoints")
(setf (get realsense_cam::FindBoxPoints :request) realsense_cam::FindBoxPointsRequest)
(setf (get realsense_cam::FindBoxPoints :response) realsense_cam::FindBoxPointsResponse)

(defmethod realsense_cam::FindBoxPointsRequest
  (:response () (instance realsense_cam::FindBoxPointsResponse :init)))

(setf (get realsense_cam::FindBoxPointsRequest :md5sum-) "5f515f4ac24677f0676cc1d53c1e289b")
(setf (get realsense_cam::FindBoxPointsRequest :datatype-) "realsense_cam/FindBoxPointsRequest")
(setf (get realsense_cam::FindBoxPointsRequest :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
# Reason: detail of error if not succeeded.
bool success

# Points: Pointcloud of points inside the work area 
sensor_msgs/PointCloud2 points

# Boundary_points: 2 points representing top-left & bottom-right of the work area, respectively
geometry_msgs/PointStamped[] boundary_points

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field

================================================================================
MSG: geometry_msgs/PointStamped
# This represents a Point with reference coordinate frame and timestamp
Header header
Point point

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")

(setf (get realsense_cam::FindBoxPointsResponse :md5sum-) "5f515f4ac24677f0676cc1d53c1e289b")
(setf (get realsense_cam::FindBoxPointsResponse :datatype-) "realsense_cam/FindBoxPointsResponse")
(setf (get realsense_cam::FindBoxPointsResponse :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
# Reason: detail of error if not succeeded.
bool success

# Points: Pointcloud of points inside the work area 
sensor_msgs/PointCloud2 points

# Boundary_points: 2 points representing top-left & bottom-right of the work area, respectively
geometry_msgs/PointStamped[] boundary_points

================================================================================
MSG: sensor_msgs/PointCloud2
# This message holds a collection of N-dimensional points, which may
# contain additional information such as normals, intensity, etc. The
# point data is stored as a binary blob, its layout described by the
# contents of the \"fields\" array.

# The point cloud data may be organized 2d (image-like) or 1d
# (unordered). Point clouds organized as 2d images may be produced by
# camera depth sensors such as stereo or time-of-flight.

# Time of sensor data acquisition, and the coordinate frame ID (for 3d
# points).
Header header

# 2D structure of the point cloud. If the cloud is unordered, height is
# 1 and width is the length of the point cloud.
uint32 height
uint32 width

# Describes the channels and their layout in the binary data blob.
PointField[] fields

bool    is_bigendian # Is this data bigendian?
uint32  point_step   # Length of a point in bytes
uint32  row_step     # Length of a row in bytes
uint8[] data         # Actual point data, size is (row_step*height)

bool is_dense        # True if there are no invalid points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: sensor_msgs/PointField
# This message holds the description of one point entry in the
# PointCloud2 message format.
uint8 INT8    = 1
uint8 UINT8   = 2
uint8 INT16   = 3
uint8 UINT16  = 4
uint8 INT32   = 5
uint8 UINT32  = 6
uint8 FLOAT32 = 7
uint8 FLOAT64 = 8

string name      # Name of field
uint32 offset    # Offset from start of point struct
uint8  datatype  # Datatype enumeration, see above
uint32 count     # How many elements in the field

================================================================================
MSG: geometry_msgs/PointStamped
# This represents a Point with reference coordinate frame and timestamp
Header header
Point point

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")



(provide :realsense_cam/FindBoxPoints "5f515f4ac24677f0676cc1d53c1e289b")


