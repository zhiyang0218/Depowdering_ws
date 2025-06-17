;; Auto-generated. Do not edit!


(when (boundp 'pcl_sensor_data::angleAdjust)
  (if (not (find-package "PCL_SENSOR_DATA"))
    (make-package "PCL_SENSOR_DATA"))
  (shadow 'angleAdjust (find-package "PCL_SENSOR_DATA")))
(unless (find-package "PCL_SENSOR_DATA::ANGLEADJUST")
  (make-package "PCL_SENSOR_DATA::ANGLEADJUST"))
(unless (find-package "PCL_SENSOR_DATA::ANGLEADJUSTREQUEST")
  (make-package "PCL_SENSOR_DATA::ANGLEADJUSTREQUEST"))
(unless (find-package "PCL_SENSOR_DATA::ANGLEADJUSTRESPONSE")
  (make-package "PCL_SENSOR_DATA::ANGLEADJUSTRESPONSE"))

(in-package "ROS")





(defclass pcl_sensor_data::angleAdjustRequest
  :super ros::object
  :slots (_req ))

(defmethod pcl_sensor_data::angleAdjustRequest
  (:init
   (&key
    ((:req __req) nil)
    )
   (send-super :init)
   (setq _req __req)
   self)
  (:req
   (&optional (__req :null))
   (if (not (eq __req :null)) (setq _req __req)) _req)
  (:serialization-length
   ()
   (+
    ;; bool _req
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _req
       (if _req (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _req
     (setq _req (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass pcl_sensor_data::angleAdjustResponse
  :super ros::object
  :slots (_angle ))

(defmethod pcl_sensor_data::angleAdjustResponse
  (:init
   (&key
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _angle (float __angle))
   self)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; float64 _angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _angle
     (setq _angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass pcl_sensor_data::angleAdjust
  :super ros::object
  :slots ())

(setf (get pcl_sensor_data::angleAdjust :md5sum-) "f263ad018944d1f74b66bb892b6765bf")
(setf (get pcl_sensor_data::angleAdjust :datatype-) "pcl_sensor_data/angleAdjust")
(setf (get pcl_sensor_data::angleAdjust :request) pcl_sensor_data::angleAdjustRequest)
(setf (get pcl_sensor_data::angleAdjust :response) pcl_sensor_data::angleAdjustResponse)

(defmethod pcl_sensor_data::angleAdjustRequest
  (:response () (instance pcl_sensor_data::angleAdjustResponse :init)))

(setf (get pcl_sensor_data::angleAdjustRequest :md5sum-) "f263ad018944d1f74b66bb892b6765bf")
(setf (get pcl_sensor_data::angleAdjustRequest :datatype-) "pcl_sensor_data/angleAdjustRequest")
(setf (get pcl_sensor_data::angleAdjustRequest :definition-)
      "#request
bool req
---
#response
float64 angle
")

(setf (get pcl_sensor_data::angleAdjustResponse :md5sum-) "f263ad018944d1f74b66bb892b6765bf")
(setf (get pcl_sensor_data::angleAdjustResponse :datatype-) "pcl_sensor_data/angleAdjustResponse")
(setf (get pcl_sensor_data::angleAdjustResponse :definition-)
      "#request
bool req
---
#response
float64 angle
")



(provide :pcl_sensor_data/angleAdjust "f263ad018944d1f74b66bb892b6765bf")


