; Auto-generated. Do not edit!


(cl:in-package realsense_cam-srv)


;//! \htmlinclude FindWorkspaceCenter-request.msg.html

(cl:defclass <FindWorkspaceCenter-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass FindWorkspaceCenter-request (<FindWorkspaceCenter-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FindWorkspaceCenter-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FindWorkspaceCenter-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<FindWorkspaceCenter-request> is deprecated: use realsense_cam-srv:FindWorkspaceCenter-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FindWorkspaceCenter-request>) ostream)
  "Serializes a message object of type '<FindWorkspaceCenter-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FindWorkspaceCenter-request>) istream)
  "Deserializes a message object of type '<FindWorkspaceCenter-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FindWorkspaceCenter-request>)))
  "Returns string type for a service object of type '<FindWorkspaceCenter-request>"
  "realsense_cam/FindWorkspaceCenterRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FindWorkspaceCenter-request)))
  "Returns string type for a service object of type 'FindWorkspaceCenter-request"
  "realsense_cam/FindWorkspaceCenterRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FindWorkspaceCenter-request>)))
  "Returns md5sum for a message object of type '<FindWorkspaceCenter-request>"
  "bd4595b8ce50ecc3768e9c5dc7e441ab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FindWorkspaceCenter-request)))
  "Returns md5sum for a message object of type 'FindWorkspaceCenter-request"
  "bd4595b8ce50ecc3768e9c5dc7e441ab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FindWorkspaceCenter-request>)))
  "Returns full string definition for message of type '<FindWorkspaceCenter-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FindWorkspaceCenter-request)))
  "Returns full string definition for message of type 'FindWorkspaceCenter-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FindWorkspaceCenter-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FindWorkspaceCenter-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FindWorkspaceCenter-request
))
;//! \htmlinclude FindWorkspaceCenter-response.msg.html

(cl:defclass <FindWorkspaceCenter-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (point
    :reader point
    :initarg :point
    :type geometry_msgs-msg:PointStamped
    :initform (cl:make-instance 'geometry_msgs-msg:PointStamped))
   (z_change
    :reader z_change
    :initarg :z_change
    :type cl:float
    :initform 0.0)
   (x_change
    :reader x_change
    :initarg :x_change
    :type cl:float
    :initform 0.0))
)

(cl:defclass FindWorkspaceCenter-response (<FindWorkspaceCenter-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FindWorkspaceCenter-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FindWorkspaceCenter-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<FindWorkspaceCenter-response> is deprecated: use realsense_cam-srv:FindWorkspaceCenter-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <FindWorkspaceCenter-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:success-val is deprecated.  Use realsense_cam-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <FindWorkspaceCenter-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:point-val is deprecated.  Use realsense_cam-srv:point instead.")
  (point m))

(cl:ensure-generic-function 'z_change-val :lambda-list '(m))
(cl:defmethod z_change-val ((m <FindWorkspaceCenter-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:z_change-val is deprecated.  Use realsense_cam-srv:z_change instead.")
  (z_change m))

(cl:ensure-generic-function 'x_change-val :lambda-list '(m))
(cl:defmethod x_change-val ((m <FindWorkspaceCenter-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:x_change-val is deprecated.  Use realsense_cam-srv:x_change instead.")
  (x_change m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FindWorkspaceCenter-response>) ostream)
  "Serializes a message object of type '<FindWorkspaceCenter-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z_change))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x_change))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FindWorkspaceCenter-response>) istream)
  "Deserializes a message object of type '<FindWorkspaceCenter-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z_change) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x_change) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FindWorkspaceCenter-response>)))
  "Returns string type for a service object of type '<FindWorkspaceCenter-response>"
  "realsense_cam/FindWorkspaceCenterResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FindWorkspaceCenter-response)))
  "Returns string type for a service object of type 'FindWorkspaceCenter-response"
  "realsense_cam/FindWorkspaceCenterResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FindWorkspaceCenter-response>)))
  "Returns md5sum for a message object of type '<FindWorkspaceCenter-response>"
  "bd4595b8ce50ecc3768e9c5dc7e441ab")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FindWorkspaceCenter-response)))
  "Returns md5sum for a message object of type 'FindWorkspaceCenter-response"
  "bd4595b8ce50ecc3768e9c5dc7e441ab")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FindWorkspaceCenter-response>)))
  "Returns full string definition for message of type '<FindWorkspaceCenter-response>"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%# Reason: detail of error if not succeeded.~%bool success~%geometry_msgs/PointStamped point~%float64 z_change~%float64 x_change~%~%================================================================================~%MSG: geometry_msgs/PointStamped~%# This represents a Point with reference coordinate frame and timestamp~%Header header~%Point point~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FindWorkspaceCenter-response)))
  "Returns full string definition for message of type 'FindWorkspaceCenter-response"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%# Reason: detail of error if not succeeded.~%bool success~%geometry_msgs/PointStamped point~%float64 z_change~%float64 x_change~%~%================================================================================~%MSG: geometry_msgs/PointStamped~%# This represents a Point with reference coordinate frame and timestamp~%Header header~%Point point~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FindWorkspaceCenter-response>))
  (cl:+ 0
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FindWorkspaceCenter-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FindWorkspaceCenter-response
    (cl:cons ':success (success msg))
    (cl:cons ':point (point msg))
    (cl:cons ':z_change (z_change msg))
    (cl:cons ':x_change (x_change msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FindWorkspaceCenter)))
  'FindWorkspaceCenter-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FindWorkspaceCenter)))
  'FindWorkspaceCenter-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FindWorkspaceCenter)))
  "Returns string type for a service object of type '<FindWorkspaceCenter>"
  "realsense_cam/FindWorkspaceCenter")