;; Auto-generated. Do not edit!


(when (boundp 'realsense_cam::FindWorkspaceCenter)
  (if (not (find-package "REALSENSE_CAM"))
    (make-package "REALSENSE_CAM"))
  (shadow 'FindWorkspaceCenter (find-package "REALSENSE_CAM")))
(unless (find-package "REALSENSE_CAM::FINDWORKSPACECENTER")
  (make-package "REALSENSE_CAM::FINDWORKSPACECENTER"))
(unless (find-package "REALSENSE_CAM::FINDWORKSPACECENTERREQUEST")
  (make-package "REALSENSE_CAM::FINDWORKSPACECENTERREQUEST"))
(unless (find-package "REALSENSE_CAM::FINDWORKSPACECENTERRESPONSE")
  (make-package "REALSENSE_CAM::FINDWORKSPACECENTERRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass realsense_cam::FindWorkspaceCenterRequest
  :super ros::object
  :slots ())

(defmethod realsense_cam::FindWorkspaceCenterRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass realsense_cam::FindWorkspaceCenterResponse
  :super ros::object
  :slots (_success _point _z_change _x_change ))

(defmethod realsense_cam::FindWorkspaceCenterResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:point __point) (instance geometry_msgs::PointStamped :init))
    ((:z_change __z_change) 0.0)
    ((:x_change __x_change) 0.0)
    )
   (send-super :init)
   (setq _success __success)
   (setq _point __point)
   (setq _z_change (float __z_change))
   (setq _x_change (float __x_change))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:z_change
   (&optional __z_change)
   (if __z_change (setq _z_change __z_change)) _z_change)
  (:x_change
   (&optional __x_change)
   (if __x_change (setq _x_change __x_change)) _x_change)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; geometry_msgs/PointStamped _point
    (send _point :serialization-length)
    ;; float64 _z_change
    8
    ;; float64 _x_change
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/PointStamped _point
       (send _point :serialize s)
     ;; float64 _z_change
       (sys::poke _z_change (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _x_change
       (sys::poke _x_change (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/PointStamped _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;; float64 _z_change
     (setq _z_change (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _x_change
     (setq _x_change (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass realsense_cam::FindWorkspaceCenter
  :super ros::object
  :slots ())

(setf (get realsense_cam::FindWorkspaceCenter :md5sum-) "bd4595b8ce50ecc3768e9c5dc7e441ab")
(setf (get realsense_cam::FindWorkspaceCenter :datatype-) "realsense_cam/FindWorkspaceCenter")
(setf (get realsense_cam::FindWorkspaceCenter :request) realsense_cam::FindWorkspaceCenterRequest)
(setf (get realsense_cam::FindWorkspaceCenter :response) realsense_cam::FindWorkspaceCenterResponse)

(defmethod realsense_cam::FindWorkspaceCenterRequest
  (:response () (instance realsense_cam::FindWorkspaceCenterResponse :init)))

(setf (get realsense_cam::FindWorkspaceCenterRequest :md5sum-) "bd4595b8ce50ecc3768e9c5dc7e441ab")
(setf (get realsense_cam::FindWorkspaceCenterRequest :datatype-) "realsense_cam/FindWorkspaceCenterRequest")
(setf (get realsense_cam::FindWorkspaceCenterRequest :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
# Reason: detail of error if not succeeded.
bool success
geometry_msgs/PointStamped point
float64 z_change
float64 x_change

================================================================================
MSG: geometry_msgs/PointStamped
# This represents a Point with reference coordinate frame and timestamp
Header header
Point point

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")

(setf (get realsense_cam::FindWorkspaceCenterResponse :md5sum-) "bd4595b8ce50ecc3768e9c5dc7e441ab")
(setf (get realsense_cam::FindWorkspaceCenterResponse :datatype-) "realsense_cam/FindWorkspaceCenterResponse")
(setf (get realsense_cam::FindWorkspaceCenterResponse :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
# Reason: detail of error if not succeeded.
bool success
geometry_msgs/PointStamped point
float64 z_change
float64 x_change

================================================================================
MSG: geometry_msgs/PointStamped
# This represents a Point with reference coordinate frame and timestamp
Header header
Point point

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z
")



(provide :realsense_cam/FindWorkspaceCenter "bd4595b8ce50ecc3768e9c5dc7e441ab")


