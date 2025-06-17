; Auto-generated. Do not edit!


(cl:in-package pcl_sensor_data-srv)


;//! \htmlinclude avgZDistance-request.msg.html

(cl:defclass <avgZDistance-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass avgZDistance-request (<avgZDistance-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <avgZDistance-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'avgZDistance-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<avgZDistance-request> is deprecated: use pcl_sensor_data-srv:avgZDistance-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <avgZDistance-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:req-val is deprecated.  Use pcl_sensor_data-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <avgZDistance-request>) ostream)
  "Serializes a message object of type '<avgZDistance-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'req) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <avgZDistance-request>) istream)
  "Deserializes a message object of type '<avgZDistance-request>"
    (cl:setf (cl:slot-value msg 'req) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<avgZDistance-request>)))
  "Returns string type for a service object of type '<avgZDistance-request>"
  "pcl_sensor_data/avgZDistanceRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'avgZDistance-request)))
  "Returns string type for a service object of type 'avgZDistance-request"
  "pcl_sensor_data/avgZDistanceRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<avgZDistance-request>)))
  "Returns md5sum for a message object of type '<avgZDistance-request>"
  "b7675e7f132f1b7fa6dcff657e1f118e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'avgZDistance-request)))
  "Returns md5sum for a message object of type 'avgZDistance-request"
  "b7675e7f132f1b7fa6dcff657e1f118e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<avgZDistance-request>)))
  "Returns full string definition for message of type '<avgZDistance-request>"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'avgZDistance-request)))
  "Returns full string definition for message of type 'avgZDistance-request"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <avgZDistance-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <avgZDistance-request>))
  "Converts a ROS message object to a list"
  (cl:list 'avgZDistance-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude avgZDistance-response.msg.html

(cl:defclass <avgZDistance-response> (roslisp-msg-protocol:ros-message)
  ((distance
    :reader distance
    :initarg :distance
    :type cl:float
    :initform 0.0))
)

(cl:defclass avgZDistance-response (<avgZDistance-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <avgZDistance-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'avgZDistance-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<avgZDistance-response> is deprecated: use pcl_sensor_data-srv:avgZDistance-response instead.")))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <avgZDistance-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:distance-val is deprecated.  Use pcl_sensor_data-srv:distance instead.")
  (distance m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <avgZDistance-response>) ostream)
  "Serializes a message object of type '<avgZDistance-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'distance))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <avgZDistance-response>) istream)
  "Deserializes a message object of type '<avgZDistance-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<avgZDistance-response>)))
  "Returns string type for a service object of type '<avgZDistance-response>"
  "pcl_sensor_data/avgZDistanceResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'avgZDistance-response)))
  "Returns string type for a service object of type 'avgZDistance-response"
  "pcl_sensor_data/avgZDistanceResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<avgZDistance-response>)))
  "Returns md5sum for a message object of type '<avgZDistance-response>"
  "b7675e7f132f1b7fa6dcff657e1f118e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'avgZDistance-response)))
  "Returns md5sum for a message object of type 'avgZDistance-response"
  "b7675e7f132f1b7fa6dcff657e1f118e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<avgZDistance-response>)))
  "Returns full string definition for message of type '<avgZDistance-response>"
  (cl:format cl:nil "#response~%float64 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'avgZDistance-response)))
  "Returns full string definition for message of type 'avgZDistance-response"
  (cl:format cl:nil "#response~%float64 distance~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <avgZDistance-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <avgZDistance-response>))
  "Converts a ROS message object to a list"
  (cl:list 'avgZDistance-response
    (cl:cons ':distance (distance msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'avgZDistance)))
  'avgZDistance-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'avgZDistance)))
  'avgZDistance-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'avgZDistance)))
  "Returns string type for a service object of type '<avgZDistance>"
  "pcl_sensor_data/avgZDistance")