; Auto-generated. Do not edit!


(cl:in-package add_post_pro_simulation-srv)


;//! \htmlinclude APPSpawnCube-request.msg.html

(cl:defclass <APPSpawnCube-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass APPSpawnCube-request (<APPSpawnCube-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPSpawnCube-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPSpawnCube-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPSpawnCube-request> is deprecated: use add_post_pro_simulation-srv:APPSpawnCube-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPSpawnCube-request>) ostream)
  "Serializes a message object of type '<APPSpawnCube-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPSpawnCube-request>) istream)
  "Deserializes a message object of type '<APPSpawnCube-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPSpawnCube-request>)))
  "Returns string type for a service object of type '<APPSpawnCube-request>"
  "add_post_pro_simulation/APPSpawnCubeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPSpawnCube-request)))
  "Returns string type for a service object of type 'APPSpawnCube-request"
  "add_post_pro_simulation/APPSpawnCubeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPSpawnCube-request>)))
  "Returns md5sum for a message object of type '<APPSpawnCube-request>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPSpawnCube-request)))
  "Returns md5sum for a message object of type 'APPSpawnCube-request"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPSpawnCube-request>)))
  "Returns full string definition for message of type '<APPSpawnCube-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPSpawnCube-request)))
  "Returns full string definition for message of type 'APPSpawnCube-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPSpawnCube-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPSpawnCube-request>))
  "Converts a ROS message object to a list"
  (cl:list 'APPSpawnCube-request
))
;//! \htmlinclude APPSpawnCube-response.msg.html

(cl:defclass <APPSpawnCube-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass APPSpawnCube-response (<APPSpawnCube-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPSpawnCube-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPSpawnCube-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPSpawnCube-response> is deprecated: use add_post_pro_simulation-srv:APPSpawnCube-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <APPSpawnCube-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:success-val is deprecated.  Use add_post_pro_simulation-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPSpawnCube-response>) ostream)
  "Serializes a message object of type '<APPSpawnCube-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPSpawnCube-response>) istream)
  "Deserializes a message object of type '<APPSpawnCube-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPSpawnCube-response>)))
  "Returns string type for a service object of type '<APPSpawnCube-response>"
  "add_post_pro_simulation/APPSpawnCubeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPSpawnCube-response)))
  "Returns string type for a service object of type 'APPSpawnCube-response"
  "add_post_pro_simulation/APPSpawnCubeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPSpawnCube-response>)))
  "Returns md5sum for a message object of type '<APPSpawnCube-response>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPSpawnCube-response)))
  "Returns md5sum for a message object of type 'APPSpawnCube-response"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPSpawnCube-response>)))
  "Returns full string definition for message of type '<APPSpawnCube-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPSpawnCube-response)))
  "Returns full string definition for message of type 'APPSpawnCube-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPSpawnCube-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPSpawnCube-response>))
  "Converts a ROS message object to a list"
  (cl:list 'APPSpawnCube-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'APPSpawnCube)))
  'APPSpawnCube-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'APPSpawnCube)))
  'APPSpawnCube-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPSpawnCube)))
  "Returns string type for a service object of type '<APPSpawnCube>"
  "add_post_pro_simulation/APPSpawnCube")