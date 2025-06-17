; Auto-generated. Do not edit!


(cl:in-package add_post_pro_simulation-srv)


;//! \htmlinclude APPChangeHeight-request.msg.html

(cl:defclass <APPChangeHeight-request> (roslisp-msg-protocol:ros-message)
  ((z_delta
    :reader z_delta
    :initarg :z_delta
    :type cl:float
    :initform 0.0))
)

(cl:defclass APPChangeHeight-request (<APPChangeHeight-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPChangeHeight-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPChangeHeight-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPChangeHeight-request> is deprecated: use add_post_pro_simulation-srv:APPChangeHeight-request instead.")))

(cl:ensure-generic-function 'z_delta-val :lambda-list '(m))
(cl:defmethod z_delta-val ((m <APPChangeHeight-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:z_delta-val is deprecated.  Use add_post_pro_simulation-srv:z_delta instead.")
  (z_delta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPChangeHeight-request>) ostream)
  "Serializes a message object of type '<APPChangeHeight-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z_delta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPChangeHeight-request>) istream)
  "Deserializes a message object of type '<APPChangeHeight-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z_delta) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPChangeHeight-request>)))
  "Returns string type for a service object of type '<APPChangeHeight-request>"
  "add_post_pro_simulation/APPChangeHeightRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPChangeHeight-request)))
  "Returns string type for a service object of type 'APPChangeHeight-request"
  "add_post_pro_simulation/APPChangeHeightRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPChangeHeight-request>)))
  "Returns md5sum for a message object of type '<APPChangeHeight-request>"
  "84a8867fc8ccf3b6b9067181a42e5ae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPChangeHeight-request)))
  "Returns md5sum for a message object of type 'APPChangeHeight-request"
  "84a8867fc8ccf3b6b9067181a42e5ae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPChangeHeight-request>)))
  "Returns full string definition for message of type '<APPChangeHeight-request>"
  (cl:format cl:nil "float32 z_delta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPChangeHeight-request)))
  "Returns full string definition for message of type 'APPChangeHeight-request"
  (cl:format cl:nil "float32 z_delta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPChangeHeight-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPChangeHeight-request>))
  "Converts a ROS message object to a list"
  (cl:list 'APPChangeHeight-request
    (cl:cons ':z_delta (z_delta msg))
))
;//! \htmlinclude APPChangeHeight-response.msg.html

(cl:defclass <APPChangeHeight-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass APPChangeHeight-response (<APPChangeHeight-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPChangeHeight-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPChangeHeight-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPChangeHeight-response> is deprecated: use add_post_pro_simulation-srv:APPChangeHeight-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <APPChangeHeight-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:success-val is deprecated.  Use add_post_pro_simulation-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPChangeHeight-response>) ostream)
  "Serializes a message object of type '<APPChangeHeight-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPChangeHeight-response>) istream)
  "Deserializes a message object of type '<APPChangeHeight-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPChangeHeight-response>)))
  "Returns string type for a service object of type '<APPChangeHeight-response>"
  "add_post_pro_simulation/APPChangeHeightResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPChangeHeight-response)))
  "Returns string type for a service object of type 'APPChangeHeight-response"
  "add_post_pro_simulation/APPChangeHeightResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPChangeHeight-response>)))
  "Returns md5sum for a message object of type '<APPChangeHeight-response>"
  "84a8867fc8ccf3b6b9067181a42e5ae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPChangeHeight-response)))
  "Returns md5sum for a message object of type 'APPChangeHeight-response"
  "84a8867fc8ccf3b6b9067181a42e5ae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPChangeHeight-response>)))
  "Returns full string definition for message of type '<APPChangeHeight-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPChangeHeight-response)))
  "Returns full string definition for message of type 'APPChangeHeight-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPChangeHeight-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPChangeHeight-response>))
  "Converts a ROS message object to a list"
  (cl:list 'APPChangeHeight-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'APPChangeHeight)))
  'APPChangeHeight-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'APPChangeHeight)))
  'APPChangeHeight-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPChangeHeight)))
  "Returns string type for a service object of type '<APPChangeHeight>"
  "add_post_pro_simulation/APPChangeHeight")