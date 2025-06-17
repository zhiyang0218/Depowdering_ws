; Auto-generated. Do not edit!


(cl:in-package pcl_sensor_data-srv)


;//! \htmlinclude angleAdjust-request.msg.html

(cl:defclass <angleAdjust-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass angleAdjust-request (<angleAdjust-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <angleAdjust-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'angleAdjust-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<angleAdjust-request> is deprecated: use pcl_sensor_data-srv:angleAdjust-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <angleAdjust-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:req-val is deprecated.  Use pcl_sensor_data-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <angleAdjust-request>) ostream)
  "Serializes a message object of type '<angleAdjust-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'req) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <angleAdjust-request>) istream)
  "Deserializes a message object of type '<angleAdjust-request>"
    (cl:setf (cl:slot-value msg 'req) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<angleAdjust-request>)))
  "Returns string type for a service object of type '<angleAdjust-request>"
  "pcl_sensor_data/angleAdjustRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'angleAdjust-request)))
  "Returns string type for a service object of type 'angleAdjust-request"
  "pcl_sensor_data/angleAdjustRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<angleAdjust-request>)))
  "Returns md5sum for a message object of type '<angleAdjust-request>"
  "f263ad018944d1f74b66bb892b6765bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'angleAdjust-request)))
  "Returns md5sum for a message object of type 'angleAdjust-request"
  "f263ad018944d1f74b66bb892b6765bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<angleAdjust-request>)))
  "Returns full string definition for message of type '<angleAdjust-request>"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'angleAdjust-request)))
  "Returns full string definition for message of type 'angleAdjust-request"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <angleAdjust-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <angleAdjust-request>))
  "Converts a ROS message object to a list"
  (cl:list 'angleAdjust-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude angleAdjust-response.msg.html

(cl:defclass <angleAdjust-response> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass angleAdjust-response (<angleAdjust-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <angleAdjust-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'angleAdjust-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<angleAdjust-response> is deprecated: use pcl_sensor_data-srv:angleAdjust-response instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <angleAdjust-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:angle-val is deprecated.  Use pcl_sensor_data-srv:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <angleAdjust-response>) ostream)
  "Serializes a message object of type '<angleAdjust-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <angleAdjust-response>) istream)
  "Deserializes a message object of type '<angleAdjust-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<angleAdjust-response>)))
  "Returns string type for a service object of type '<angleAdjust-response>"
  "pcl_sensor_data/angleAdjustResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'angleAdjust-response)))
  "Returns string type for a service object of type 'angleAdjust-response"
  "pcl_sensor_data/angleAdjustResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<angleAdjust-response>)))
  "Returns md5sum for a message object of type '<angleAdjust-response>"
  "f263ad018944d1f74b66bb892b6765bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'angleAdjust-response)))
  "Returns md5sum for a message object of type 'angleAdjust-response"
  "f263ad018944d1f74b66bb892b6765bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<angleAdjust-response>)))
  "Returns full string definition for message of type '<angleAdjust-response>"
  (cl:format cl:nil "#response~%float64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'angleAdjust-response)))
  "Returns full string definition for message of type 'angleAdjust-response"
  (cl:format cl:nil "#response~%float64 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <angleAdjust-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <angleAdjust-response>))
  "Converts a ROS message object to a list"
  (cl:list 'angleAdjust-response
    (cl:cons ':angle (angle msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'angleAdjust)))
  'angleAdjust-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'angleAdjust)))
  'angleAdjust-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'angleAdjust)))
  "Returns string type for a service object of type '<angleAdjust>"
  "pcl_sensor_data/angleAdjust")