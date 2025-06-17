;; Auto-generated. Do not edit!


(when (boundp 'realsense_cam::FetchOneRGB)
  (if (not (find-package "REALSENSE_CAM"))
    (make-package "REALSENSE_CAM"))
  (shadow 'FetchOneRGB (find-package "REALSENSE_CAM")))
(unless (find-package "REALSENSE_CAM::FETCHONERGB")
  (make-package "REALSENSE_CAM::FETCHONERGB"))
(unless (find-package "REALSENSE_CAM::FETCHONERGBREQUEST")
  (make-package "REALSENSE_CAM::FETCHONERGBREQUEST"))
(unless (find-package "REALSENSE_CAM::FETCHONERGBRESPONSE")
  (make-package "REALSENSE_CAM::FETCHONERGBRESPONSE"))

(in-package "ROS")



(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass realsense_cam::FetchOneRGBRequest
  :super ros::object
  :slots ())

(defmethod realsense_cam::FetchOneRGBRequest
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

(defclass realsense_cam::FetchOneRGBResponse
  :super ros::object
  :slots (_success _reason _rgb ))

(defmethod realsense_cam::FetchOneRGBResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:reason __reason) "")
    ((:rgb __rgb) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _success __success)
   (setq _reason (string __reason))
   (setq _rgb __rgb)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:reason
   (&optional __reason)
   (if __reason (setq _reason __reason)) _reason)
  (:rgb
   (&rest __rgb)
   (if (keywordp (car __rgb))
       (send* _rgb __rgb)
     (progn
       (if __rgb (setq _rgb (car __rgb)))
       _rgb)))
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _reason
    4 (length _reason)
    ;; sensor_msgs/Image _rgb
    (send _rgb :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _reason
       (write-long (length _reason) s) (princ _reason s)
     ;; sensor_msgs/Image _rgb
       (send _rgb :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _reason
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _reason (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; sensor_msgs/Image _rgb
     (send _rgb :deserialize buf ptr-) (incf ptr- (send _rgb :serialization-length))
   ;;
   self)
  )

(defclass realsense_cam::FetchOneRGB
  :super ros::object
  :slots ())

(setf (get realsense_cam::FetchOneRGB :md5sum-) "ccd168e371de7ed9bbb3078068a6b679")
(setf (get realsense_cam::FetchOneRGB :datatype-) "realsense_cam/FetchOneRGB")
(setf (get realsense_cam::FetchOneRGB :request) realsense_cam::FetchOneRGBRequest)
(setf (get realsense_cam::FetchOneRGB :response) realsense_cam::FetchOneRGBResponse)

(defmethod realsense_cam::FetchOneRGBRequest
  (:response () (instance realsense_cam::FetchOneRGBResponse :init)))

(setf (get realsense_cam::FetchOneRGBRequest :md5sum-) "ccd168e371de7ed9bbb3078068a6b679")
(setf (get realsense_cam::FetchOneRGBRequest :datatype-) "realsense_cam/FetchOneRGBRequest")
(setf (get realsense_cam::FetchOneRGBRequest :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
# Reason: detail of error if not succeeded.
bool success
string reason
sensor_msgs/Image rgb

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

(setf (get realsense_cam::FetchOneRGBResponse :md5sum-) "ccd168e371de7ed9bbb3078068a6b679")
(setf (get realsense_cam::FetchOneRGBResponse :datatype-) "realsense_cam/FetchOneRGBResponse")
(setf (get realsense_cam::FetchOneRGBResponse :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
# Reason: detail of error if not succeeded.
bool success
string reason
sensor_msgs/Image rgb

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



(provide :realsense_cam/FetchOneRGB "ccd168e371de7ed9bbb3078068a6b679")


