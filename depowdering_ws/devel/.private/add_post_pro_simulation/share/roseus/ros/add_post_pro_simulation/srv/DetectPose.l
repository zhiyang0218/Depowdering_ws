;; Auto-generated. Do not edit!


(when (boundp 'add_post_pro_simulation::DetectPose)
  (if (not (find-package "ADD_POST_PRO_SIMULATION"))
    (make-package "ADD_POST_PRO_SIMULATION"))
  (shadow 'DetectPose (find-package "ADD_POST_PRO_SIMULATION")))
(unless (find-package "ADD_POST_PRO_SIMULATION::DETECTPOSE")
  (make-package "ADD_POST_PRO_SIMULATION::DETECTPOSE"))
(unless (find-package "ADD_POST_PRO_SIMULATION::DETECTPOSEREQUEST")
  (make-package "ADD_POST_PRO_SIMULATION::DETECTPOSEREQUEST"))
(unless (find-package "ADD_POST_PRO_SIMULATION::DETECTPOSERESPONSE")
  (make-package "ADD_POST_PRO_SIMULATION::DETECTPOSERESPONSE"))

(in-package "ROS")





(defclass add_post_pro_simulation::DetectPoseRequest
  :super ros::object
  :slots (_name ))

(defmethod add_post_pro_simulation::DetectPoseRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass add_post_pro_simulation::DetectPoseResponse
  :super ros::object
  :slots (_x _y _z ))

(defmethod add_post_pro_simulation::DetectPoseResponse
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass add_post_pro_simulation::DetectPose
  :super ros::object
  :slots ())

(setf (get add_post_pro_simulation::DetectPose :md5sum-) "8e24cddccf79ef07983e8ffc3489ed99")
(setf (get add_post_pro_simulation::DetectPose :datatype-) "add_post_pro_simulation/DetectPose")
(setf (get add_post_pro_simulation::DetectPose :request) add_post_pro_simulation::DetectPoseRequest)
(setf (get add_post_pro_simulation::DetectPose :response) add_post_pro_simulation::DetectPoseResponse)

(defmethod add_post_pro_simulation::DetectPoseRequest
  (:response () (instance add_post_pro_simulation::DetectPoseResponse :init)))

(setf (get add_post_pro_simulation::DetectPoseRequest :md5sum-) "8e24cddccf79ef07983e8ffc3489ed99")
(setf (get add_post_pro_simulation::DetectPoseRequest :datatype-) "add_post_pro_simulation/DetectPoseRequest")
(setf (get add_post_pro_simulation::DetectPoseRequest :definition-)
      "string name
---
float64 x
float64 y
float64 z
")

(setf (get add_post_pro_simulation::DetectPoseResponse :md5sum-) "8e24cddccf79ef07983e8ffc3489ed99")
(setf (get add_post_pro_simulation::DetectPoseResponse :datatype-) "add_post_pro_simulation/DetectPoseResponse")
(setf (get add_post_pro_simulation::DetectPoseResponse :definition-)
      "string name
---
float64 x
float64 y
float64 z
")



(provide :add_post_pro_simulation/DetectPose "8e24cddccf79ef07983e8ffc3489ed99")


