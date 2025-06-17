; Auto-generated. Do not edit!


(cl:in-package realsense_cam-srv)


;//! \htmlinclude FindBoxPoints-request.msg.html

(cl:defclass <FindBoxPoints-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass FindBoxPoints-request (<FindBoxPoints-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FindBoxPoints-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FindBoxPoints-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<FindBoxPoints-request> is deprecated: use realsense_cam-srv:FindBoxPoints-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FindBoxPoints-request>) ostream)
  "Serializes a message object of type '<FindBoxPoints-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FindBoxPoints-request>) istream)
  "Deserializes a message object of type '<FindBoxPoints-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FindBoxPoints-request>)))
  "Returns string type for a service object of type '<FindBoxPoints-request>"
  "realsense_cam/FindBoxPointsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FindBoxPoints-request)))
  "Returns string type for a service object of type 'FindBoxPoints-request"
  "realsense_cam/FindBoxPointsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FindBoxPoints-request>)))
  "Returns md5sum for a message object of type '<FindBoxPoints-request>"
  "5f515f4ac24677f0676cc1d53c1e289b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FindBoxPoints-request)))
  "Returns md5sum for a message object of type 'FindBoxPoints-request"
  "5f515f4ac24677f0676cc1d53c1e289b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FindBoxPoints-request>)))
  "Returns full string definition for message of type '<FindBoxPoints-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FindBoxPoints-request)))
  "Returns full string definition for message of type 'FindBoxPoints-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FindBoxPoints-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FindBoxPoints-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FindBoxPoints-request
))
;//! \htmlinclude FindBoxPoints-response.msg.html

(cl:defclass <FindBoxPoints-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (points
    :reader points
    :initarg :points
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2))
   (boundary_points
    :reader boundary_points
    :initarg :boundary_points
    :type (cl:vector geometry_msgs-msg:PointStamped)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:PointStamped :initial-element (cl:make-instance 'geometry_msgs-msg:PointStamped))))
)

(cl:defclass FindBoxPoints-response (<FindBoxPoints-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FindBoxPoints-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FindBoxPoints-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<FindBoxPoints-response> is deprecated: use realsense_cam-srv:FindBoxPoints-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <FindBoxPoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:success-val is deprecated.  Use realsense_cam-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <FindBoxPoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:points-val is deprecated.  Use realsense_cam-srv:points instead.")
  (points m))

(cl:ensure-generic-function 'boundary_points-val :lambda-list '(m))
(cl:defmethod boundary_points-val ((m <FindBoxPoints-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:boundary_points-val is deprecated.  Use realsense_cam-srv:boundary_points instead.")
  (boundary_points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FindBoxPoints-response>) ostream)
  "Serializes a message object of type '<FindBoxPoints-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'points) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'boundary_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'boundary_points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FindBoxPoints-response>) istream)
  "Deserializes a message object of type '<FindBoxPoints-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'points) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'boundary_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'boundary_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:PointStamped))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FindBoxPoints-response>)))
  "Returns string type for a service object of type '<FindBoxPoints-response>"
  "realsense_cam/FindBoxPointsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FindBoxPoints-response)))
  "Returns string type for a service object of type 'FindBoxPoints-response"
  "realsense_cam/FindBoxPointsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FindBoxPoints-response>)))
  "Returns md5sum for a message object of type '<FindBoxPoints-response>"
  "5f515f4ac24677f0676cc1d53c1e289b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FindBoxPoints-response)))
  "Returns md5sum for a message object of type 'FindBoxPoints-response"
  "5f515f4ac24677f0676cc1d53c1e289b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FindBoxPoints-response>)))
  "Returns full string definition for message of type '<FindBoxPoints-response>"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%# Reason: detail of error if not succeeded.~%bool success~%~%# Points: Pointcloud of points inside the work area ~%sensor_msgs/PointCloud2 points~%~%# Boundary_points: 2 points representing top-left & bottom-right of the work area, respectively~%geometry_msgs/PointStamped[] boundary_points~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: geometry_msgs/PointStamped~%# This represents a Point with reference coordinate frame and timestamp~%Header header~%Point point~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FindBoxPoints-response)))
  "Returns full string definition for message of type 'FindBoxPoints-response"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%# Reason: detail of error if not succeeded.~%bool success~%~%# Points: Pointcloud of points inside the work area ~%sensor_msgs/PointCloud2 points~%~%# Boundary_points: 2 points representing top-left & bottom-right of the work area, respectively~%geometry_msgs/PointStamped[] boundary_points~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%================================================================================~%MSG: geometry_msgs/PointStamped~%# This represents a Point with reference coordinate frame and timestamp~%Header header~%Point point~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FindBoxPoints-response>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'points))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'boundary_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FindBoxPoints-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FindBoxPoints-response
    (cl:cons ':success (success msg))
    (cl:cons ':points (points msg))
    (cl:cons ':boundary_points (boundary_points msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FindBoxPoints)))
  'FindBoxPoints-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FindBoxPoints)))
  'FindBoxPoints-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FindBoxPoints)))
  "Returns string type for a service object of type '<FindBoxPoints>"
  "realsense_cam/FindBoxPoints")