; Auto-generated. Do not edit!


(cl:in-package micro_epsilon_scancontrol_msgs-srv)


;//! \htmlinclude SetFeature-request.msg.html

(cl:defclass <SetFeature-request> (roslisp-msg-protocol:ros-message)
  ((setting
    :reader setting
    :initarg :setting
    :type cl:integer
    :initform 0)
   (value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0))
)

(cl:defclass SetFeature-request (<SetFeature-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetFeature-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetFeature-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name micro_epsilon_scancontrol_msgs-srv:<SetFeature-request> is deprecated: use micro_epsilon_scancontrol_msgs-srv:SetFeature-request instead.")))

(cl:ensure-generic-function 'setting-val :lambda-list '(m))
(cl:defmethod setting-val ((m <SetFeature-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:setting-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:setting instead.")
  (setting m))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <SetFeature-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:value-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetFeature-request>) ostream)
  "Serializes a message object of type '<SetFeature-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'setting)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'setting)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'setting)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'setting)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'value)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'value)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'value)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'value)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetFeature-request>) istream)
  "Deserializes a message object of type '<SetFeature-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'setting)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'setting)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'setting)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'setting)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'value)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'value)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'value)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'value)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetFeature-request>)))
  "Returns string type for a service object of type '<SetFeature-request>"
  "micro_epsilon_scancontrol_msgs/SetFeatureRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetFeature-request)))
  "Returns string type for a service object of type 'SetFeature-request"
  "micro_epsilon_scancontrol_msgs/SetFeatureRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetFeature-request>)))
  "Returns md5sum for a message object of type '<SetFeature-request>"
  "b6319c48811935bafcd8759d2c550c8f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetFeature-request)))
  "Returns md5sum for a message object of type 'SetFeature-request"
  "b6319c48811935bafcd8759d2c550c8f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetFeature-request>)))
  "Returns full string definition for message of type '<SetFeature-request>"
  (cl:format cl:nil "uint32 setting~%uint32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetFeature-request)))
  "Returns full string definition for message of type 'SetFeature-request"
  (cl:format cl:nil "uint32 setting~%uint32 value~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetFeature-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetFeature-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetFeature-request
    (cl:cons ':setting (setting msg))
    (cl:cons ':value (value msg))
))
;//! \htmlinclude SetFeature-response.msg.html

(cl:defclass <SetFeature-response> (roslisp-msg-protocol:ros-message)
  ((return_code
    :reader return_code
    :initarg :return_code
    :type cl:integer
    :initform 0))
)

(cl:defclass SetFeature-response (<SetFeature-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetFeature-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetFeature-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name micro_epsilon_scancontrol_msgs-srv:<SetFeature-response> is deprecated: use micro_epsilon_scancontrol_msgs-srv:SetFeature-response instead.")))

(cl:ensure-generic-function 'return_code-val :lambda-list '(m))
(cl:defmethod return_code-val ((m <SetFeature-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:return_code-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:return_code instead.")
  (return_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetFeature-response>) ostream)
  "Serializes a message object of type '<SetFeature-response>"
  (cl:let* ((signed (cl:slot-value msg 'return_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetFeature-response>) istream)
  "Deserializes a message object of type '<SetFeature-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'return_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetFeature-response>)))
  "Returns string type for a service object of type '<SetFeature-response>"
  "micro_epsilon_scancontrol_msgs/SetFeatureResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetFeature-response)))
  "Returns string type for a service object of type 'SetFeature-response"
  "micro_epsilon_scancontrol_msgs/SetFeatureResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetFeature-response>)))
  "Returns md5sum for a message object of type '<SetFeature-response>"
  "b6319c48811935bafcd8759d2c550c8f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetFeature-response)))
  "Returns md5sum for a message object of type 'SetFeature-response"
  "b6319c48811935bafcd8759d2c550c8f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetFeature-response>)))
  "Returns full string definition for message of type '<SetFeature-response>"
  (cl:format cl:nil "int32 return_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetFeature-response)))
  "Returns full string definition for message of type 'SetFeature-response"
  (cl:format cl:nil "int32 return_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetFeature-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetFeature-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetFeature-response
    (cl:cons ':return_code (return_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetFeature)))
  'SetFeature-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetFeature)))
  'SetFeature-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetFeature)))
  "Returns string type for a service object of type '<SetFeature>"
  "micro_epsilon_scancontrol_msgs/SetFeature")