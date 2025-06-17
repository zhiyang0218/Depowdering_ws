; Auto-generated. Do not edit!


(cl:in-package pcl_sensor_data-srv)


;//! \htmlinclude RestartRecording-request.msg.html

(cl:defclass <RestartRecording-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RestartRecording-request (<RestartRecording-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RestartRecording-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RestartRecording-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<RestartRecording-request> is deprecated: use pcl_sensor_data-srv:RestartRecording-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <RestartRecording-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:req-val is deprecated.  Use pcl_sensor_data-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RestartRecording-request>) ostream)
  "Serializes a message object of type '<RestartRecording-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'req) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RestartRecording-request>) istream)
  "Deserializes a message object of type '<RestartRecording-request>"
    (cl:setf (cl:slot-value msg 'req) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RestartRecording-request>)))
  "Returns string type for a service object of type '<RestartRecording-request>"
  "pcl_sensor_data/RestartRecordingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RestartRecording-request)))
  "Returns string type for a service object of type 'RestartRecording-request"
  "pcl_sensor_data/RestartRecordingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RestartRecording-request>)))
  "Returns md5sum for a message object of type '<RestartRecording-request>"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RestartRecording-request)))
  "Returns md5sum for a message object of type 'RestartRecording-request"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RestartRecording-request>)))
  "Returns full string definition for message of type '<RestartRecording-request>"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RestartRecording-request)))
  "Returns full string definition for message of type 'RestartRecording-request"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RestartRecording-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RestartRecording-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RestartRecording-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude RestartRecording-response.msg.html

(cl:defclass <RestartRecording-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RestartRecording-response (<RestartRecording-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RestartRecording-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RestartRecording-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<RestartRecording-response> is deprecated: use pcl_sensor_data-srv:RestartRecording-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <RestartRecording-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:success-val is deprecated.  Use pcl_sensor_data-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RestartRecording-response>) ostream)
  "Serializes a message object of type '<RestartRecording-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RestartRecording-response>) istream)
  "Deserializes a message object of type '<RestartRecording-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RestartRecording-response>)))
  "Returns string type for a service object of type '<RestartRecording-response>"
  "pcl_sensor_data/RestartRecordingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RestartRecording-response)))
  "Returns string type for a service object of type 'RestartRecording-response"
  "pcl_sensor_data/RestartRecordingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RestartRecording-response>)))
  "Returns md5sum for a message object of type '<RestartRecording-response>"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RestartRecording-response)))
  "Returns md5sum for a message object of type 'RestartRecording-response"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RestartRecording-response>)))
  "Returns full string definition for message of type '<RestartRecording-response>"
  (cl:format cl:nil "#response~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RestartRecording-response)))
  "Returns full string definition for message of type 'RestartRecording-response"
  (cl:format cl:nil "#response~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RestartRecording-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RestartRecording-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RestartRecording-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RestartRecording)))
  'RestartRecording-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RestartRecording)))
  'RestartRecording-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RestartRecording)))
  "Returns string type for a service object of type '<RestartRecording>"
  "pcl_sensor_data/RestartRecording")