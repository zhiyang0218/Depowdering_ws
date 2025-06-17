; Auto-generated. Do not edit!


(cl:in-package realsense_cam-srv)


;//! \htmlinclude FetchOnePointCloud-request.msg.html

(cl:defclass <FetchOnePointCloud-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass FetchOnePointCloud-request (<FetchOnePointCloud-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FetchOnePointCloud-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FetchOnePointCloud-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<FetchOnePointCloud-request> is deprecated: use realsense_cam-srv:FetchOnePointCloud-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FetchOnePointCloud-request>) ostream)
  "Serializes a message object of type '<FetchOnePointCloud-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FetchOnePointCloud-request>) istream)
  "Deserializes a message object of type '<FetchOnePointCloud-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FetchOnePointCloud-request>)))
  "Returns string type for a service object of type '<FetchOnePointCloud-request>"
  "realsense_cam/FetchOnePointCloudRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchOnePointCloud-request)))
  "Returns string type for a service object of type 'FetchOnePointCloud-request"
  "realsense_cam/FetchOnePointCloudRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FetchOnePointCloud-request>)))
  "Returns md5sum for a message object of type '<FetchOnePointCloud-request>"
  "12debe1ff97e2a037af192b4cc727ffc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FetchOnePointCloud-request)))
  "Returns md5sum for a message object of type 'FetchOnePointCloud-request"
  "12debe1ff97e2a037af192b4cc727ffc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FetchOnePointCloud-request>)))
  "Returns full string definition for message of type '<FetchOnePointCloud-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FetchOnePointCloud-request)))
  "Returns full string definition for message of type 'FetchOnePointCloud-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FetchOnePointCloud-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FetchOnePointCloud-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FetchOnePointCloud-request
))
;//! \htmlinclude FetchOnePointCloud-response.msg.html

(cl:defclass <FetchOnePointCloud-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (reason
    :reader reason
    :initarg :reason
    :type cl:string
    :initform "")
   (pointcloud
    :reader pointcloud
    :initarg :pointcloud
    :type sensor_msgs-msg:PointCloud2
    :initform (cl:make-instance 'sensor_msgs-msg:PointCloud2)))
)

(cl:defclass FetchOnePointCloud-response (<FetchOnePointCloud-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FetchOnePointCloud-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FetchOnePointCloud-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<FetchOnePointCloud-response> is deprecated: use realsense_cam-srv:FetchOnePointCloud-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <FetchOnePointCloud-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:success-val is deprecated.  Use realsense_cam-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'reason-val :lambda-list '(m))
(cl:defmethod reason-val ((m <FetchOnePointCloud-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:reason-val is deprecated.  Use realsense_cam-srv:reason instead.")
  (reason m))

(cl:ensure-generic-function 'pointcloud-val :lambda-list '(m))
(cl:defmethod pointcloud-val ((m <FetchOnePointCloud-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:pointcloud-val is deprecated.  Use realsense_cam-srv:pointcloud instead.")
  (pointcloud m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FetchOnePointCloud-response>) ostream)
  "Serializes a message object of type '<FetchOnePointCloud-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reason))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pointcloud) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FetchOnePointCloud-response>) istream)
  "Deserializes a message object of type '<FetchOnePointCloud-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reason) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'reason) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pointcloud) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FetchOnePointCloud-response>)))
  "Returns string type for a service object of type '<FetchOnePointCloud-response>"
  "realsense_cam/FetchOnePointCloudResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchOnePointCloud-response)))
  "Returns string type for a service object of type 'FetchOnePointCloud-response"
  "realsense_cam/FetchOnePointCloudResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FetchOnePointCloud-response>)))
  "Returns md5sum for a message object of type '<FetchOnePointCloud-response>"
  "12debe1ff97e2a037af192b4cc727ffc")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FetchOnePointCloud-response)))
  "Returns md5sum for a message object of type 'FetchOnePointCloud-response"
  "12debe1ff97e2a037af192b4cc727ffc")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FetchOnePointCloud-response>)))
  "Returns full string definition for message of type '<FetchOnePointCloud-response>"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%# Reason: detail of error if not succeeded.~%bool success~%string reason ~%sensor_msgs/PointCloud2 pointcloud~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FetchOnePointCloud-response)))
  "Returns full string definition for message of type 'FetchOnePointCloud-response"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%# Reason: detail of error if not succeeded.~%bool success~%string reason ~%sensor_msgs/PointCloud2 pointcloud~%~%================================================================================~%MSG: sensor_msgs/PointCloud2~%# This message holds a collection of N-dimensional points, which may~%# contain additional information such as normals, intensity, etc. The~%# point data is stored as a binary blob, its layout described by the~%# contents of the \"fields\" array.~%~%# The point cloud data may be organized 2d (image-like) or 1d~%# (unordered). Point clouds organized as 2d images may be produced by~%# camera depth sensors such as stereo or time-of-flight.~%~%# Time of sensor data acquisition, and the coordinate frame ID (for 3d~%# points).~%Header header~%~%# 2D structure of the point cloud. If the cloud is unordered, height is~%# 1 and width is the length of the point cloud.~%uint32 height~%uint32 width~%~%# Describes the channels and their layout in the binary data blob.~%PointField[] fields~%~%bool    is_bigendian # Is this data bigendian?~%uint32  point_step   # Length of a point in bytes~%uint32  row_step     # Length of a row in bytes~%uint8[] data         # Actual point data, size is (row_step*height)~%~%bool is_dense        # True if there are no invalid points~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/PointField~%# This message holds the description of one point entry in the~%# PointCloud2 message format.~%uint8 INT8    = 1~%uint8 UINT8   = 2~%uint8 INT16   = 3~%uint8 UINT16  = 4~%uint8 INT32   = 5~%uint8 UINT32  = 6~%uint8 FLOAT32 = 7~%uint8 FLOAT64 = 8~%~%string name      # Name of field~%uint32 offset    # Offset from start of point struct~%uint8  datatype  # Datatype enumeration, see above~%uint32 count     # How many elements in the field~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FetchOnePointCloud-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'reason))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pointcloud))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FetchOnePointCloud-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FetchOnePointCloud-response
    (cl:cons ':success (success msg))
    (cl:cons ':reason (reason msg))
    (cl:cons ':pointcloud (pointcloud msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FetchOnePointCloud)))
  'FetchOnePointCloud-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FetchOnePointCloud)))
  'FetchOnePointCloud-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchOnePointCloud)))
  "Returns string type for a service object of type '<FetchOnePointCloud>"
  "realsense_cam/FetchOnePointCloud")