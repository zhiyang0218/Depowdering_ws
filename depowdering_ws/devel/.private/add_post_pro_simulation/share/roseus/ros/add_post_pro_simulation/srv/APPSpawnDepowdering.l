;; Auto-generated. Do not edit!


(when (boundp 'add_post_pro_simulation::APPSpawnDepowdering)
  (if (not (find-package "ADD_POST_PRO_SIMULATION"))
    (make-package "ADD_POST_PRO_SIMULATION"))
  (shadow 'APPSpawnDepowdering (find-package "ADD_POST_PRO_SIMULATION")))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPSPAWNDEPOWDERING")
  (make-package "ADD_POST_PRO_SIMULATION::APPSPAWNDEPOWDERING"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPSPAWNDEPOWDERINGREQUEST")
  (make-package "ADD_POST_PRO_SIMULATION::APPSPAWNDEPOWDERINGREQUEST"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPSPAWNDEPOWDERINGRESPONSE")
  (make-package "ADD_POST_PRO_SIMULATION::APPSPAWNDEPOWDERINGRESPONSE"))

(in-package "ROS")





(defclass add_post_pro_simulation::APPSpawnDepowderingRequest
  :super ros::object
  :slots ())

(defmethod add_post_pro_simulation::APPSpawnDepowderingRequest
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

(defclass add_post_pro_simulation::APPSpawnDepowderingResponse
  :super ros::object
  :slots (_success ))

(defmethod add_post_pro_simulation::APPSpawnDepowderingResponse
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

(defclass add_post_pro_simulation::APPSpawnDepowdering
  :super ros::object
  :slots ())

(setf (get add_post_pro_simulation::APPSpawnDepowdering :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get add_post_pro_simulation::APPSpawnDepowdering :datatype-) "add_post_pro_simulation/APPSpawnDepowdering")
(setf (get add_post_pro_simulation::APPSpawnDepowdering :request) add_post_pro_simulation::APPSpawnDepowderingRequest)
(setf (get add_post_pro_simulation::APPSpawnDepowdering :response) add_post_pro_simulation::APPSpawnDepowderingResponse)

(defmethod add_post_pro_simulation::APPSpawnDepowderingRequest
  (:response () (instance add_post_pro_simulation::APPSpawnDepowderingResponse :init)))

(setf (get add_post_pro_simulation::APPSpawnDepowderingRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get add_post_pro_simulation::APPSpawnDepowderingRequest :datatype-) "add_post_pro_simulation/APPSpawnDepowderingRequest")
(setf (get add_post_pro_simulation::APPSpawnDepowderingRequest :definition-)
      "---
bool success
")

(setf (get add_post_pro_simulation::APPSpawnDepowderingResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get add_post_pro_simulation::APPSpawnDepowderingResponse :datatype-) "add_post_pro_simulation/APPSpawnDepowderingResponse")
(setf (get add_post_pro_simulation::APPSpawnDepowderingResponse :definition-)
      "---
bool success
")



(provide :add_post_pro_simulation/APPSpawnDepowdering "358e233cde0c8a8bcfea4ce193f8fc15")


