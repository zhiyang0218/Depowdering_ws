; Auto-generated. Do not edit!


(cl:in-package pcl_sensor_data-srv)


;//! \htmlinclude StopRecording-request.msg.html

(cl:defclass <StopRecording-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass StopRecording-request (<StopRecording-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopRecording-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopRecording-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<StopRecording-request> is deprecated: use pcl_sensor_data-srv:StopRecording-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <StopRecording-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:req-val is deprecated.  Use pcl_sensor_data-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopRecording-request>) ostream)
  "Serializes a message object of type '<StopRecording-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'req) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopRecording-request>) istream)
  "Deserializes a message object of type '<StopRecording-request>"
    (cl:setf (cl:slot-value msg 'req) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopRecording-request>)))
  "Returns string type for a service object of type '<StopRecording-request>"
  "pcl_sensor_data/StopRecordingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopRecording-request)))
  "Returns string type for a service object of type 'StopRecording-request"
  "pcl_sensor_data/StopRecordingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopRecording-request>)))
  "Returns md5sum for a message object of type '<StopRecording-request>"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopRecording-request)))
  "Returns md5sum for a message object of type 'StopRecording-request"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopRecording-request>)))
  "Returns full string definition for message of type '<StopRecording-request>"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopRecording-request)))
  "Returns full string definition for message of type 'StopRecording-request"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopRecording-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopRecording-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StopRecording-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude StopRecording-response.msg.html

(cl:defclass <StopRecording-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass StopRecording-response (<StopRecording-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StopRecording-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StopRecording-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<StopRecording-response> is deprecated: use pcl_sensor_data-srv:StopRecording-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <StopRecording-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:success-val is deprecated.  Use pcl_sensor_data-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StopRecording-response>) ostream)
  "Serializes a message object of type '<StopRecording-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StopRecording-response>) istream)
  "Deserializes a message object of type '<StopRecording-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StopRecording-response>)))
  "Returns string type for a service object of type '<StopRecording-response>"
  "pcl_sensor_data/StopRecordingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopRecording-response)))
  "Returns string type for a service object of type 'StopRecording-response"
  "pcl_sensor_data/StopRecordingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StopRecording-response>)))
  "Returns md5sum for a message object of type '<StopRecording-response>"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StopRecording-response)))
  "Returns md5sum for a message object of type 'StopRecording-response"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StopRecording-response>)))
  "Returns full string definition for message of type '<StopRecording-response>"
  (cl:format cl:nil "#response~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StopRecording-response)))
  "Returns full string definition for message of type 'StopRecording-response"
  (cl:format cl:nil "#response~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StopRecording-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StopRecording-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StopRecording-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StopRecording)))
  'StopRecording-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StopRecording)))
  'StopRecording-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StopRecording)))
  "Returns string type for a service object of type '<StopRecording>"
  "pcl_sensor_data/StopRecording")