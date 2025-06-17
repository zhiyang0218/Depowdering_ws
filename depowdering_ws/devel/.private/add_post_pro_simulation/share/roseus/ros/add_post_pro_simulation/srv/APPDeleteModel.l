;; Auto-generated. Do not edit!


(when (boundp 'add_post_pro_simulation::APPDeleteModel)
  (if (not (find-package "ADD_POST_PRO_SIMULATION"))
    (make-package "ADD_POST_PRO_SIMULATION"))
  (shadow 'APPDeleteModel (find-package "ADD_POST_PRO_SIMULATION")))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPDELETEMODEL")
  (make-package "ADD_POST_PRO_SIMULATION::APPDELETEMODEL"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPDELETEMODELREQUEST")
  (make-package "ADD_POST_PRO_SIMULATION::APPDELETEMODELREQUEST"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPDELETEMODELRESPONSE")
  (make-package "ADD_POST_PRO_SIMULATION::APPDELETEMODELRESPONSE"))

(in-package "ROS")





(defclass add_post_pro_simulation::APPDeleteModelRequest
  :super ros::object
  :slots (_instance_name ))

(defmethod add_post_pro_simulation::APPDeleteModelRequest
  (:init
   (&key
    ((:instance_name __instance_name) "")
    )
   (send-super :init)
   (setq _instance_name (string __instance_name))
   self)
  (:instance_name
   (&optional __instance_name)
   (if __instance_name (setq _instance_name __instance_name)) _instance_name)
  (:serialization-length
   ()
   (+
    ;; string _instance_name
    4 (length _instance_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _instance_name
       (write-long (length _instance_name) s) (princ _instance_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _instance_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _instance_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass add_post_pro_simulation::APPDeleteModelResponse
  :super ros::object
  :slots (_success ))

(defmethod add_post_pro_simulation::APPDeleteModelResponse
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

(defclass add_post_pro_simulation::APPDeleteModel
  :super ros::object
  :slots ())

(setf (get add_post_pro_simulation::APPDeleteModel :md5sum-) "dd7ff374ac75c6b3ba8044c8720cd572")
(setf (get add_post_pro_simulation::APPDeleteModel :datatype-) "add_post_pro_simulation/APPDeleteModel")
(setf (get add_post_pro_simulation::APPDeleteModel :request) add_post_pro_simulation::APPDeleteModelRequest)
(setf (get add_post_pro_simulation::APPDeleteModel :response) add_post_pro_simulation::APPDeleteModelResponse)

(defmethod add_post_pro_simulation::APPDeleteModelRequest
  (:response () (instance add_post_pro_simulation::APPDeleteModelResponse :init)))

(setf (get add_post_pro_simulation::APPDeleteModelRequest :md5sum-) "dd7ff374ac75c6b3ba8044c8720cd572")
(setf (get add_post_pro_simulation::APPDeleteModelRequest :datatype-) "add_post_pro_simulation/APPDeleteModelRequest")
(setf (get add_post_pro_simulation::APPDeleteModelRequest :definition-)
      "string instance_name
---
bool success
")

(setf (get add_post_pro_simulation::APPDeleteModelResponse :md5sum-) "dd7ff374ac75c6b3ba8044c8720cd572")
(setf (get add_post_pro_simulation::APPDeleteModelResponse :datatype-) "add_post_pro_simulation/APPDeleteModelResponse")
(setf (get add_post_pro_simulation::APPDeleteModelResponse :definition-)
      "string instance_name
---
bool success
")



(provide :add_post_pro_simulation/APPDeleteModel "dd7ff374ac75c6b3ba8044c8720cd572")


