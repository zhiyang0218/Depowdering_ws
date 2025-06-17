; Auto-generated. Do not edit!


(cl:in-package micro_epsilon_scancontrol_msgs-srv)


;//! \htmlinclude GetAvailableResolutions-request.msg.html

(cl:defclass <GetAvailableResolutions-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetAvailableResolutions-request (<GetAvailableResolutions-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetAvailableResolutions-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetAvailableResolutions-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name micro_epsilon_scancontrol_msgs-srv:<GetAvailableResolutions-request> is deprecated: use micro_epsilon_scancontrol_msgs-srv:GetAvailableResolutions-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetAvailableResolutions-request>) ostream)
  "Serializes a message object of type '<GetAvailableResolutions-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetAvailableResolutions-request>) istream)
  "Deserializes a message object of type '<GetAvailableResolutions-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetAvailableResolutions-request>)))
  "Returns string type for a service object of type '<GetAvailableResolutions-request>"
  "micro_epsilon_scancontrol_msgs/GetAvailableResolutionsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetAvailableResolutions-request)))
  "Returns string type for a service object of type 'GetAvailableResolutions-request"
  "micro_epsilon_scancontrol_msgs/GetAvailableResolutionsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetAvailableResolutions-request>)))
  "Returns md5sum for a message object of type '<GetAvailableResolutions-request>"
  "a603ff8225a17994979733ebf35285f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetAvailableResolutions-request)))
  "Returns md5sum for a message object of type 'GetAvailableResolutions-request"
  "a603ff8225a17994979733ebf35285f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetAvailableResolutions-request>)))
  "Returns full string definition for message of type '<GetAvailableResolutions-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetAvailableResolutions-request)))
  "Returns full string definition for message of type 'GetAvailableResolutions-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetAvailableResolutions-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetAvailableResolutions-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetAvailableResolutions-request
))
;//! \htmlinclude GetAvailableResolutions-response.msg.html

(cl:defclass <GetAvailableResolutions-response> (roslisp-msg-protocol:ros-message)
  ((resolutions
    :reader resolutions
    :initarg :resolutions
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (return_code
    :reader return_code
    :initarg :return_code
    :type cl:integer
    :initform 0))
)

(cl:defclass GetAvailableResolutions-response (<GetAvailableResolutions-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetAvailableResolutions-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetAvailableResolutions-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name micro_epsilon_scancontrol_msgs-srv:<GetAvailableResolutions-response> is deprecated: use micro_epsilon_scancontrol_msgs-srv:GetAvailableResolutions-response instead.")))

(cl:ensure-generic-function 'resolutions-val :lambda-list '(m))
(cl:defmethod resolutions-val ((m <GetAvailableResolutions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:resolutions-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:resolutions instead.")
  (resolutions m))

(cl:ensure-generic-function 'return_code-val :lambda-list '(m))
(cl:defmethod return_code-val ((m <GetAvailableResolutions-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader micro_epsilon_scancontrol_msgs-srv:return_code-val is deprecated.  Use micro_epsilon_scancontrol_msgs-srv:return_code instead.")
  (return_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetAvailableResolutions-response>) ostream)
  "Serializes a message object of type '<GetAvailableResolutions-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'resolutions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) ele) ostream))
   (cl:slot-value msg 'resolutions))
  (cl:let* ((signed (cl:slot-value msg 'return_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetAvailableResolutions-response>) istream)
  "Deserializes a message object of type '<GetAvailableResolutions-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'resolutions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'resolutions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:aref vals i)) (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'return_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetAvailableResolutions-response>)))
  "Returns string type for a service object of type '<GetAvailableResolutions-response>"
  "micro_epsilon_scancontrol_msgs/GetAvailableResolutionsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetAvailableResolutions-response)))
  "Returns string type for a service object of type 'GetAvailableResolutions-response"
  "micro_epsilon_scancontrol_msgs/GetAvailableResolutionsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetAvailableResolutions-response>)))
  "Returns md5sum for a message object of type '<GetAvailableResolutions-response>"
  "a603ff8225a17994979733ebf35285f3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetAvailableResolutions-response)))
  "Returns md5sum for a message object of type 'GetAvailableResolutions-response"
  "a603ff8225a17994979733ebf35285f3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetAvailableResolutions-response>)))
  "Returns full string definition for message of type '<GetAvailableResolutions-response>"
  (cl:format cl:nil "uint32[] resolutions~%int32 return_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetAvailableResolutions-response)))
  "Returns full string definition for message of type 'GetAvailableResolutions-response"
  (cl:format cl:nil "uint32[] resolutions~%int32 return_code~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetAvailableResolutions-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'resolutions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetAvailableResolutions-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetAvailableResolutions-response
    (cl:cons ':resolutions (resolutions msg))
    (cl:cons ':return_code (return_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetAvailableResolutions)))
  'GetAvailableResolutions-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetAvailableResolutions)))
  'GetAvailableResolutions-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetAvailableResolutions)))
  "Returns string type for a service object of type '<GetAvailableResolutions>"
  "micro_epsilon_scancontrol_msgs/GetAvailableResolutions")