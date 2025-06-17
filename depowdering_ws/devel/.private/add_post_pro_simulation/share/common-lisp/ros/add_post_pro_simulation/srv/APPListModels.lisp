; Auto-generated. Do not edit!


(cl:in-package add_post_pro_simulation-srv)


;//! \htmlinclude APPListModels-request.msg.html

(cl:defclass <APPListModels-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass APPListModels-request (<APPListModels-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPListModels-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPListModels-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPListModels-request> is deprecated: use add_post_pro_simulation-srv:APPListModels-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPListModels-request>) ostream)
  "Serializes a message object of type '<APPListModels-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPListModels-request>) istream)
  "Deserializes a message object of type '<APPListModels-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPListModels-request>)))
  "Returns string type for a service object of type '<APPListModels-request>"
  "add_post_pro_simulation/APPListModelsRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPListModels-request)))
  "Returns string type for a service object of type 'APPListModels-request"
  "add_post_pro_simulation/APPListModelsRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPListModels-request>)))
  "Returns md5sum for a message object of type '<APPListModels-request>"
  "68c1312e15cb67cd7b79f814607addf5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPListModels-request)))
  "Returns md5sum for a message object of type 'APPListModels-request"
  "68c1312e15cb67cd7b79f814607addf5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPListModels-request>)))
  "Returns full string definition for message of type '<APPListModels-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPListModels-request)))
  "Returns full string definition for message of type 'APPListModels-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPListModels-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPListModels-request>))
  "Converts a ROS message object to a list"
  (cl:list 'APPListModels-request
))
;//! \htmlinclude APPListModels-response.msg.html

(cl:defclass <APPListModels-response> (roslisp-msg-protocol:ros-message)
  ((models
    :reader models
    :initarg :models
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass APPListModels-response (<APPListModels-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <APPListModels-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'APPListModels-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name add_post_pro_simulation-srv:<APPListModels-response> is deprecated: use add_post_pro_simulation-srv:APPListModels-response instead.")))

(cl:ensure-generic-function 'models-val :lambda-list '(m))
(cl:defmethod models-val ((m <APPListModels-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader add_post_pro_simulation-srv:models-val is deprecated.  Use add_post_pro_simulation-srv:models instead.")
  (models m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <APPListModels-response>) ostream)
  "Serializes a message object of type '<APPListModels-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'models))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'models))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <APPListModels-response>) istream)
  "Deserializes a message object of type '<APPListModels-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'models) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'models)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<APPListModels-response>)))
  "Returns string type for a service object of type '<APPListModels-response>"
  "add_post_pro_simulation/APPListModelsResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPListModels-response)))
  "Returns string type for a service object of type 'APPListModels-response"
  "add_post_pro_simulation/APPListModelsResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<APPListModels-response>)))
  "Returns md5sum for a message object of type '<APPListModels-response>"
  "68c1312e15cb67cd7b79f814607addf5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'APPListModels-response)))
  "Returns md5sum for a message object of type 'APPListModels-response"
  "68c1312e15cb67cd7b79f814607addf5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<APPListModels-response>)))
  "Returns full string definition for message of type '<APPListModels-response>"
  (cl:format cl:nil "string[] models~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'APPListModels-response)))
  "Returns full string definition for message of type 'APPListModels-response"
  (cl:format cl:nil "string[] models~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <APPListModels-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'models) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <APPListModels-response>))
  "Converts a ROS message object to a list"
  (cl:list 'APPListModels-response
    (cl:cons ':models (models msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'APPListModels)))
  'APPListModels-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'APPListModels)))
  'APPListModels-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'APPListModels)))
  "Returns string type for a service object of type '<APPListModels>"
  "add_post_pro_simulation/APPListModels")