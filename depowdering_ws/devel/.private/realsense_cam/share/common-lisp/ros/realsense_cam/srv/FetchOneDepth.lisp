; Auto-generated. Do not edit!


(cl:in-package realsense_cam-srv)


;//! \htmlinclude FetchOneDepth-request.msg.html

(cl:defclass <FetchOneDepth-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass FetchOneDepth-request (<FetchOneDepth-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FetchOneDepth-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FetchOneDepth-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<FetchOneDepth-request> is deprecated: use realsense_cam-srv:FetchOneDepth-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FetchOneDepth-request>) ostream)
  "Serializes a message object of type '<FetchOneDepth-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FetchOneDepth-request>) istream)
  "Deserializes a message object of type '<FetchOneDepth-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FetchOneDepth-request>)))
  "Returns string type for a service object of type '<FetchOneDepth-request>"
  "realsense_cam/FetchOneDepthRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchOneDepth-request)))
  "Returns string type for a service object of type 'FetchOneDepth-request"
  "realsense_cam/FetchOneDepthRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FetchOneDepth-request>)))
  "Returns md5sum for a message object of type '<FetchOneDepth-request>"
  "8f1bfbb7170049fa0e75d292e4ff7bed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FetchOneDepth-request)))
  "Returns md5sum for a message object of type 'FetchOneDepth-request"
  "8f1bfbb7170049fa0e75d292e4ff7bed")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FetchOneDepth-request>)))
  "Returns full string definition for message of type '<FetchOneDepth-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FetchOneDepth-request)))
  "Returns full string definition for message of type 'FetchOneDepth-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FetchOneDepth-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FetchOneDepth-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FetchOneDepth-request
))
;//! \htmlinclude FetchOneDepth-response.msg.html

(cl:defclass <FetchOneDepth-response> (roslisp-msg-protocol:ros-message)
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
   (depth
    :reader depth
    :initarg :depth
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass FetchOneDepth-response (<FetchOneDepth-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FetchOneDepth-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FetchOneDepth-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<FetchOneDepth-response> is deprecated: use realsense_cam-srv:FetchOneDepth-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <FetchOneDepth-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:success-val is deprecated.  Use realsense_cam-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'reason-val :lambda-list '(m))
(cl:defmethod reason-val ((m <FetchOneDepth-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:reason-val is deprecated.  Use realsense_cam-srv:reason instead.")
  (reason m))

(cl:ensure-generic-function 'depth-val :lambda-list '(m))
(cl:defmethod depth-val ((m <FetchOneDepth-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:depth-val is deprecated.  Use realsense_cam-srv:depth instead.")
  (depth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FetchOneDepth-response>) ostream)
  "Serializes a message object of type '<FetchOneDepth-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reason))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'depth) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FetchOneDepth-response>) istream)
  "Deserializes a message object of type '<FetchOneDepth-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reason) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'reason) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'depth) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FetchOneDepth-response>)))
  "Returns string type for a service object of type '<FetchOneDepth-response>"
  "realsense_cam/FetchOneDepthResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchOneDepth-response)))
  "Returns string type for a service object of type 'FetchOneDepth-response"
  "realsense_cam/FetchOneDepthResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FetchOneDepth-response>)))
  "Returns md5sum for a message object of type '<FetchOneDepth-response>"
  "8f1bfbb7170049fa0e75d292e4ff7bed")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FetchOneDepth-response)))
  "Returns md5sum for a message object of type 'FetchOneDepth-response"
  "8f1bfbb7170049fa0e75d292e4ff7bed")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FetchOneDepth-response>)))
  "Returns full string definition for message of type '<FetchOneDepth-response>"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%# Reason: detail of error if not succeeded.~%bool success~%string reason~%sensor_msgs/Image depth~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FetchOneDepth-response)))
  "Returns full string definition for message of type 'FetchOneDepth-response"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%# Reason: detail of error if not succeeded.~%bool success~%string reason~%sensor_msgs/Image depth~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FetchOneDepth-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'reason))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'depth))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FetchOneDepth-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FetchOneDepth-response
    (cl:cons ':success (success msg))
    (cl:cons ':reason (reason msg))
    (cl:cons ':depth (depth msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FetchOneDepth)))
  'FetchOneDepth-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FetchOneDepth)))
  'FetchOneDepth-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchOneDepth)))
  "Returns string type for a service object of type '<FetchOneDepth>"
  "realsense_cam/FetchOneDepth")