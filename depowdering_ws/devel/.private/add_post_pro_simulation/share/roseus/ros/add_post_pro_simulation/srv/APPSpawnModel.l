;; Auto-generated. Do not edit!


(when (boundp 'add_post_pro_simulation::APPSpawnModel)
  (if (not (find-package "ADD_POST_PRO_SIMULATION"))
    (make-package "ADD_POST_PRO_SIMULATION"))
  (shadow 'APPSpawnModel (find-package "ADD_POST_PRO_SIMULATION")))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPSPAWNMODEL")
  (make-package "ADD_POST_PRO_SIMULATION::APPSPAWNMODEL"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPSPAWNMODELREQUEST")
  (make-package "ADD_POST_PRO_SIMULATION::APPSPAWNMODELREQUEST"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPSPAWNMODELRESPONSE")
  (make-package "ADD_POST_PRO_SIMULATION::APPSPAWNMODELRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass add_post_pro_simulation::APPSpawnModelRequest
  :super ros::object
  :slots (_model_name _instance_name _turntable _pose _parent_frame ))

(defmethod add_post_pro_simulation::APPSpawnModelRequest
  (:init
   (&key
    ((:model_name __model_name) "")
    ((:instance_name __instance_name) "")
    ((:turntable __turntable) nil)
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:parent_frame __parent_frame) "")
    )
   (send-super :init)
   (setq _model_name (string __model_name))
   (setq _instance_name (string __instance_name))
   (setq _turntable __turntable)
   (setq _pose __pose)
   (setq _parent_frame (string __parent_frame))
   self)
  (:model_name
   (&optional __model_name)
   (if __model_name (setq _model_name __model_name)) _model_name)
  (:instance_name
   (&optional __instance_name)
   (if __instance_name (setq _instance_name __instance_name)) _instance_name)
  (:turntable
   (&optional (__turntable :null))
   (if (not (eq __turntable :null)) (setq _turntable __turntable)) _turntable)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:parent_frame
   (&optional __parent_frame)
   (if __parent_frame (setq _parent_frame __parent_frame)) _parent_frame)
  (:serialization-length
   ()
   (+
    ;; string _model_name
    4 (length _model_name)
    ;; string _instance_name
    4 (length _instance_name)
    ;; bool _turntable
    1
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; string _parent_frame
    4 (length _parent_frame)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _model_name
       (write-long (length _model_name) s) (princ _model_name s)
     ;; string _instance_name
       (write-long (length _instance_name) s) (princ _instance_name s)
     ;; bool _turntable
       (if _turntable (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; string _parent_frame
       (write-long (length _parent_frame) s) (princ _parent_frame s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _model_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _model_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _instance_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _instance_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _turntable
     (setq _turntable (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; string _parent_frame
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _parent_frame (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass add_post_pro_simulation::APPSpawnModelResponse
  :super ros::object
  :slots (_success ))

(defmethod add_post_pro_simulation::APPSpawnModelResponse
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

(defclass add_post_pro_simulation::APPSpawnModel
  :super ros::object
  :slots ())

(setf (get add_post_pro_simulation::APPSpawnModel :md5sum-) "6cdf43566fecf3a5e31bc8aac7b0f400")
(setf (get add_post_pro_simulation::APPSpawnModel :datatype-) "add_post_pro_simulation/APPSpawnModel")
(setf (get add_post_pro_simulation::APPSpawnModel :request) add_post_pro_simulation::APPSpawnModelRequest)
(setf (get add_post_pro_simulation::APPSpawnModel :response) add_post_pro_simulation::APPSpawnModelResponse)

(defmethod add_post_pro_simulation::APPSpawnModelRequest
  (:response () (instance add_post_pro_simulation::APPSpawnModelResponse :init)))

(setf (get add_post_pro_simulation::APPSpawnModelRequest :md5sum-) "6cdf43566fecf3a5e31bc8aac7b0f400")
(setf (get add_post_pro_simulation::APPSpawnModelRequest :datatype-) "add_post_pro_simulation/APPSpawnModelRequest")
(setf (get add_post_pro_simulation::APPSpawnModelRequest :definition-)
      "string model_name
string instance_name
bool turntable
geometry_msgs/Pose pose
string parent_frame

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
")

(setf (get add_post_pro_simulation::APPSpawnModelResponse :md5sum-) "6cdf43566fecf3a5e31bc8aac7b0f400")
(setf (get add_post_pro_simulation::APPSpawnModelResponse :datatype-) "add_post_pro_simulation/APPSpawnModelResponse")
(setf (get add_post_pro_simulation::APPSpawnModelResponse :definition-)
      "string model_name
string instance_name
bool turntable
geometry_msgs/Pose pose
string parent_frame

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
")



(provide :add_post_pro_simulation/APPSpawnModel "6cdf43566fecf3a5e31bc8aac7b0f400")


