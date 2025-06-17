; Auto-generated. Do not edit!


(cl:in-package add_post_pro_simulation-srv)


;//! \htmlinclude SurfaceHeight-request.msg.html

(cl:defclass <SurfaceHeight-request> (roslisp-msg-protocol:ros-message)
  ((z_delta
    :reader z_delta
    :initarg :z_delta
    :type cl:float
    :initform 0.0))
)

(cl:defclass SurfaceHeight-request (<SurfaceHeight-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SurfaceHeight-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SurfaceHeight-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<SurfaceHeight-request> is deprecated: use add_post_pro_simulation-srv:SurfaceHeight-request instead.")))

(cl:ensure-generic-function 'z_delta-val :lambda-list '(m))
(cl:defmethod z_delta-val ((m <SurfaceHeight-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:z_delta-val is deprecated.  Use add_post_pro_simulation-srv:z_delta instead.")
  (z_delta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SurfaceHeight-request>) ostream)
  "Serializes a message object of type '<SurfaceHeight-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'z_delta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SurfaceHeight-request>) istream)
  "Deserializes a message object of type '<SurfaceHeight-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z_delta) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SurfaceHeight-request>)))
  "Returns string type for a service object of type '<SurfaceHeight-request>"
  "add_post_pro_simulation/SurfaceHeightRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SurfaceHeight-request)))
  "Returns string type for a service object of type 'SurfaceHeight-request"
  "add_post_pro_simulation/SurfaceHeightRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SurfaceHeight-request>)))
  "Returns md5sum for a message object of type '<SurfaceHeight-request>"
  "84a8867fc8ccf3b6b9067181a42e5ae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SurfaceHeight-request)))
  "Returns md5sum for a message object of type 'SurfaceHeight-request"
  "84a8867fc8ccf3b6b9067181a42e5ae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SurfaceHeight-request>)))
  "Returns full string definition for message of type '<SurfaceHeight-request>"
  (cl:format cl:nil "float32 z_delta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SurfaceHeight-request)))
  "Returns full string definition for message of type 'SurfaceHeight-request"
  (cl:format cl:nil "float32 z_delta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SurfaceHeight-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SurfaceHeight-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SurfaceHeight-request
    (cl:cons ':z_delta (z_delta msg))
))
;//! \htmlinclude SurfaceHeight-response.msg.html

(cl:defclass <SurfaceHeight-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SurfaceHeight-response (<SurfaceHeight-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SurfaceHeight-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SurfaceHeight-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<SurfaceHeight-response> is deprecated: use add_post_pro_simulation-srv:SurfaceHeight-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SurfaceHeight-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:success-val is deprecated.  Use add_post_pro_simulation-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SurfaceHeight-response>) ostream)
  "Serializes a message object of type '<SurfaceHeight-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SurfaceHeight-response>) istream)
  "Deserializes a message object of type '<SurfaceHeight-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SurfaceHeight-response>)))
  "Returns string type for a service object of type '<SurfaceHeight-response>"
  "add_post_pro_simulation/SurfaceHeightResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SurfaceHeight-response)))
  "Returns string type for a service object of type 'SurfaceHeight-response"
  "add_post_pro_simulation/SurfaceHeightResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SurfaceHeight-response>)))
  "Returns md5sum for a message object of type '<SurfaceHeight-response>"
  "84a8867fc8ccf3b6b9067181a42e5ae9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SurfaceHeight-response)))
  "Returns md5sum for a message object of type 'SurfaceHeight-response"
  "84a8867fc8ccf3b6b9067181a42e5ae9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SurfaceHeight-response>)))
  "Returns full string definition for message of type '<SurfaceHeight-response>"
  (cl:format cl:nil "# Success: TRUE if height is successfully changed.~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SurfaceHeight-response)))
  "Returns full string definition for message of type 'SurfaceHeight-response"
  (cl:format cl:nil "# Success: TRUE if height is successfully changed.~%bool success~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SurfaceHeight-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SurfaceHeight-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SurfaceHeight-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SurfaceHeight)))
  'SurfaceHeight-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SurfaceHeight)))
  'SurfaceHeight-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SurfaceHeight)))
  "Returns string type for a service object of type '<SurfaceHeight>"
  "add_post_pro_simulation/SurfaceHeight")