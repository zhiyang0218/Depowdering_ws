; Auto-generated. Do not edit!


(cl:in-package pcl_sensor_data-srv)


;//! \htmlinclude laserMax-request.msg.html

(cl:defclass <laserMax-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass laserMax-request (<laserMax-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <laserMax-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'laserMax-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<laserMax-request> is deprecated: use pcl_sensor_data-srv:laserMax-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <laserMax-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:req-val is deprecated.  Use pcl_sensor_data-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <laserMax-request>) ostream)
  "Serializes a message object of type '<laserMax-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'req) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <laserMax-request>) istream)
  "Deserializes a message object of type '<laserMax-request>"
    (cl:setf (cl:slot-value msg 'req) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<laserMax-request>)))
  "Returns string type for a service object of type '<laserMax-request>"
  "pcl_sensor_data/laserMaxRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'laserMax-request)))
  "Returns string type for a service object of type 'laserMax-request"
  "pcl_sensor_data/laserMaxRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<laserMax-request>)))
  "Returns md5sum for a message object of type '<laserMax-request>"
  "124fa1b43cf028c996c86f4d96158bb6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'laserMax-request)))
  "Returns md5sum for a message object of type 'laserMax-request"
  "124fa1b43cf028c996c86f4d96158bb6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<laserMax-request>)))
  "Returns full string definition for message of type '<laserMax-request>"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'laserMax-request)))
  "Returns full string definition for message of type 'laserMax-request"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <laserMax-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <laserMax-request>))
  "Converts a ROS message object to a list"
  (cl:list 'laserMax-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude laserMax-response.msg.html

(cl:defclass <laserMax-response> (roslisp-msg-protocol:ros-message)
  ((laserMax
    :reader laserMax
    :initarg :laserMax
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass laserMax-response (<laserMax-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <laserMax-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'laserMax-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<laserMax-response> is deprecated: use pcl_sensor_data-srv:laserMax-response instead.")))

(cl:ensure-generic-function 'laserMax-val :lambda-list '(m))
(cl:defmethod laserMax-val ((m <laserMax-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:laserMax-val is deprecated.  Use pcl_sensor_data-srv:laserMax instead.")
  (laserMax m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <laserMax-response>) ostream)
  "Serializes a message object of type '<laserMax-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'laserMax))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'laserMax))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <laserMax-response>) istream)
  "Deserializes a message object of type '<laserMax-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'laserMax) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'laserMax)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<laserMax-response>)))
  "Returns string type for a service object of type '<laserMax-response>"
  "pcl_sensor_data/laserMaxResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'laserMax-response)))
  "Returns string type for a service object of type 'laserMax-response"
  "pcl_sensor_data/laserMaxResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<laserMax-response>)))
  "Returns md5sum for a message object of type '<laserMax-response>"
  "124fa1b43cf028c996c86f4d96158bb6")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'laserMax-response)))
  "Returns md5sum for a message object of type 'laserMax-response"
  "124fa1b43cf028c996c86f4d96158bb6")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<laserMax-response>)))
  "Returns full string definition for message of type '<laserMax-response>"
  (cl:format cl:nil "#response~%float64[] laserMax~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'laserMax-response)))
  "Returns full string definition for message of type 'laserMax-response"
  (cl:format cl:nil "#response~%float64[] laserMax~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <laserMax-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'laserMax) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <laserMax-response>))
  "Converts a ROS message object to a list"
  (cl:list 'laserMax-response
    (cl:cons ':laserMax (laserMax msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'laserMax)))
  'laserMax-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'laserMax)))
  'laserMax-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'laserMax)))
  "Returns string type for a service object of type '<laserMax>"
  "pcl_sensor_data/laserMax")