; Auto-generated. Do not edit!


(cl:in-package add_post_pro_simulation-srv)


;//! \htmlinclude ConversionRequest-request.msg.html

(cl:defclass <ConversionRequest-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass ConversionRequest-request (<ConversionRequest-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConversionRequest-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConversionRequest-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<ConversionRequest-request> is deprecated: use add_post_pro_simulation-srv:ConversionRequest-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <ConversionRequest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:name-val is deprecated.  Use add_post_pro_simulation-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConversionRequest-request>) ostream)
  "Serializes a message object of type '<ConversionRequest-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConversionRequest-request>) istream)
  "Deserializes a message object of type '<ConversionRequest-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConversionRequest-request>)))
  "Returns string type for a service object of type '<ConversionRequest-request>"
  "add_post_pro_simulation/ConversionRequestRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConversionRequest-request)))
  "Returns string type for a service object of type 'ConversionRequest-request"
  "add_post_pro_simulation/ConversionRequestRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConversionRequest-request>)))
  "Returns md5sum for a message object of type '<ConversionRequest-request>"
  "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConversionRequest-request)))
  "Returns md5sum for a message object of type 'ConversionRequest-request"
  "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConversionRequest-request>)))
  "Returns full string definition for message of type '<ConversionRequest-request>"
  (cl:format cl:nil "~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConversionRequest-request)))
  "Returns full string definition for message of type 'ConversionRequest-request"
  (cl:format cl:nil "~%string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConversionRequest-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConversionRequest-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ConversionRequest-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude ConversionRequest-response.msg.html

(cl:defclass <ConversionRequest-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ConversionRequest-response (<ConversionRequest-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ConversionRequest-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ConversionRequest-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<ConversionRequest-response> is deprecated: use add_post_pro_simulation-srv:ConversionRequest-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ConversionRequest-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:success-val is deprecated.  Use add_post_pro_simulation-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ConversionRequest-response>) ostream)
  "Serializes a message object of type '<ConversionRequest-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ConversionRequest-response>) istream)
  "Deserializes a message object of type '<ConversionRequest-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ConversionRequest-response>)))
  "Returns string type for a service object of type '<ConversionRequest-response>"
  "add_post_pro_simulation/ConversionRequestResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConversionRequest-response)))
  "Returns string type for a service object of type 'ConversionRequest-response"
  "add_post_pro_simulation/ConversionRequestResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ConversionRequest-response>)))
  "Returns md5sum for a message object of type '<ConversionRequest-response>"
  "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ConversionRequest-response)))
  "Returns md5sum for a message object of type 'ConversionRequest-response"
  "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ConversionRequest-response>)))
  "Returns full string definition for message of type '<ConversionRequest-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ConversionRequest-response)))
  "Returns full string definition for message of type 'ConversionRequest-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ConversionRequest-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ConversionRequest-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ConversionRequest-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ConversionRequest)))
  'ConversionRequest-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ConversionRequest)))
  'ConversionRequest-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ConversionRequest)))
  "Returns string type for a service object of type '<ConversionRequest>"
  "add_post_pro_simulation/ConversionRequest")