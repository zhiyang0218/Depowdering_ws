; Auto-generated. Do not edit!


(cl:in-package realsense_cam-srv)


;//! \htmlinclude FetchOneRGB-request.msg.html

(cl:defclass <FetchOneRGB-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass FetchOneRGB-request (<FetchOneRGB-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FetchOneRGB-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FetchOneRGB-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<FetchOneRGB-request> is deprecated: use realsense_cam-srv:FetchOneRGB-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FetchOneRGB-request>) ostream)
  "Serializes a message object of type '<FetchOneRGB-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FetchOneRGB-request>) istream)
  "Deserializes a message object of type '<FetchOneRGB-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FetchOneRGB-request>)))
  "Returns string type for a service object of type '<FetchOneRGB-request>"
  "realsense_cam/FetchOneRGBRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchOneRGB-request)))
  "Returns string type for a service object of type 'FetchOneRGB-request"
  "realsense_cam/FetchOneRGBRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FetchOneRGB-request>)))
  "Returns md5sum for a message object of type '<FetchOneRGB-request>"
  "ccd168e371de7ed9bbb3078068a6b679")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FetchOneRGB-request)))
  "Returns md5sum for a message object of type 'FetchOneRGB-request"
  "ccd168e371de7ed9bbb3078068a6b679")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FetchOneRGB-request>)))
  "Returns full string definition for message of type '<FetchOneRGB-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FetchOneRGB-request)))
  "Returns full string definition for message of type 'FetchOneRGB-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FetchOneRGB-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FetchOneRGB-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FetchOneRGB-request
))
;//! \htmlinclude FetchOneRGB-response.msg.html

(cl:defclass <FetchOneRGB-response> (roslisp-msg-protocol:ros-message)
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
   (rgb
    :reader rgb
    :initarg :rgb
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass FetchOneRGB-response (<FetchOneRGB-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FetchOneRGB-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FetchOneRGB-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<FetchOneRGB-response> is deprecated: use realsense_cam-srv:FetchOneRGB-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <FetchOneRGB-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:success-val is deprecated.  Use realsense_cam-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'reason-val :lambda-list '(m))
(cl:defmethod reason-val ((m <FetchOneRGB-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:reason-val is deprecated.  Use realsense_cam-srv:reason instead.")
  (reason m))

(cl:ensure-generic-function 'rgb-val :lambda-list '(m))
(cl:defmethod rgb-val ((m <FetchOneRGB-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:rgb-val is deprecated.  Use realsense_cam-srv:rgb instead.")
  (rgb m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FetchOneRGB-response>) ostream)
  "Serializes a message object of type '<FetchOneRGB-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reason))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reason))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'rgb) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FetchOneRGB-response>) istream)
  "Deserializes a message object of type '<FetchOneRGB-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reason) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'reason) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'rgb) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FetchOneRGB-response>)))
  "Returns string type for a service object of type '<FetchOneRGB-response>"
  "realsense_cam/FetchOneRGBResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchOneRGB-response)))
  "Returns string type for a service object of type 'FetchOneRGB-response"
  "realsense_cam/FetchOneRGBResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FetchOneRGB-response>)))
  "Returns md5sum for a message object of type '<FetchOneRGB-response>"
  "ccd168e371de7ed9bbb3078068a6b679")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FetchOneRGB-response)))
  "Returns md5sum for a message object of type 'FetchOneRGB-response"
  "ccd168e371de7ed9bbb3078068a6b679")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FetchOneRGB-response>)))
  "Returns full string definition for message of type '<FetchOneRGB-response>"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%# Reason: detail of error if not succeeded.~%bool success~%string reason~%sensor_msgs/Image rgb~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FetchOneRGB-response)))
  "Returns full string definition for message of type 'FetchOneRGB-response"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%# Reason: detail of error if not succeeded.~%bool success~%string reason~%sensor_msgs/Image rgb~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FetchOneRGB-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'reason))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'rgb))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FetchOneRGB-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FetchOneRGB-response
    (cl:cons ':success (success msg))
    (cl:cons ':reason (reason msg))
    (cl:cons ':rgb (rgb msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FetchOneRGB)))
  'FetchOneRGB-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FetchOneRGB)))
  'FetchOneRGB-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FetchOneRGB)))
  "Returns string type for a service object of type '<FetchOneRGB>"
  "realsense_cam/FetchOneRGB")