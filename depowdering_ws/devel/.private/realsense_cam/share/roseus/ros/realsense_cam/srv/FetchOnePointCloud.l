;; Auto-generated. Do not edit!


(when (boundp 'realsense_cam::FetchOnePointCloud)
  (if (not (find-package "REALSENSE_CAM"))
    (make-package "REALSENSE_CAM"))
  (shadow 'FetchOnePointCloud (find-package "REALSENSE_CAM")))
(unless (find-package "REALSENSE_CAM::FETCHONEPOINTCLOUD")
  (make-package "REALSENSE_CAM::FETCHONEPOINTCLOUD"))
(unless (find-package "REALSENSE_CAM::FETCHONEPOINTCLOUDREQUEST")
  (make-package "REALSENSE_CAM::FETCHONEPOINTCLOUDREQUEST"))
(unless (find-package "REALSENSE_CAM::FETCHONEPOINTCLOUDRESPONSE")
  (make-package "REALSENSE_CAM::FETCHONEPOINTCLOUDRESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass realsense_cam::FetchOnePointCloudRequest
  :super ros::object
  :slots ())

(defmethod realsense_cam::FetchOnePointCloudRequest
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

(defclass realsense_cam::FetchOnePointCloudResponse
  :super ros::object
  :slots (_success _reason _pointcloud ))

(defmethod realsense_cam::FetchOnePointCloudResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:reason __reason) "")
    ((:pointcloud __pointcloud) (instance sensor_msgs::PointCloud2 :init))
    )
   (send-super :init)
   (setq _success __success)
   (setq _reason (string __reason))
   (setq _pointcloud __pointcloud)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:reason
   (&optional __reason)
   (if __reason (setq _reason __reason)) _reason)
  (:pointcloud
   (&rest __pointcloud)
   (if (keywordp (car __pointcloud))
       (send* _pointcloud __pointcloud)
     (progn
       (if __pointcloud (setq _pointcloud (car __pointcloud)))
       _pointcloud)))
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _reason
    4 (length _reason)
    ;; sensor_msgs/PointCloud2 _pointcloud
    (send _pointcloud :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _reason
       (write-long (length _reason) s) (princ _reason s)
     ;; sensor_msgs/PointCloud2 _pointcloud
       (send _pointcloud :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _reason
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _reason (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; sensor_msgs/PointCloud2 _pointcloud
     (send _pointcloud :deserialize buf ptr-) (incf ptr- (send _pointcloud :serialization-length))
   ;;
   self)
  )

(defclass realsense_cam::FetchOnePointCloud
  :super ros::object
  :slots ())

(setf (get realsense_cam::FetchOnePointCloud :md5sum-) "12debe1ff97e2a037af192b4cc727ffc")
(setf (get realsense_cam::FetchOnePointCloud :datatype-) "realsense_cam/FetchOnePointCloud")
(setf (get realsense_cam::FetchOnePointCloud :request) realsense_cam::FetchOnePointCloudRequest)
(setf (get realsense_cam::FetchOnePointCloud :response) realsense_cam::FetchOnePointCloudResponse)

(defmethod realsense_cam::FetchOnePointCloudRequest
  (:response () (instance realsense_cam::FetchOnePointCloudResponse :init)))

(setf (get realsense_cam::FetchOnePointCloudRequest :md5sum-) "12debe1ff97e2a037af192b4cc727ffc")
(setf (get realsense_cam::FetchOnePointCloudRequest :datatype-) "realsense_cam/FetchOnePointCloudRequest")
(setf (get realsense_cam::FetchOnePointCloudRequest :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
# Reason: detail of error if not succeeded.
bool success
string reason 
sensor_msgs/PointCloud2 pointcloud

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
")

(setf (get realsense_cam::FetchOnePointCloudResponse :md5sum-) "12debe1ff97e2a037af192b4cc727ffc")
(setf (get realsense_cam::FetchOnePointCloudResponse :datatype-) "realsense_cam/FetchOnePointCloudResponse")
(setf (get realsense_cam::FetchOnePointCloudResponse :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
# Reason: detail of error if not succeeded.
bool success
string reason 
sensor_msgs/PointCloud2 pointcloud

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
")



(provide :realsense_cam/FetchOnePointCloud "12debe1ff97e2a037af192b4cc727ffc")


