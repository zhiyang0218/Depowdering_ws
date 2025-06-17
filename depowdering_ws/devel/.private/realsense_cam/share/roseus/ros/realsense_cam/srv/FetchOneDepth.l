;; Auto-generated. Do not edit!


(when (boundp 'realsense_cam::FetchOneDepth)
  (if (not (find-package "REALSENSE_CAM"))
    (make-package "REALSENSE_CAM"))
  (shadow 'FetchOneDepth (find-package "REALSENSE_CAM")))
(unless (find-package "REALSENSE_CAM::FETCHONEDEPTH")
  (make-package "REALSENSE_CAM::FETCHONEDEPTH"))
(unless (find-package "REALSENSE_CAM::FETCHONEDEPTHREQUEST")
  (make-package "REALSENSE_CAM::FETCHONEDEPTHREQUEST"))
(unless (find-package "REALSENSE_CAM::FETCHONEDEPTHRESPONSE")
  (make-package "REALSENSE_CAM::FETCHONEDEPTHRESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass realsense_cam::FetchOneDepthRequest
  :super ros::object
  :slots ())

(defmethod realsense_cam::FetchOneDepthRequest
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

(defclass realsense_cam::FetchOneDepthResponse
  :super ros::object
  :slots (_success _reason _depth ))

(defmethod realsense_cam::FetchOneDepthResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:reason __reason) "")
    ((:depth __depth) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _success __success)
   (setq _reason (string __reason))
   (setq _depth __depth)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:reason
   (&optional __reason)
   (if __reason (setq _reason __reason)) _reason)
  (:depth
   (&rest __depth)
   (if (keywordp (car __depth))
       (send* _depth __depth)
     (progn
       (if __depth (setq _depth (car __depth)))
       _depth)))
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _reason
    4 (length _reason)
    ;; sensor_msgs/Image _depth
    (send _depth :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _reason
       (write-long (length _reason) s) (princ _reason s)
     ;; sensor_msgs/Image _depth
       (send _depth :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _reason
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _reason (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; sensor_msgs/Image _depth
     (send _depth :deserialize buf ptr-) (incf ptr- (send _depth :serialization-length))
   ;;
   self)
  )

(defclass realsense_cam::FetchOneDepth
  :super ros::object
  :slots ())

(setf (get realsense_cam::FetchOneDepth :md5sum-) "8f1bfbb7170049fa0e75d292e4ff7bed")
(setf (get realsense_cam::FetchOneDepth :datatype-) "realsense_cam/FetchOneDepth")
(setf (get realsense_cam::FetchOneDepth :request) realsense_cam::FetchOneDepthRequest)
(setf (get realsense_cam::FetchOneDepth :response) realsense_cam::FetchOneDepthResponse)

(defmethod realsense_cam::FetchOneDepthRequest
  (:response () (instance realsense_cam::FetchOneDepthResponse :init)))

(setf (get realsense_cam::FetchOneDepthRequest :md5sum-) "8f1bfbb7170049fa0e75d292e4ff7bed")
(setf (get realsense_cam::FetchOneDepthRequest :datatype-) "realsense_cam/FetchOneDepthRequest")
(setf (get realsense_cam::FetchOneDepthRequest :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
# Reason: detail of error if not succeeded.
bool success
string reason
sensor_msgs/Image depth

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

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
")

(setf (get realsense_cam::FetchOneDepthResponse :md5sum-) "8f1bfbb7170049fa0e75d292e4ff7bed")
(setf (get realsense_cam::FetchOneDepthResponse :datatype-) "realsense_cam/FetchOneDepthResponse")
(setf (get realsense_cam::FetchOneDepthResponse :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
# Reason: detail of error if not succeeded.
bool success
string reason
sensor_msgs/Image depth

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

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
")



(provide :realsense_cam/FetchOneDepth "8f1bfbb7170049fa0e75d292e4ff7bed")


