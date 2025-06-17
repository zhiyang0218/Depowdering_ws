; Auto-generated. Do not edit!


(cl:in-package add_post_pro_simulation-srv)


;//! \htmlinclude APPDeleteModel-request.msg.html

(cl:defclass <APPDeleteModel-request> (roslisp-msg-protocol:ros-message)
  ((instance_name
    :reader instance_name
    :initarg :instance_name
    :type cl:string
    :initform ""))
)

(cl:defclass APPDeleteModel-request (<APPDeleteModel-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPDeleteModel-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPDeleteModel-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPDeleteModel-request> is deprecated: use add_post_pro_simulation-srv:APPDeleteModel-request instead.")))

(cl:ensure-generic-function 'instance_name-val :lambda-list '(m))
(cl:defmethod instance_name-val ((m <APPDeleteModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:instance_name-val is deprecated.  Use add_post_pro_simulation-srv:instance_name instead.")
  (instance_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPDeleteModel-request>) ostream)
  "Serializes a message object of type '<APPDeleteModel-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'instance_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'instance_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPDeleteModel-request>) istream)
  "Deserializes a message object of type '<APPDeleteModel-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'instance_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'instance_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPDeleteModel-request>)))
  "Returns string type for a service object of type '<APPDeleteModel-request>"
  "add_post_pro_simulation/APPDeleteModelRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPDeleteModel-request)))
  "Returns string type for a service object of type 'APPDeleteModel-request"
  "add_post_pro_simulation/APPDeleteModelRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPDeleteModel-request>)))
  "Returns md5sum for a message object of type '<APPDeleteModel-request>"
  "dd7ff374ac75c6b3ba8044c8720cd572")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPDeleteModel-request)))
  "Returns md5sum for a message object of type 'APPDeleteModel-request"
  "dd7ff374ac75c6b3ba8044c8720cd572")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPDeleteModel-request>)))
  "Returns full string definition for message of type '<APPDeleteModel-request>"
  (cl:format cl:nil "string instance_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPDeleteModel-request)))
  "Returns full string definition for message of type 'APPDeleteModel-request"
  (cl:format cl:nil "string instance_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPDeleteModel-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'instance_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPDeleteModel-request>))
  "Converts a ROS message object to a list"
  (cl:list 'APPDeleteModel-request
    (cl:cons ':instance_name (instance_name msg))
))
;//! \htmlinclude APPDeleteModel-response.msg.html

(cl:defclass <APPDeleteModel-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass APPDeleteModel-response (<APPDeleteModel-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPDeleteModel-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPDeleteModel-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPDeleteModel-response> is deprecated: use add_post_pro_simulation-srv:APPDeleteModel-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <APPDeleteModel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:success-val is deprecated.  Use add_post_pro_simulation-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPDeleteModel-response>) ostream)
  "Serializes a message object of type '<APPDeleteModel-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPDeleteModel-response>) istream)
  "Deserializes a message object of type '<APPDeleteModel-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPDeleteModel-response>)))
  "Returns string type for a service object of type '<APPDeleteModel-response>"
  "add_post_pro_simulation/APPDeleteModelResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPDeleteModel-response)))
  "Returns string type for a service object of type 'APPDeleteModel-response"
  "add_post_pro_simulation/APPDeleteModelResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPDeleteModel-response>)))
  "Returns md5sum for a message object of type '<APPDeleteModel-response>"
  "dd7ff374ac75c6b3ba8044c8720cd572")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPDeleteModel-response)))
  "Returns md5sum for a message object of type 'APPDeleteModel-response"
  "dd7ff374ac75c6b3ba8044c8720cd572")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPDeleteModel-response>)))
  "Returns full string definition for message of type '<APPDeleteModel-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPDeleteModel-response)))
  "Returns full string definition for message of type 'APPDeleteModel-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPDeleteModel-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPDeleteModel-response>))
  "Converts a ROS message object to a list"
  (cl:list 'APPDeleteModel-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'APPDeleteModel)))
  'APPDeleteModel-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'APPDeleteModel)))
  'APPDeleteModel-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPDeleteModel)))
  "Returns string type for a service object of type '<APPDeleteModel>"
  "add_post_pro_simulation/APPDeleteModel")