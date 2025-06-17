;; Auto-generated. Do not edit!


(when (boundp 'add_post_pro_simulation::APPChangeHeight)
  (if (not (find-package "ADD_POST_PRO_SIMULATION"))
    (make-package "ADD_POST_PRO_SIMULATION"))
  (shadow 'APPChangeHeight (find-package "ADD_POST_PRO_SIMULATION")))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPCHANGEHEIGHT")
  (make-package "ADD_POST_PRO_SIMULATION::APPCHANGEHEIGHT"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPCHANGEHEIGHTREQUEST")
  (make-package "ADD_POST_PRO_SIMULATION::APPCHANGEHEIGHTREQUEST"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPCHANGEHEIGHTRESPONSE")
  (make-package "ADD_POST_PRO_SIMULATION::APPCHANGEHEIGHTRESPONSE"))

(in-package "ROS")





(defclass add_post_pro_simulation::APPChangeHeightRequest
  :super ros::object
  :slots (_z_delta ))

(defmethod add_post_pro_simulation::APPChangeHeightRequest
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

(defclass add_post_pro_simulation::APPChangeHeightResponse
  :super ros::object
  :slots (_success ))

(defmethod add_post_pro_simulation::APPChangeHeightResponse
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

(defclass add_post_pro_simulation::APPChangeHeight
  :super ros::object
  :slots ())

(setf (get add_post_pro_simulation::APPChangeHeight :md5sum-) "84a8867fc8ccf3b6b9067181a42e5ae9")
(setf (get add_post_pro_simulation::APPChangeHeight :datatype-) "add_post_pro_simulation/APPChangeHeight")
(setf (get add_post_pro_simulation::APPChangeHeight :request) add_post_pro_simulation::APPChangeHeightRequest)
(setf (get add_post_pro_simulation::APPChangeHeight :response) add_post_pro_simulation::APPChangeHeightResponse)

(defmethod add_post_pro_simulation::APPChangeHeightRequest
  (:response () (instance add_post_pro_simulation::APPChangeHeightResponse :init)))

(setf (get add_post_pro_simulation::APPChangeHeightRequest :md5sum-) "84a8867fc8ccf3b6b9067181a42e5ae9")
(setf (get add_post_pro_simulation::APPChangeHeightRequest :datatype-) "add_post_pro_simulation/APPChangeHeightRequest")
(setf (get add_post_pro_simulation::APPChangeHeightRequest :definition-)
      "float32 z_delta
---
bool success
")

(setf (get add_post_pro_simulation::APPChangeHeightResponse :md5sum-) "84a8867fc8ccf3b6b9067181a42e5ae9")
(setf (get add_post_pro_simulation::APPChangeHeightResponse :datatype-) "add_post_pro_simulation/APPChangeHeightResponse")
(setf (get add_post_pro_simulation::APPChangeHeightResponse :definition-)
      "float32 z_delta
---
bool success
")



(provide :add_post_pro_simulation/APPChangeHeight "84a8867fc8ccf3b6b9067181a42e5ae9")


