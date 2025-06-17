;; Auto-generated. Do not edit!


(when (boundp 'micro_epsilon_scancontrol_msgs::GetResolution)
  (if (not (find-package "MICRO_EPSILON_SCANCONTROL_MSGS"))
    (make-package "MICRO_EPSILON_SCANCONTROL_MSGS"))
  (shadow 'GetResolution (find-package "MICRO_EPSILON_SCANCONTROL_MSGS")))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETRESOLUTION")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETRESOLUTION"))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETRESOLUTIONREQUEST")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETRESOLUTIONREQUEST"))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETRESOLUTIONRESPONSE")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETRESOLUTIONRESPONSE"))

(in-package "ROS")





(defclass micro_epsilon_scancontrol_msgs::GetResolutionRequest
  :super ros::object
  :slots ())

(defmethod micro_epsilon_scancontrol_msgs::GetResolutionRequest
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

(defclass micro_epsilon_scancontrol_msgs::GetResolutionResponse
  :super ros::object
  :slots (_resolution _return_code ))

(defmethod micro_epsilon_scancontrol_msgs::GetResolutionResponse
  (:init
   (&key
    ((:resolution __resolution) 0)
    ((:return_code __return_code) 0)
    )
   (send-super :init)
   (setq _resolution (round __resolution))
   (setq _return_code (round __return_code))
   self)
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:return_code
   (&optional __return_code)
   (if __return_code (setq _return_code __return_code)) _return_code)
  (:serialization-length
   ()
   (+
    ;; uint32 _resolution
    4
    ;; int32 _return_code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _resolution
       (write-long _resolution s)
     ;; int32 _return_code
       (write-long _return_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _resolution
     (setq _resolution (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _return_code
     (setq _return_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass micro_epsilon_scancontrol_msgs::GetResolution
  :super ros::object
  :slots ())

(setf (get micro_epsilon_scancontrol_msgs::GetResolution :md5sum-) "b29e2945c59c53f7e032bc7769074912")
(setf (get micro_epsilon_scancontrol_msgs::GetResolution :datatype-) "micro_epsilon_scancontrol_msgs/GetResolution")
(setf (get micro_epsilon_scancontrol_msgs::GetResolution :request) micro_epsilon_scancontrol_msgs::GetResolutionRequest)
(setf (get micro_epsilon_scancontrol_msgs::GetResolution :response) micro_epsilon_scancontrol_msgs::GetResolutionResponse)

(defmethod micro_epsilon_scancontrol_msgs::GetResolutionRequest
  (:response () (instance micro_epsilon_scancontrol_msgs::GetResolutionResponse :init)))

(setf (get micro_epsilon_scancontrol_msgs::GetResolutionRequest :md5sum-) "b29e2945c59c53f7e032bc7769074912")
(setf (get micro_epsilon_scancontrol_msgs::GetResolutionRequest :datatype-) "micro_epsilon_scancontrol_msgs/GetResolutionRequest")
(setf (get micro_epsilon_scancontrol_msgs::GetResolutionRequest :definition-)
      "---
uint32 resolution
int32 return_code
")

(setf (get micro_epsilon_scancontrol_msgs::GetResolutionResponse :md5sum-) "b29e2945c59c53f7e032bc7769074912")
(setf (get micro_epsilon_scancontrol_msgs::GetResolutionResponse :datatype-) "micro_epsilon_scancontrol_msgs/GetResolutionResponse")
(setf (get micro_epsilon_scancontrol_msgs::GetResolutionResponse :definition-)
      "---
uint32 resolution
int32 return_code
")



(provide :micro_epsilon_scancontrol_msgs/GetResolution "b29e2945c59c53f7e032bc7769074912")


