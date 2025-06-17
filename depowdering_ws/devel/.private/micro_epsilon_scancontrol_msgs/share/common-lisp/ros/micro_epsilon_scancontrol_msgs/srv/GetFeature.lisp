; Auto-generated. Do not edit!


(cl:in-package micro_epsilon_scancontrol_msgs-srv)


;//! \htmlinclude GetFeature-request.msg.html

(cl:defclass <GetFeature-request> (roslisp-msg-protocol:ros-message)
  ((setting
    :reader setting
    :initarg :setting
    :type cl:integer
    :initform 0))
)

(cl:defclass GetFeature-request (<GetFeature-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetFeature-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetFeature-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name micro_epsilon_scancontrol_msgs-srv:<GetFeature-request> is deprecated: use micro_epsilon_scancontrol_msgs-srv:GetFeature-request instead.")))

(cl:ensure-generic-function 'setting-val :lambda-list '(m))
(cl:defmethod setting-val ((m <GetFeature-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:setting-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:setting instead.")
  (setting m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetFeature-request>) ostream)
  "Serializes a message object of type '<GetFeature-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'setting)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'setting)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'setting)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'setting)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetFeature-request>) istream)
  "Deserializes a message object of type '<GetFeature-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'setting)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'setting)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'setting)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'setting)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetFeature-request>)))
  "Returns string type for a service object of type '<GetFeature-request>"
  "micro_epsilon_scancontrol_msgs/GetFeatureRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetFeature-request)))
  "Returns string type for a service object of type 'GetFeature-request"
  "micro_epsilon_scancontrol_msgs/GetFeatureRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetFeature-request>)))
  "Returns md5sum for a message object of type '<GetFeature-request>"
  "4a270fe9e59018192da9c039467ff2b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetFeature-request)))
  "Returns md5sum for a message object of type 'GetFeature-request"
  "4a270fe9e59018192da9c039467ff2b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetFeature-request>)))
  "Returns full string definition for message of type '<GetFeature-request>"
  (cl:format cl:nil "uint32 setting~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetFeature-request)))
  "Returns full string definition for message of type 'GetFeature-request"
  (cl:format cl:nil "uint32 setting~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetFeature-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetFeature-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetFeature-request
    (cl:cons ':setting (setting msg))
))
;//! \htmlinclude GetFeature-response.msg.html

(cl:defclass <GetFeature-response> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:integer
    :initform 0)
   (return_code
    :reader return_code
    :initarg :return_code
    :type cl:integer
    :initform 0))
)

(cl:defclass GetFeature-response (<GetFeature-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetFeature-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetFeature-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name micro_epsilon_scancontrol_msgs-srv:<GetFeature-response> is deprecated: use micro_epsilon_scancontrol_msgs-srv:GetFeature-response instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <GetFeature-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:value-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:value instead.")
  (value m))

(cl:ensure-generic-function 'return_code-val :lambda-list '(m))
(cl:defmethod return_code-val ((m <GetFeature-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:return_code-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:return_code instead.")
  (return_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetFeature-response>) ostream)
  "Serializes a message object of type '<GetFeature-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'value)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'value)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'value)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'value)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'return_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetFeature-response>) istream)
  "Deserializes a message object of type '<GetFeature-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'value)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'value)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'value)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'value)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'return_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetFeature-response>)))
  "Returns string type for a service object of type '<GetFeature-response>"
  "micro_epsilon_scancontrol_msgs/GetFeatureResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetFeature-response)))
  "Returns string type for a service object of type 'GetFeature-response"
  "micro_epsilon_scancontrol_msgs/GetFeatureResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetFeature-response>)))
  "Returns md5sum for a message object of type '<GetFeature-response>"
  "4a270fe9e59018192da9c039467ff2b9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetFeature-response)))
  "Returns md5sum for a message object of type 'GetFeature-response"
  "4a270fe9e59018192da9c039467ff2b9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetFeature-response>)))
  "Returns full string definition for message of type '<GetFeature-response>"
  (cl:format cl:nil "uint32 value~%int32 return_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetFeature-response)))
  "Returns full string definition for message of type 'GetFeature-response"
  (cl:format cl:nil "uint32 value~%int32 return_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetFeature-response>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetFeature-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetFeature-response
    (cl:cons ':value (value msg))
    (cl:cons ':return_code (return_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetFeature)))
  'GetFeature-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetFeature)))
  'GetFeature-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetFeature)))
  "Returns string type for a service object of type '<GetFeature>"
  "micro_epsilon_scancontrol_msgs/GetFeature")