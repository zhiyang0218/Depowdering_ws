; Auto-generated. Do not edit!


(cl:in-package add_post_pro_simulation-srv)


;//! \htmlinclude APPSpawnDepowdering-request.msg.html

(cl:defclass <APPSpawnDepowdering-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass APPSpawnDepowdering-request (<APPSpawnDepowdering-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPSpawnDepowdering-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPSpawnDepowdering-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPSpawnDepowdering-request> is deprecated: use add_post_pro_simulation-srv:APPSpawnDepowdering-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPSpawnDepowdering-request>) ostream)
  "Serializes a message object of type '<APPSpawnDepowdering-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPSpawnDepowdering-request>) istream)
  "Deserializes a message object of type '<APPSpawnDepowdering-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPSpawnDepowdering-request>)))
  "Returns string type for a service object of type '<APPSpawnDepowdering-request>"
  "add_post_pro_simulation/APPSpawnDepowderingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPSpawnDepowdering-request)))
  "Returns string type for a service object of type 'APPSpawnDepowdering-request"
  "add_post_pro_simulation/APPSpawnDepowderingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPSpawnDepowdering-request>)))
  "Returns md5sum for a message object of type '<APPSpawnDepowdering-request>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPSpawnDepowdering-request)))
  "Returns md5sum for a message object of type 'APPSpawnDepowdering-request"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPSpawnDepowdering-request>)))
  "Returns full string definition for message of type '<APPSpawnDepowdering-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPSpawnDepowdering-request)))
  "Returns full string definition for message of type 'APPSpawnDepowdering-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPSpawnDepowdering-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPSpawnDepowdering-request>))
  "Converts a ROS message object to a list"
  (cl:list 'APPSpawnDepowdering-request
))
;//! \htmlinclude APPSpawnDepowdering-response.msg.html

(cl:defclass <APPSpawnDepowdering-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass APPSpawnDepowdering-response (<APPSpawnDepowdering-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPSpawnDepowdering-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPSpawnDepowdering-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPSpawnDepowdering-response> is deprecated: use add_post_pro_simulation-srv:APPSpawnDepowdering-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <APPSpawnDepowdering-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:success-val is deprecated.  Use add_post_pro_simulation-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPSpawnDepowdering-response>) ostream)
  "Serializes a message object of type '<APPSpawnDepowdering-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPSpawnDepowdering-response>) istream)
  "Deserializes a message object of type '<APPSpawnDepowdering-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPSpawnDepowdering-response>)))
  "Returns string type for a service object of type '<APPSpawnDepowdering-response>"
  "add_post_pro_simulation/APPSpawnDepowderingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPSpawnDepowdering-response)))
  "Returns string type for a service object of type 'APPSpawnDepowdering-response"
  "add_post_pro_simulation/APPSpawnDepowderingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPSpawnDepowdering-response>)))
  "Returns md5sum for a message object of type '<APPSpawnDepowdering-response>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPSpawnDepowdering-response)))
  "Returns md5sum for a message object of type 'APPSpawnDepowdering-response"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPSpawnDepowdering-response>)))
  "Returns full string definition for message of type '<APPSpawnDepowdering-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPSpawnDepowdering-response)))
  "Returns full string definition for message of type 'APPSpawnDepowdering-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPSpawnDepowdering-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPSpawnDepowdering-response>))
  "Converts a ROS message object to a list"
  (cl:list 'APPSpawnDepowdering-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'APPSpawnDepowdering)))
  'APPSpawnDepowdering-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'APPSpawnDepowdering)))
  'APPSpawnDepowdering-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPSpawnDepowdering)))
  "Returns string type for a service object of type '<APPSpawnDepowdering>"
  "add_post_pro_simulation/APPSpawnDepowdering")