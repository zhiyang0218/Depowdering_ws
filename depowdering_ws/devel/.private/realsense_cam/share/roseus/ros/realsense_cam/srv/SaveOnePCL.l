;; Auto-generated. Do not edit!


(when (boundp 'realsense_cam::SaveOnePCL)
  (if (not (find-package "REALSENSE_CAM"))
    (make-package "REALSENSE_CAM"))
  (shadow 'SaveOnePCL (find-package "REALSENSE_CAM")))
(unless (find-package "REALSENSE_CAM::SAVEONEPCL")
  (make-package "REALSENSE_CAM::SAVEONEPCL"))
(unless (find-package "REALSENSE_CAM::SAVEONEPCLREQUEST")
  (make-package "REALSENSE_CAM::SAVEONEPCLREQUEST"))
(unless (find-package "REALSENSE_CAM::SAVEONEPCLRESPONSE")
  (make-package "REALSENSE_CAM::SAVEONEPCLRESPONSE"))

(in-package "ROS")





(defclass realsense_cam::SaveOnePCLRequest
  :super ros::object
  :slots ())

(defmethod realsense_cam::SaveOnePCLRequest
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

(defclass realsense_cam::SaveOnePCLResponse
  :super ros::object
  :slots (_success ))

(defmethod realsense_cam::SaveOnePCLResponse
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

(defclass realsense_cam::SaveOnePCL
  :super ros::object
  :slots ())

(setf (get realsense_cam::SaveOnePCL :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get realsense_cam::SaveOnePCL :datatype-) "realsense_cam/SaveOnePCL")
(setf (get realsense_cam::SaveOnePCL :request) realsense_cam::SaveOnePCLRequest)
(setf (get realsense_cam::SaveOnePCL :response) realsense_cam::SaveOnePCLResponse)

(defmethod realsense_cam::SaveOnePCLRequest
  (:response () (instance realsense_cam::SaveOnePCLResponse :init)))

(setf (get realsense_cam::SaveOnePCLRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get realsense_cam::SaveOnePCLRequest :datatype-) "realsense_cam/SaveOnePCLRequest")
(setf (get realsense_cam::SaveOnePCLRequest :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
bool success
")

(setf (get realsense_cam::SaveOnePCLResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get realsense_cam::SaveOnePCLResponse :datatype-) "realsense_cam/SaveOnePCLResponse")
(setf (get realsense_cam::SaveOnePCLResponse :definition-)
      "---
# Success: TRUE if frame is successfully delivered.
bool success
")



(provide :realsense_cam/SaveOnePCL "358e233cde0c8a8bcfea4ce193f8fc15")


