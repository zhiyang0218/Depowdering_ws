; Auto-generated. Do not edit!


(cl:in-package pcl_sensor_data-srv)


;//! \htmlinclude StartRecording-request.msg.html

(cl:defclass <StartRecording-request> (roslisp-msg-protocol:ros-message)
  ((req
    :reader req
    :initarg :req
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass StartRecording-request (<StartRecording-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartRecording-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartRecording-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<StartRecording-request> is deprecated: use pcl_sensor_data-srv:StartRecording-request instead.")))

(cl:ensure-generic-function 'req-val :lambda-list '(m))
(cl:defmethod req-val ((m <StartRecording-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:req-val is deprecated.  Use pcl_sensor_data-srv:req instead.")
  (req m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartRecording-request>) ostream)
  "Serializes a message object of type '<StartRecording-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'req) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartRecording-request>) istream)
  "Deserializes a message object of type '<StartRecording-request>"
    (cl:setf (cl:slot-value msg 'req) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartRecording-request>)))
  "Returns string type for a service object of type '<StartRecording-request>"
  "pcl_sensor_data/StartRecordingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartRecording-request)))
  "Returns string type for a service object of type 'StartRecording-request"
  "pcl_sensor_data/StartRecordingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartRecording-request>)))
  "Returns md5sum for a message object of type '<StartRecording-request>"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartRecording-request)))
  "Returns md5sum for a message object of type 'StartRecording-request"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartRecording-request>)))
  "Returns full string definition for message of type '<StartRecording-request>"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartRecording-request)))
  "Returns full string definition for message of type 'StartRecording-request"
  (cl:format cl:nil "#request~%bool req~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartRecording-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartRecording-request>))
  "Converts a ROS message object to a list"
  (cl:list 'StartRecording-request
    (cl:cons ':req (req msg))
))
;//! \htmlinclude StartRecording-response.msg.html

(cl:defclass <StartRecording-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass StartRecording-response (<StartRecording-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StartRecording-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StartRecording-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pcl_sensor_data-srv:<StartRecording-response> is deprecated: use pcl_sensor_data-srv:StartRecording-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <StartRecording-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pcl_sensor_data-srv:success-val is deprecated.  Use pcl_sensor_data-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StartRecording-response>) ostream)
  "Serializes a message object of type '<StartRecording-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StartRecording-response>) istream)
  "Deserializes a message object of type '<StartRecording-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StartRecording-response>)))
  "Returns string type for a service object of type '<StartRecording-response>"
  "pcl_sensor_data/StartRecordingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartRecording-response)))
  "Returns string type for a service object of type 'StartRecording-response"
  "pcl_sensor_data/StartRecordingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StartRecording-response>)))
  "Returns md5sum for a message object of type '<StartRecording-response>"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StartRecording-response)))
  "Returns md5sum for a message object of type 'StartRecording-response"
  "e188e0aaebb633ed14c21333921ef038")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StartRecording-response>)))
  "Returns full string definition for message of type '<StartRecording-response>"
  (cl:format cl:nil "#response~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StartRecording-response)))
  "Returns full string definition for message of type 'StartRecording-response"
  (cl:format cl:nil "#response~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StartRecording-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StartRecording-response>))
  "Converts a ROS message object to a list"
  (cl:list 'StartRecording-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'StartRecording)))
  'StartRecording-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'StartRecording)))
  'StartRecording-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StartRecording)))
  "Returns string type for a service object of type '<StartRecording>"
  "pcl_sensor_data/StartRecording")