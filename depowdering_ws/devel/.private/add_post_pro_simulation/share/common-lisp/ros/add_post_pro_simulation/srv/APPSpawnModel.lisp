; Auto-generated. Do not edit!


(cl:in-package add_post_pro_simulation-srv)


;//! \htmlinclude APPSpawnModel-request.msg.html

(cl:defclass <APPSpawnModel-request> (roslisp-msg-protocol:ros-message)
  ((model_name
    :reader model_name
    :initarg :model_name
    :type cl:string
    :initform "")
   (instance_name
    :reader instance_name
    :initarg :instance_name
    :type cl:string
    :initform "")
   (turntable
    :reader turntable
    :initarg :turntable
    :type cl:boolean
    :initform cl:nil)
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (parent_frame
    :reader parent_frame
    :initarg :parent_frame
    :type cl:string
    :initform ""))
)

(cl:defclass APPSpawnModel-request (<APPSpawnModel-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPSpawnModel-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPSpawnModel-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPSpawnModel-request> is deprecated: use add_post_pro_simulation-srv:APPSpawnModel-request instead.")))

(cl:ensure-generic-function 'model_name-val :lambda-list '(m))
(cl:defmethod model_name-val ((m <APPSpawnModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:model_name-val is deprecated.  Use add_post_pro_simulation-srv:model_name instead.")
  (model_name m))

(cl:ensure-generic-function 'instance_name-val :lambda-list '(m))
(cl:defmethod instance_name-val ((m <APPSpawnModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:instance_name-val is deprecated.  Use add_post_pro_simulation-srv:instance_name instead.")
  (instance_name m))

(cl:ensure-generic-function 'turntable-val :lambda-list '(m))
(cl:defmethod turntable-val ((m <APPSpawnModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:turntable-val is deprecated.  Use add_post_pro_simulation-srv:turntable instead.")
  (turntable m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <APPSpawnModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:pose-val is deprecated.  Use add_post_pro_simulation-srv:pose instead.")
  (pose m))

(cl:ensure-generic-function 'parent_frame-val :lambda-list '(m))
(cl:defmethod parent_frame-val ((m <APPSpawnModel-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:parent_frame-val is deprecated.  Use add_post_pro_simulation-srv:parent_frame instead.")
  (parent_frame m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPSpawnModel-request>) ostream)
  "Serializes a message object of type '<APPSpawnModel-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'model_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'model_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'instance_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'instance_name))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'turntable) 1 0)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'parent_frame))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'parent_frame))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPSpawnModel-request>) istream)
  "Deserializes a message object of type '<APPSpawnModel-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'model_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'model_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'instance_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'instance_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'turntable) (cl:not (cl:zerop (cl:read-byte istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'parent_frame) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'parent_frame) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPSpawnModel-request>)))
  "Returns string type for a service object of type '<APPSpawnModel-request>"
  "add_post_pro_simulation/APPSpawnModelRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPSpawnModel-request)))
  "Returns string type for a service object of type 'APPSpawnModel-request"
  "add_post_pro_simulation/APPSpawnModelRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPSpawnModel-request>)))
  "Returns md5sum for a message object of type '<APPSpawnModel-request>"
  "6cdf43566fecf3a5e31bc8aac7b0f400")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPSpawnModel-request)))
  "Returns md5sum for a message object of type 'APPSpawnModel-request"
  "6cdf43566fecf3a5e31bc8aac7b0f400")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPSpawnModel-request>)))
  "Returns full string definition for message of type '<APPSpawnModel-request>"
  (cl:format cl:nil "string model_name~%string instance_name~%bool turntable~%geometry_msgs/Pose pose~%string parent_frame~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPSpawnModel-request)))
  "Returns full string definition for message of type 'APPSpawnModel-request"
  (cl:format cl:nil "string model_name~%string instance_name~%bool turntable~%geometry_msgs/Pose pose~%string parent_frame~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPSpawnModel-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'model_name))
     4 (cl:length (cl:slot-value msg 'instance_name))
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     4 (cl:length (cl:slot-value msg 'parent_frame))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPSpawnModel-request>))
  "Converts a ROS message object to a list"
  (cl:list 'APPSpawnModel-request
    (cl:cons ':model_name (model_name msg))
    (cl:cons ':instance_name (instance_name msg))
    (cl:cons ':turntable (turntable msg))
    (cl:cons ':pose (pose msg))
    (cl:cons ':parent_frame (parent_frame msg))
))
;//! \htmlinclude APPSpawnModel-response.msg.html

(cl:defclass <APPSpawnModel-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass APPSpawnModel-response (<APPSpawnModel-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPSpawnModel-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPSpawnModel-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPSpawnModel-response> is deprecated: use add_post_pro_simulation-srv:APPSpawnModel-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <APPSpawnModel-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:success-val is deprecated.  Use add_post_pro_simulation-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPSpawnModel-response>) ostream)
  "Serializes a message object of type '<APPSpawnModel-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPSpawnModel-response>) istream)
  "Deserializes a message object of type '<APPSpawnModel-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPSpawnModel-response>)))
  "Returns string type for a service object of type '<APPSpawnModel-response>"
  "add_post_pro_simulation/APPSpawnModelResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPSpawnModel-response)))
  "Returns string type for a service object of type 'APPSpawnModel-response"
  "add_post_pro_simulation/APPSpawnModelResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPSpawnModel-response>)))
  "Returns md5sum for a message object of type '<APPSpawnModel-response>"
  "6cdf43566fecf3a5e31bc8aac7b0f400")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPSpawnModel-response)))
  "Returns md5sum for a message object of type 'APPSpawnModel-response"
  "6cdf43566fecf3a5e31bc8aac7b0f400")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPSpawnModel-response>)))
  "Returns full string definition for message of type '<APPSpawnModel-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPSpawnModel-response)))
  "Returns full string definition for message of type 'APPSpawnModel-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPSpawnModel-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPSpawnModel-response>))
  "Converts a ROS message object to a list"
  (cl:list 'APPSpawnModel-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'APPSpawnModel)))
  'APPSpawnModel-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'APPSpawnModel)))
  'APPSpawnModel-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPSpawnModel)))
  "Returns string type for a service object of type '<APPSpawnModel>"
  "add_post_pro_simulation/APPSpawnModel")