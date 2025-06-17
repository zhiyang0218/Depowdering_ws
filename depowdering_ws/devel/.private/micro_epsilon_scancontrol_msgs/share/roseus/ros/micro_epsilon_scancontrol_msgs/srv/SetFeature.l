;; Auto-generated. Do not edit!


(when (boundp 'micro_epsilon_scancontrol_msgs::SetFeature)
  (if (not (find-package "MICRO_EPSILON_SCANCONTROL_MSGS"))
    (make-package "MICRO_EPSILON_SCANCONTROL_MSGS"))
  (shadow 'SetFeature (find-package "MICRO_EPSILON_SCANCONTROL_MSGS")))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETFEATURE")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETFEATURE"))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETFEATUREREQUEST")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETFEATUREREQUEST"))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETFEATURERESPONSE")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::SETFEATURERESPONSE"))

(in-package "ROS")





(defclass micro_epsilon_scancontrol_msgs::SetFeatureRequest
  :super ros::object
  :slots (_setting _value ))

(defmethod micro_epsilon_scancontrol_msgs::SetFeatureRequest
  (:init
   (&key
    ((:setting __setting) 0)
    ((:value __value) 0)
    )
   (send-super :init)
   (setq _setting (round __setting))
   (setq _value (round __value))
   self)
  (:setting
   (&optional __setting)
   (if __setting (setq _setting __setting)) _setting)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:serialization-length
   ()
   (+
    ;; uint32 _setting
    4
    ;; uint32 _value
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _setting
       (write-long _setting s)
     ;; uint32 _value
       (write-long _value s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _setting
     (setq _setting (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; uint32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass micro_epsilon_scancontrol_msgs::SetFeatureResponse
  :super ros::object
  :slots (_return_code ))

(defmethod micro_epsilon_scancontrol_msgs::SetFeatureResponse
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

(defclass micro_epsilon_scancontrol_msgs::SetFeature
  :super ros::object
  :slots ())

(setf (get micro_epsilon_scancontrol_msgs::SetFeature :md5sum-) "b6319c48811935bafcd8759d2c550c8f")
(setf (get micro_epsilon_scancontrol_msgs::SetFeature :datatype-) "micro_epsilon_scancontrol_msgs/SetFeature")
(setf (get micro_epsilon_scancontrol_msgs::SetFeature :request) micro_epsilon_scancontrol_msgs::SetFeatureRequest)
(setf (get micro_epsilon_scancontrol_msgs::SetFeature :response) micro_epsilon_scancontrol_msgs::SetFeatureResponse)

(defmethod micro_epsilon_scancontrol_msgs::SetFeatureRequest
  (:response () (instance micro_epsilon_scancontrol_msgs::SetFeatureResponse :init)))

(setf (get micro_epsilon_scancontrol_msgs::SetFeatureRequest :md5sum-) "b6319c48811935bafcd8759d2c550c8f")
(setf (get micro_epsilon_scancontrol_msgs::SetFeatureRequest :datatype-) "micro_epsilon_scancontrol_msgs/SetFeatureRequest")
(setf (get micro_epsilon_scancontrol_msgs::SetFeatureRequest :definition-)
      "uint32 setting
uint32 value
---
int32 return_code
")

(setf (get micro_epsilon_scancontrol_msgs::SetFeatureResponse :md5sum-) "b6319c48811935bafcd8759d2c550c8f")
(setf (get micro_epsilon_scancontrol_msgs::SetFeatureResponse :datatype-) "micro_epsilon_scancontrol_msgs/SetFeatureResponse")
(setf (get micro_epsilon_scancontrol_msgs::SetFeatureResponse :definition-)
      "uint32 setting
uint32 value
---
int32 return_code
")



(provide :micro_epsilon_scancontrol_msgs/SetFeature "b6319c48811935bafcd8759d2c550c8f")


