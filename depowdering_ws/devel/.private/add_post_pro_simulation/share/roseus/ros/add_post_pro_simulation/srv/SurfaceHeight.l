;; Auto-generated. Do not edit!


(when (boundp 'add_post_pro_simulation::SurfaceHeight)
  (if (not (find-package "ADD_POST_PRO_SIMULATION"))
    (make-package "ADD_POST_PRO_SIMULATION"))
  (shadow 'SurfaceHeight (find-package "ADD_POST_PRO_SIMULATION")))
(unless (find-package "ADD_POST_PRO_SIMULATION::SURFACEHEIGHT")
  (make-package "ADD_POST_PRO_SIMULATION::SURFACEHEIGHT"))
(unless (find-package "ADD_POST_PRO_SIMULATION::SURFACEHEIGHTREQUEST")
  (make-package "ADD_POST_PRO_SIMULATION::SURFACEHEIGHTREQUEST"))
(unless (find-package "ADD_POST_PRO_SIMULATION::SURFACEHEIGHTRESPONSE")
  (make-package "ADD_POST_PRO_SIMULATION::SURFACEHEIGHTRESPONSE"))

(in-package "ROS")





(defclass add_post_pro_simulation::SurfaceHeightRequest
  :super ros::object
  :slots (_z_delta ))

(defmethod add_post_pro_simulation::SurfaceHeightRequest
  (:init
   (&key
    ((:z_delta __z_delta) 0.0)
    )
   (send-super :init)
   (setq _z_delta (float __z_delta))
   self)
  (:z_delta
   (&optional __z_delta)
   (if __z_delta (setq _z_delta __z_delta)) _z_delta)
  (:serialization-length
   ()
   (+
    ;; float32 _z_delta
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _z_delta
       (sys::poke _z_delta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _z_delta
     (setq _z_delta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass add_post_pro_simulation::SurfaceHeightResponse
  :super ros::object
  :slots (_success ))

(defmethod add_post_pro_simulation::SurfaceHeightResponse
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

(defclass add_post_pro_simulation::SurfaceHeight
  :super ros::object
  :slots ())

(setf (get add_post_pro_simulation::SurfaceHeight :md5sum-) "84a8867fc8ccf3b6b9067181a42e5ae9")
(setf (get add_post_pro_simulation::SurfaceHeight :datatype-) "add_post_pro_simulation/SurfaceHeight")
(setf (get add_post_pro_simulation::SurfaceHeight :request) add_post_pro_simulation::SurfaceHeightRequest)
(setf (get add_post_pro_simulation::SurfaceHeight :response) add_post_pro_simulation::SurfaceHeightResponse)

(defmethod add_post_pro_simulation::SurfaceHeightRequest
  (:response () (instance add_post_pro_simulation::SurfaceHeightResponse :init)))

(setf (get add_post_pro_simulation::SurfaceHeightRequest :md5sum-) "84a8867fc8ccf3b6b9067181a42e5ae9")
(setf (get add_post_pro_simulation::SurfaceHeightRequest :datatype-) "add_post_pro_simulation/SurfaceHeightRequest")
(setf (get add_post_pro_simulation::SurfaceHeightRequest :definition-)
      "float32 z_delta
---
# Success: TRUE if height is successfully changed.
bool success

")

(setf (get add_post_pro_simulation::SurfaceHeightResponse :md5sum-) "84a8867fc8ccf3b6b9067181a42e5ae9")
(setf (get add_post_pro_simulation::SurfaceHeightResponse :datatype-) "add_post_pro_simulation/SurfaceHeightResponse")
(setf (get add_post_pro_simulation::SurfaceHeightResponse :definition-)
      "float32 z_delta
---
# Success: TRUE if height is successfully changed.
bool success

")



(provide :add_post_pro_simulation/SurfaceHeight "84a8867fc8ccf3b6b9067181a42e5ae9")


