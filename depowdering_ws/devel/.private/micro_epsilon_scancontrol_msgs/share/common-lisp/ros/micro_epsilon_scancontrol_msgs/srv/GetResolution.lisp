; Auto-generated. Do not edit!


(cl:in-package micro_epsilon_scancontrol_msgs-srv)


;//! \htmlinclude GetResolution-request.msg.html

(cl:defclass <GetResolution-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetResolution-request (<GetResolution-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetResolution-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetResolution-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name micro_epsilon_scancontrol_msgs-srv:<GetResolution-request> is deprecated: use micro_epsilon_scancontrol_msgs-srv:GetResolution-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetResolution-request>) ostream)
  "Serializes a message object of type '<GetResolution-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetResolution-request>) istream)
  "Deserializes a message object of type '<GetResolution-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetResolution-request>)))
  "Returns string type for a service object of type '<GetResolution-request>"
  "micro_epsilon_scancontrol_msgs/GetResolutionRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetResolution-request)))
  "Returns string type for a service object of type 'GetResolution-request"
  "micro_epsilon_scancontrol_msgs/GetResolutionRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetResolution-request>)))
  "Returns md5sum for a message object of type '<GetResolution-request>"
  "b29e2945c59c53f7e032bc7769074912")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetResolution-request)))
  "Returns md5sum for a message object of type 'GetResolution-request"
  "b29e2945c59c53f7e032bc7769074912")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetResolution-request>)))
  "Returns full string definition for message of type '<GetResolution-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetResolution-request)))
  "Returns full string definition for message of type 'GetResolution-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetResolution-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetResolution-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetResolution-request
))
;//! \htmlinclude GetResolution-response.msg.html

(cl:defclass <GetResolution-response> (roslisp-msg-protocol:ros-message)
  ((resolution
    :reader resolution
    :initarg :resolution
    :type cl:integer
    :initform 0)
   (return_code
    :reader return_code
    :initarg :return_code
    :type cl:integer
    :initform 0))
)

(cl:defclass GetResolution-response (<GetResolution-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetResolution-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetResolution-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name micro_epsilon_scancontrol_msgs-srv:<GetResolution-response> is deprecated: use micro_epsilon_scancontrol_msgs-srv:GetResolution-response instead.")))

(cl:ensure-generic-function 'resolution-val :lambda-list '(m))
(cl:defmethod resolution-val ((m <GetResolution-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:resolution-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:resolution instead.")
  (resolution m))

(cl:ensure-generic-function 'return_code-val :lambda-list '(m))
(cl:defmethod return_code-val ((m <GetResolution-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:return_code-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:return_code instead.")
  (return_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetResolution-response>) ostream)
  "Serializes a message object of type '<GetResolution-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'resolution)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'resolution)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'resolution)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'resolution)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'return_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetResolution-response>) istream)
  "Deserializes a message object of type '<GetResolution-response>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'resolution)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'resolution)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'resolution)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'resolution)) (cl:read-byte istream))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'return_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetResolution-response>)))
  "Returns string type for a service object of type '<GetResolution-response>"
  "micro_epsilon_scancontrol_msgs/GetResolutionResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetResolution-response)))
  "Returns string type for a service object of type 'GetResolution-response"
  "micro_epsilon_scancontrol_msgs/GetResolutionResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetResolution-response>)))
  "Returns md5sum for a message object of type '<GetResolution-response>"
  "b29e2945c59c53f7e032bc7769074912")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetResolution-response)))
  "Returns md5sum for a message object of type 'GetResolution-response"
  "b29e2945c59c53f7e032bc7769074912")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetResolution-response>)))
  "Returns full string definition for message of type '<GetResolution-response>"
  (cl:format cl:nil "uint32 resolution~%int32 return_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetResolution-response)))
  "Returns full string definition for message of type 'GetResolution-response"
  (cl:format cl:nil "uint32 resolution~%int32 return_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetResolution-response>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetResolution-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetResolution-response
    (cl:cons ':resolution (resolution msg))
    (cl:cons ':return_code (return_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetResolution)))
  'GetResolution-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetResolution)))
  'GetResolution-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetResolution)))
  "Returns string type for a service object of type '<GetResolution>"
  "micro_epsilon_scancontrol_msgs/GetResolution")