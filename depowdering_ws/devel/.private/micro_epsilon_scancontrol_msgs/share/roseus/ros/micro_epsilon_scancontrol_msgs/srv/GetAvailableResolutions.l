;; Auto-generated. Do not edit!


(when (boundp 'micro_epsilon_scancontrol_msgs::GetAvailableResolutions)
  (if (not (find-package "MICRO_EPSILON_SCANCONTROL_MSGS"))
    (make-package "MICRO_EPSILON_SCANCONTROL_MSGS"))
  (shadow 'GetAvailableResolutions (find-package "MICRO_EPSILON_SCANCONTROL_MSGS")))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETAVAILABLERESOLUTIONS")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETAVAILABLERESOLUTIONS"))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETAVAILABLERESOLUTIONSREQUEST")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETAVAILABLERESOLUTIONSREQUEST"))
(unless (find-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETAVAILABLERESOLUTIONSRESPONSE")
  (make-package "MICRO_EPSILON_SCANCONTROL_MSGS::GETAVAILABLERESOLUTIONSRESPONSE"))

(in-package "ROS")





(defclass micro_epsilon_scancontrol_msgs::GetAvailableResolutionsRequest
  :super ros::object
  :slots ())

(defmethod micro_epsilon_scancontrol_msgs::GetAvailableResolutionsRequest
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

(defclass micro_epsilon_scancontrol_msgs::GetAvailableResolutionsResponse
  :super ros::object
  :slots (_resolutions _return_code ))

(defmethod micro_epsilon_scancontrol_msgs::GetAvailableResolutionsResponse
  (:init
   (&key
    ((:resolutions __resolutions) (make-array 0 :initial-element 0 :element-type :integer))
    ((:return_code __return_code) 0)
    )
   (send-super :init)
   (setq _resolutions __resolutions)
   (setq _return_code (round __return_code))
   self)
  (:resolutions
   (&optional __resolutions)
   (if __resolutions (setq _resolutions __resolutions)) _resolutions)
  (:return_code
   (&optional __return_code)
   (if __return_code (setq _return_code __return_code)) _return_code)
  (:serialization-length
   ()
   (+
    ;; uint32[] _resolutions
    (* 4    (length _resolutions)) 4
    ;; int32 _return_code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint32[] _resolutions
     (write-long (length _resolutions) s)
     (dotimes (i (length _resolutions))
       (write-long (elt _resolutions i) s)
       )
     ;; int32 _return_code
       (write-long _return_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint32[] _resolutions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _resolutions (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _resolutions i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32 _return_code
     (setq _return_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass micro_epsilon_scancontrol_msgs::GetAvailableResolutions
  :super ros::object
  :slots ())

(setf (get micro_epsilon_scancontrol_msgs::GetAvailableResolutions :md5sum-) "a603ff8225a17994979733ebf35285f3")
(setf (get micro_epsilon_scancontrol_msgs::GetAvailableResolutions :datatype-) "micro_epsilon_scancontrol_msgs/GetAvailableResolutions")
(setf (get micro_epsilon_scancontrol_msgs::GetAvailableResolutions :request) micro_epsilon_scancontrol_msgs::GetAvailableResolutionsRequest)
(setf (get micro_epsilon_scancontrol_msgs::GetAvailableResolutions :response) micro_epsilon_scancontrol_msgs::GetAvailableResolutionsResponse)

(defmethod micro_epsilon_scancontrol_msgs::GetAvailableResolutionsRequest
  (:response () (instance micro_epsilon_scancontrol_msgs::GetAvailableResolutionsResponse :init)))

(setf (get micro_epsilon_scancontrol_msgs::GetAvailableResolutionsRequest :md5sum-) "a603ff8225a17994979733ebf35285f3")
(setf (get micro_epsilon_scancontrol_msgs::GetAvailableResolutionsRequest :datatype-) "micro_epsilon_scancontrol_msgs/GetAvailableResolutionsRequest")
(setf (get micro_epsilon_scancontrol_msgs::GetAvailableResolutionsRequest :definition-)
      "---
uint32[] resolutions
int32 return_code
")

(setf (get micro_epsilon_scancontrol_msgs::GetAvailableResolutionsResponse :md5sum-) "a603ff8225a17994979733ebf35285f3")
(setf (get micro_epsilon_scancontrol_msgs::GetAvailableResolutionsResponse :datatype-) "micro_epsilon_scancontrol_msgs/GetAvailableResolutionsResponse")
(setf (get micro_epsilon_scancontrol_msgs::GetAvailableResolutionsResponse :definition-)
      "---
uint32[] resolutions
int32 return_code
")



(provide :micro_epsilon_scancontrol_msgs/GetAvailableResolutions "a603ff8225a17994979733ebf35285f3")


