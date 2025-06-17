; Auto-generated. Do not edit!


(cl:in-package micro_epsilon_scancontrol_msgs-srv)


;//! \htmlinclude SetResolution-request.msg.html

(cl:defclass <SetResolution-request> (roslisp-msg-protocol:ros-message)
  ((resolution
    :reader resolution
    :initarg :resolution
    :type cl:integer
    :initform 0))
)

(cl:defclass SetResolution-request (<SetResolution-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetResolution-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetResolution-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name micro_epsilon_scancontrol_msgs-srv:<SetResolution-request> is deprecated: use micro_epsilon_scancontrol_msgs-srv:SetResolution-request instead.")))

(cl:ensure-generic-function 'resolution-val :lambda-list '(m))
(cl:defmethod resolution-val ((m <SetResolution-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:resolution-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:resolution instead.")
  (resolution m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetResolution-request>) ostream)
  "Serializes a message object of type '<SetResolution-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'resolution)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'resolution)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'resolution)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'resolution)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetResolution-request>) istream)
  "Deserializes a message object of type '<SetResolution-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'resolution)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'resolution)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'resolution)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'resolution)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetResolution-request>)))
  "Returns string type for a service object of type '<SetResolution-request>"
  "micro_epsilon_scancontrol_msgs/SetResolutionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetResolution-request)))
  "Returns string type for a service object of type 'SetResolution-request"
  "micro_epsilon_scancontrol_msgs/SetResolutionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetResolution-request>)))
  "Returns md5sum for a message object of type '<SetResolution-request>"
  "31b37757a8d3cae8da33ee6b9ff1b953")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetResolution-request)))
  "Returns md5sum for a message object of type 'SetResolution-request"
  "31b37757a8d3cae8da33ee6b9ff1b953")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetResolution-request>)))
  "Returns full string definition for message of type '<SetResolution-request>"
  (cl:format cl:nil "uint32 resolution~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetResolution-request)))
  "Returns full string definition for message of type 'SetResolution-request"
  (cl:format cl:nil "uint32 resolution~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetResolution-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetResolution-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetResolution-request
    (cl:cons ':resolution (resolution msg))
))
;//! \htmlinclude SetResolution-response.msg.html

(cl:defclass <SetResolution-response> (roslisp-msg-protocol:ros-message)
  ((return_code
    :reader return_code
    :initarg :return_code
    :type cl:integer
    :initform 0))
)

(cl:defclass SetResolution-response (<SetResolution-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetResolution-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetResolution-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name micro_epsilon_scancontrol_msgs-srv:<SetResolution-response> is deprecated: use micro_epsilon_scancontrol_msgs-srv:SetResolution-response instead.")))

(cl:ensure-generic-function 'return_code-val :lambda-list '(m))
(cl:defmethod return_code-val ((m <SetResolution-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:return_code-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:return_code instead.")
  (return_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetResolution-response>) ostream)
  "Serializes a message object of type '<SetResolution-response>"
  (cl:let* ((signed (cl:slot-value msg 'return_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetResolution-response>) istream)
  "Deserializes a message object of type '<SetResolution-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'return_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetResolution-response>)))
  "Returns string type for a service object of type '<SetResolution-response>"
  "micro_epsilon_scancontrol_msgs/SetResolutionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetResolution-response)))
  "Returns string type for a service object of type 'SetResolution-response"
  "micro_epsilon_scancontrol_msgs/SetResolutionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetResolution-response>)))
  "Returns md5sum for a message object of type '<SetResolution-response>"
  "31b37757a8d3cae8da33ee6b9ff1b953")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetResolution-response)))
  "Returns md5sum for a message object of type 'SetResolution-response"
  "31b37757a8d3cae8da33ee6b9ff1b953")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetResolution-response>)))
  "Returns full string definition for message of type '<SetResolution-response>"
  (cl:format cl:nil "int32 return_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetResolution-response)))
  "Returns full string definition for message of type 'SetResolution-response"
  (cl:format cl:nil "int32 return_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetResolution-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetResolution-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetResolution-response
    (cl:cons ':return_code (return_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetResolution)))
  'SetResolution-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetResolution)))
  'SetResolution-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetResolution)))
  "Returns string type for a service object of type '<SetResolution>"
  "micro_epsilon_scancontrol_msgs/SetResolution")