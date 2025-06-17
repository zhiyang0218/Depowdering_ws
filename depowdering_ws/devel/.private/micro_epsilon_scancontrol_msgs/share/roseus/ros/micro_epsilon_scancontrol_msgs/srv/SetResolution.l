;; Auto-generated. Do not edit!


(when (boundp 'micro_epsilon_scancontrol_msgs::SetResolution)
  (if (not (find-package "MICRO_EPSILON_SCANCONTROL_MSGS"))
    (make-package "MICRO_EPSILON_SCANCONTROL_MSGS"))
  (shadow 'SetResolution (find-package "MICRO_EPSILON_SCANCONTROL_MSGS")))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETRESOLUTION")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETRESOLUTION"))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETRESOLUTIONREQUEST")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETRESOLUTIONREQUEST"))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETRESOLUTIONRESPONSE")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETRESOLUTIONRESPONSE"))

(in-package "ROS")





(defclass micro_epsilon_scancontrol_msgs::SetResolutionRequest
  :super ros::object
  :slots (_resolution ))

(defmethod micro_epsilon_scancontrol_msgs::SetResolutionRequest
  (:init
   (&key
    ((:resolution __resolution) 0)
    )
   (send-super :init)
   (setq _resolution (round __resolution))
   self)
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:serialization-length
   ()
   (+
    ;; uint32 _resolution
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _resolution
       (write-long _resolution s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _resolution
     (setq _resolution (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass micro_epsilon_scancontrol_msgs::SetResolutionResponse
  :super ros::object
  :slots (_return_code ))

(defmethod micro_epsilon_scancontrol_msgs::SetResolutionResponse
  (:init
   (&key
    ((:return_code __return_code) 0)
    )
   (send-super :init)
   (setq _return_code (round __return_code))
   self)
  (:return_code
   (&optional __return_code)
   (if __return_code (setq _return_code __return_code)) _return_code)
  (:serialization-length
   ()
   (+
    ;; int32 _return_code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _return_code
       (write-long _return_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _return_code
     (setq _return_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass micro_epsilon_scancontrol_msgs::SetResolution
  :super ros::object
  :slots ())

(setf (get micro_epsilon_scancontrol_msgs::SetResolution :md5sum-) "31b37757a8d3cae8da33ee6b9ff1b953")
(setf (get micro_epsilon_scancontrol_msgs::SetResolution :datatype-) "micro_epsilon_scancontrol_msgs/SetResolution")
(setf (get micro_epsilon_scancontrol_msgs::SetResolution :request) micro_epsilon_scancontrol_msgs::SetResolutionRequest)
(setf (get micro_epsilon_scancontrol_msgs::SetResolution :response) micro_epsilon_scancontrol_msgs::SetResolutionResponse)

(defmethod micro_epsilon_scancontrol_msgs::SetResolutionRequest
  (:response () (instance micro_epsilon_scancontrol_msgs::SetResolutionResponse :init)))

(setf (get micro_epsilon_scancontrol_msgs::SetResolutionRequest :md5sum-) "31b37757a8d3cae8da33ee6b9ff1b953")
(setf (get micro_epsilon_scancontrol_msgs::SetResolutionRequest :datatype-) "micro_epsilon_scancontrol_msgs/SetResolutionRequest")
(setf (get micro_epsilon_scancontrol_msgs::SetResolutionRequest :definition-)
      "uint32 resolution
---
int32 return_code
")

(setf (get micro_epsilon_scancontrol_msgs::SetResolutionResponse :md5sum-) "31b37757a8d3cae8da33ee6b9ff1b953")
(setf (get micro_epsilon_scancontrol_msgs::SetResolutionResponse :datatype-) "micro_epsilon_scancontrol_msgs/SetResolutionResponse")
(setf (get micro_epsilon_scancontrol_msgs::SetResolutionResponse :definition-)
      "uint32 resolution
---
int32 return_code
")



(provide :micro_epsilon_scancontrol_msgs/SetResolution "31b37757a8d3cae8da33ee6b9ff1b953")


