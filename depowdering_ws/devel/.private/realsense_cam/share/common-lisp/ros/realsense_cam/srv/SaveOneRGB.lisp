; Auto-generated. Do not edit!


(cl:in-package realsense_cam-srv)


;//! \htmlinclude SaveOneRGB-request.msg.html

(cl:defclass <SaveOneRGB-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass SaveOneRGB-request (<SaveOneRGB-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveOneRGB-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveOneRGB-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<SaveOneRGB-request> is deprecated: use realsense_cam-srv:SaveOneRGB-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveOneRGB-request>) ostream)
  "Serializes a message object of type '<SaveOneRGB-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveOneRGB-request>) istream)
  "Deserializes a message object of type '<SaveOneRGB-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveOneRGB-request>)))
  "Returns string type for a service object of type '<SaveOneRGB-request>"
  "realsense_cam/SaveOneRGBRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveOneRGB-request)))
  "Returns string type for a service object of type 'SaveOneRGB-request"
  "realsense_cam/SaveOneRGBRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveOneRGB-request>)))
  "Returns md5sum for a message object of type '<SaveOneRGB-request>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveOneRGB-request)))
  "Returns md5sum for a message object of type 'SaveOneRGB-request"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveOneRGB-request>)))
  "Returns full string definition for message of type '<SaveOneRGB-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveOneRGB-request)))
  "Returns full string definition for message of type 'SaveOneRGB-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveOneRGB-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveOneRGB-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveOneRGB-request
))
;//! \htmlinclude SaveOneRGB-response.msg.html

(cl:defclass <SaveOneRGB-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SaveOneRGB-response (<SaveOneRGB-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SaveOneRGB-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SaveOneRGB-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name realsense_cam-srv:<SaveOneRGB-response> is deprecated: use realsense_cam-srv:SaveOneRGB-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SaveOneRGB-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader realsense_cam-srv:success-val is deprecated.  Use realsense_cam-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SaveOneRGB-response>) ostream)
  "Serializes a message object of type '<SaveOneRGB-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SaveOneRGB-response>) istream)
  "Deserializes a message object of type '<SaveOneRGB-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SaveOneRGB-response>)))
  "Returns string type for a service object of type '<SaveOneRGB-response>"
  "realsense_cam/SaveOneRGBResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveOneRGB-response)))
  "Returns string type for a service object of type 'SaveOneRGB-response"
  "realsense_cam/SaveOneRGBResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SaveOneRGB-response>)))
  "Returns md5sum for a message object of type '<SaveOneRGB-response>"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SaveOneRGB-response)))
  "Returns md5sum for a message object of type 'SaveOneRGB-response"
  "358e233cde0c8a8bcfea4ce193f8fc15")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SaveOneRGB-response>)))
  "Returns full string definition for message of type '<SaveOneRGB-response>"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SaveOneRGB-response)))
  "Returns full string definition for message of type 'SaveOneRGB-response"
  (cl:format cl:nil "# Success: TRUE if frame is successfully delivered.~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SaveOneRGB-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SaveOneRGB-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SaveOneRGB-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SaveOneRGB)))
  'SaveOneRGB-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SaveOneRGB)))
  'SaveOneRGB-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SaveOneRGB)))
  "Returns string type for a service object of type '<SaveOneRGB>"
  "realsense_cam/SaveOneRGB")