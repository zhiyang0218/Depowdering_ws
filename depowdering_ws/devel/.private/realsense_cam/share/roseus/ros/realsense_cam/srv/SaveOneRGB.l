;; Auto-generated. Do not edit!


(when (boundp 'realsense_cam::SaveOneRGB)
  (if (not (find-package "REALSENSE_CAM"))
    (make-package "REALSENSE_CAM"))
  (shadow 'SaveOneRGB (find-package "REALSENSE_CAM")))
(unless (find-package "REALSENSE_CAM::SAVEONERGB")
  (make-package "REALSENSE_CAM::SAVEONERGB"))
(unless (find-package "REALSENSE_CAM::SAVEONERGBREQUEST")
  (make-package "REALSENSE_CAM::SAVEONERGBREQUEST"))
(unless (find-package "REALSENSE_CAM::SAVEONERGBRESPONSE")
  (make-package "REALSENSE_CAM::SAVEONERGBRESPONSE"))

(in-package "ROS")





(defclass realsense_cam::SaveOneRGBRequest
  :super ros::object
  :slots ())

(defmethod realsense_cam::SaveOneRGBRequest
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

(defclass realsense_cam::SaveOneRGBResponse
  :super ros::object
  :slots (_success ))

(defmethod realsense_cam::SaveOneRGBResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass realsense_cam::SaveOneRGB
  :super ros::object
  :slots ())

(setf (get realsense_cam::SaveOneRGB :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get realsense_cam::SaveOneRGB :datatype-) "realsense_cam/SaveOneRGB")
(setf (get realsense_cam::SaveOneRGB :request) realsense_cam::SaveOneRGBRequest)
(setf (get realsense_cam::SaveOneRGB :response) realsense_cam::SaveOneRGBResponse)

(defmethod realsense_cam::SaveOneRGBRequest
  (:response () (instance realsense_cam::SaveOneRGBResponse :init)))

(setf (get realsense_cam::SaveOneRGBRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get realsense_cam::SaveOneRGBRequest :datatype-) "realsense_cam/SaveOneRGBRequest")
(setf (get realsense_cam::SaveOneRGBRequest :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
bool success
")

(setf (get realsense_cam::SaveOneRGBResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get realsense_cam::SaveOneRGBResponse :datatype-) "realsense_cam/SaveOneRGBResponse")
(setf (get realsense_cam::SaveOneRGBResponse :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
bool success
")



(provide :realsense_cam/SaveOneRGB "358e233cde0c8a8bcfea4ce193f8fc15")


