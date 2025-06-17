; Auto-generated. Do not edit!


(cl:in-package pcl_sensor_data-srv)


;//! \htmlinclude ProcessPointcloud-request.msg.html

(cl:defclass <ProcessPointcloud-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ProcessPointcloud-request (<ProcessPointcloud-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ProcessPointcloud-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ProcessPointcloud-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<ProcessPointcloud-request> is deprecated: use pcl_sensor_data-srv:ProcessPointcloud-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <ProcessPointcloud-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:req-val is deprecated.  Use pcl_sensor_data-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ProcessPointcloud-request>) ostream)
  "Serializes a message object of type '<ProcessPointcloud-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'req) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ProcessPointcloud-request>) istream)
  "Deserializes a message object of type '<ProcessPointcloud-request>"
    (cl:setf (cl:slot-value msg 'req) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ProcessPointcloud-request>)))
  "Returns string type for a service object of type '<ProcessPointcloud-request>"
  "pcl_sensor_data/ProcessPointcloudRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessPointcloud-request)))
  "Returns string type for a service object of type 'ProcessPointcloud-request"
  "pcl_sensor_data/ProcessPointcloudRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ProcessPointcloud-request>)))
  "Returns md5sum for a message object of type '<ProcessPointcloud-request>"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ProcessPointcloud-request)))
  "Returns md5sum for a message object of type 'ProcessPointcloud-request"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ProcessPointcloud-request>)))
  "Returns full string definition for message of type '<ProcessPointcloud-request>"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ProcessPointcloud-request)))
  "Returns full string definition for message of type 'ProcessPointcloud-request"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ProcessPointcloud-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ProcessPointcloud-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ProcessPointcloud-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude ProcessPointcloud-response.msg.html

(cl:defclass <ProcessPointcloud-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ProcessPointcloud-response (<ProcessPointcloud-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ProcessPointcloud-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ProcessPointcloud-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<ProcessPointcloud-response> is deprecated: use pcl_sensor_data-srv:ProcessPointcloud-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ProcessPointcloud-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:success-val is deprecated.  Use pcl_sensor_data-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ProcessPointcloud-response>) ostream)
  "Serializes a message object of type '<ProcessPointcloud-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ProcessPointcloud-response>) istream)
  "Deserializes a message object of type '<ProcessPointcloud-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ProcessPointcloud-response>)))
  "Returns string type for a service object of type '<ProcessPointcloud-response>"
  "pcl_sensor_data/ProcessPointcloudResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessPointcloud-response)))
  "Returns string type for a service object of type 'ProcessPointcloud-response"
  "pcl_sensor_data/ProcessPointcloudResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ProcessPointcloud-response>)))
  "Returns md5sum for a message object of type '<ProcessPointcloud-response>"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ProcessPointcloud-response)))
  "Returns md5sum for a message object of type 'ProcessPointcloud-response"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ProcessPointcloud-response>)))
  "Returns full string definition for message of type '<ProcessPointcloud-response>"
  (cl:format cl:nil "#response~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ProcessPointcloud-response)))
  "Returns full string definition for message of type 'ProcessPointcloud-response"
  (cl:format cl:nil "#response~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ProcessPointcloud-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ProcessPointcloud-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ProcessPointcloud-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ProcessPointcloud)))
  'ProcessPointcloud-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ProcessPointcloud)))
  'ProcessPointcloud-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessPointcloud)))
  "Returns string type for a service object of type '<ProcessPointcloud>"
  "pcl_sensor_data/ProcessPointcloud")