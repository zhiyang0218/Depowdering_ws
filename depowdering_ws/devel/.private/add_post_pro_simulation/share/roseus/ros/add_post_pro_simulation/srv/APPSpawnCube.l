;; Auto-generated. Do not edit!


(when (boundp 'add_post_pro_simulation::APPSpawnCube)
  (if (not (find-package "ADD_POST_PRO_SIMULATION"))
    (make-package "ADD_POST_PRO_SIMULATION"))
  (shadow 'APPSpawnCube (find-package "ADD_POST_PRO_SIMULATION")))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPSPAWNCUBE")
  (make-package "ADD_POST_PRO_SIMULATION::APPSPAWNCUBE"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPSPAWNCUBEREQUEST")
  (make-package "ADD_POST_PRO_SIMULATION::APPSPAWNCUBEREQUEST"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPSPAWNCUBERESPONSE")
  (make-package "ADD_POST_PRO_SIMULATION::APPSPAWNCUBERESPONSE"))

(in-package "ROS")





(defclass add_post_pro_simulation::APPSpawnCubeRequest
  :super ros::object
  :slots ())

(defmethod add_post_pro_simulation::APPSpawnCubeRequest
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

(defclass add_post_pro_simulation::APPSpawnCubeResponse
  :super ros::object
  :slots (_success ))

(defmethod add_post_pro_simulation::APPSpawnCubeResponse
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

(defclass add_post_pro_simulation::APPSpawnCube
  :super ros::object
  :slots ())

(setf (get add_post_pro_simulation::APPSpawnCube :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get add_post_pro_simulation::APPSpawnCube :datatype-) "add_post_pro_simulation/APPSpawnCube")
(setf (get add_post_pro_simulation::APPSpawnCube :request) add_post_pro_simulation::APPSpawnCubeRequest)
(setf (get add_post_pro_simulation::APPSpawnCube :response) add_post_pro_simulation::APPSpawnCubeResponse)

(defmethod add_post_pro_simulation::APPSpawnCubeRequest
  (:response () (instance add_post_pro_simulation::APPSpawnCubeResponse :init)))

(setf (get add_post_pro_simulation::APPSpawnCubeRequest :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get add_post_pro_simulation::APPSpawnCubeRequest :datatype-) "add_post_pro_simulation/APPSpawnCubeRequest")
(setf (get add_post_pro_simulation::APPSpawnCubeRequest :definition-)
      "---
bool success
")

(setf (get add_post_pro_simulation::APPSpawnCubeResponse :md5sum-) "358e233cde0c8a8bcfea4ce193f8fc15")
(setf (get add_post_pro_simulation::APPSpawnCubeResponse :datatype-) "add_post_pro_simulation/APPSpawnCubeResponse")
(setf (get add_post_pro_simulation::APPSpawnCubeResponse :definition-)
      "---
bool success
")



(provide :add_post_pro_simulation/APPSpawnCube "358e233cde0c8a8bcfea4ce193f8fc15")


