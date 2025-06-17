; Auto-generated. Do not edit!


(cl:in-package realsense_cam-srv)


;//! \htmlinclude SaveOnePCL-request.msg.html

(cl:defclass <SaveOnePCL-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SaveOnePCL-request (<SaveOnePCL-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveOnePCL-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveOnePCL-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<SaveOnePCL-request> is deprecated: use realsense_cam-srv:SaveOnePCL-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveOnePCL-request>) ostream)
  "Serializes a message object of type '<SaveOnePCL-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveOnePCL-request>) istream)
  "Deserializes a message object of type '<SaveOnePCL-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveOnePCL-request>)))
  "Returns string type for a service object of type '<SaveOnePCL-request>"
  "realsense_cam/SaveOnePCLRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveOnePCL-request)))
  "Returns string type for a service object of type 'SaveOnePCL-request"
  "realsense_cam/SaveOnePCLRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveOnePCL-request>)))
  "Returns md5sum for a message object of type '<SaveOnePCL-request>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveOnePCL-request)))
  "Returns md5sum for a message object of type 'SaveOnePCL-request"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveOnePCL-request>)))
  "Returns full string definition for message of type '<SaveOnePCL-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveOnePCL-request)))
  "Returns full string definition for message of type 'SaveOnePCL-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveOnePCL-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveOnePCL-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveOnePCL-request
))
;//! \htmlinclude SaveOnePCL-response.msg.html

(cl:defclass <SaveOnePCL-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SaveOnePCL-response (<SaveOnePCL-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveOnePCL-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveOnePCL-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<SaveOnePCL-response> is deprecated: use realsense_cam-srv:SaveOnePCL-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SaveOnePCL-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:success-val is deprecated.  Use realsense_cam-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveOnePCL-response>) ostream)
  "Serializes a message object of type '<SaveOnePCL-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveOnePCL-response>) istream)
  "Deserializes a message object of type '<SaveOnePCL-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveOnePCL-response>)))
  "Returns string type for a service object of type '<SaveOnePCL-response>"
  "realsense_cam/SaveOnePCLResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveOnePCL-response)))
  "Returns string type for a service object of type 'SaveOnePCL-response"
  "realsense_cam/SaveOnePCLResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveOnePCL-response>)))
  "Returns md5sum for a message object of type '<SaveOnePCL-response>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveOnePCL-response)))
  "Returns md5sum for a message object of type 'SaveOnePCL-response"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveOnePCL-response>)))
  "Returns full string definition for message of type '<SaveOnePCL-response>"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveOnePCL-response)))
  "Returns full string definition for message of type 'SaveOnePCL-response"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveOnePCL-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveOnePCL-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveOnePCL-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SaveOnePCL)))
  'SaveOnePCL-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SaveOnePCL)))
  'SaveOnePCL-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveOnePCL)))
  "Returns string type for a service object of type '<SaveOnePCL>"
  "realsense_cam/SaveOnePCL")