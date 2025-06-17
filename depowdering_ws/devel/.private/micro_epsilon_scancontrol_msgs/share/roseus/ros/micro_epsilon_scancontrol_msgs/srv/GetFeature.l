;; Auto-generated. Do not edit!


(when (boundp 'micro_epsilon_scancontrol_msgs::GetFeature)
  (if (not (find-package "MICRO_EPSILON_SCANCONTROL_MSGS"))
    (make-package "MICRO_EPSILON_SCANCONTROL_MSGS"))
  (shadow 'GetFeature (find-package "MICRO_EPSILON_SCANCONTROL_MSGS")))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETFEATURE")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETFEATURE"))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETFEATUREREQUEST")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETFEATUREREQUEST"))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETFEATURERESPONSE")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETFEATURERESPONSE"))

(in-package "ROS")





(defclass micro_epsilon_scancontrol_msgs::GetFeatureRequest
  :super ros::object
  :slots (_setting ))

(defmethod micro_epsilon_scancontrol_msgs::GetFeatureRequest
  (:init
   (&key
    ((:setting __setting) 0)
    )
   (send-super :init)
   (setq _setting (round __setting))
   self)
  (:setting
   (&optional __setting)
   (if __setting (setq _setting __setting)) _setting)
  (:serialization-length
   ()
   (+
    ;; uint32 _setting
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _setting
       (write-long _setting s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _setting
     (setq _setting (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass micro_epsilon_scancontrol_msgs::GetFeatureResponse
  :super ros::object
  :slots (_value _return_code ))

(defmethod micro_epsilon_scancontrol_msgs::GetFeatureResponse
  (:init
   (&key
    ((:value __value) 0)
    ((:return_code __return_code) 0)
    )
   (send-super :init)
   (setq _value (round __value))
   (setq _return_code (round __return_code))
   self)
  (:value
   (&optional __value)
   (if __value (setq _value __value)) _value)
  (:return_code
   (&optional __return_code)
   (if __return_code (setq _return_code __return_code)) _return_code)
  (:serialization-length
   ()
   (+
    ;; uint32 _value
    4
    ;; int32 _return_code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32 _value
       (write-long _value s)
     ;; int32 _return_code
       (write-long _return_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32 _value
     (setq _value (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _return_code
     (setq _return_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass micro_epsilon_scancontrol_msgs::GetFeature
  :super ros::object
  :slots ())

(setf (get micro_epsilon_scancontrol_msgs::GetFeature :md5sum-) "4a270fe9e59018192da9c039467ff2b9")
(setf (get micro_epsilon_scancontrol_msgs::GetFeature :datatype-) "micro_epsilon_scancontrol_msgs/GetFeature")
(setf (get micro_epsilon_scancontrol_msgs::GetFeature :request) micro_epsilon_scancontrol_msgs::GetFeatureRequest)
(setf (get micro_epsilon_scancontrol_msgs::GetFeature :response) micro_epsilon_scancontrol_msgs::GetFeatureResponse)

(defmethod micro_epsilon_scancontrol_msgs::GetFeatureRequest
  (:response () (instance micro_epsilon_scancontrol_msgs::GetFeatureResponse :init)))

(setf (get micro_epsilon_scancontrol_msgs::GetFeatureRequest :md5sum-) "4a270fe9e59018192da9c039467ff2b9")
(setf (get micro_epsilon_scancontrol_msgs::GetFeatureRequest :datatype-) "micro_epsilon_scancontrol_msgs/GetFeatureRequest")
(setf (get micro_epsilon_scancontrol_msgs::GetFeatureRequest :definition-)
      "uint32 setting
---
uint32 value
int32 return_code
")

(setf (get micro_epsilon_scancontrol_msgs::GetFeatureResponse :md5sum-) "4a270fe9e59018192da9c039467ff2b9")
(setf (get micro_epsilon_scancontrol_msgs::GetFeatureResponse :datatype-) "micro_epsilon_scancontrol_msgs/GetFeatureResponse")
(setf (get micro_epsilon_scancontrol_msgs::GetFeatureResponse :definition-)
      "uint32 setting
---
uint32 value
int32 return_code
")



(provide :micro_epsilon_scancontrol_msgs/GetFeature "4a270fe9e59018192da9c039467ff2b9")


