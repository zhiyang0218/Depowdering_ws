;; Auto-generated. Do not edit!


(when (boundp 'pcl_sensor_data::avgZDistance)
  (if (not (find-package "PCL_SENSOR_DATA"))
    (make-package "PCL_SENSOR_DATA"))
  (shadow 'avgZDistance (find-package "PCL_SENSOR_DATA")))
(unless (find-package "PCL_SENSOR_DATA::AVGZDISTANCE")
  (make-package "PCL_SENSOR_DATA::AVGZDISTANCE"))
(unless (find-package "PCL_SENSOR_DATA::AVGZDISTANCEREQUEST")
  (make-package "PCL_SENSOR_DATA::AVGZDISTANCEREQUEST"))
(unless (find-package "PCL_SENSOR_DATA::AVGZDISTANCERESPONSE")
  (make-package "PCL_SENSOR_DATA::AVGZDISTANCERESPONSE"))

(in-package "ROS")





(defclass pcl_sensor_data::avgZDistanceRequest
  :super ros::object
  :slots (_req ))

(defmethod pcl_sensor_data::avgZDistanceRequest
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

(defclass pcl_sensor_data::avgZDistanceResponse
  :super ros::object
  :slots (_distance ))

(defmethod pcl_sensor_data::avgZDistanceResponse
  (:init
   (&key
    ((:distance __distance) 0.0)
    )
   (send-super :init)
   (setq _distance (float __distance))
   self)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:serialization-length
   ()
   (+
    ;; float64 _distance
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _distance
       (sys::poke _distance (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _distance
     (setq _distance (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass pcl_sensor_data::avgZDistance
  :super ros::object
  :slots ())

(setf (get pcl_sensor_data::avgZDistance :md5sum-) "b7675e7f132f1b7fa6dcff657e1f118e")
(setf (get pcl_sensor_data::avgZDistance :datatype-) "pcl_sensor_data/avgZDistance")
(setf (get pcl_sensor_data::avgZDistance :request) pcl_sensor_data::avgZDistanceRequest)
(setf (get pcl_sensor_data::avgZDistance :response) pcl_sensor_data::avgZDistanceResponse)

(defmethod pcl_sensor_data::avgZDistanceRequest
  (:response () (instance pcl_sensor_data::avgZDistanceResponse :init)))

(setf (get pcl_sensor_data::avgZDistanceRequest :md5sum-) "b7675e7f132f1b7fa6dcff657e1f118e")
(setf (get pcl_sensor_data::avgZDistanceRequest :datatype-) "pcl_sensor_data/avgZDistanceRequest")
(setf (get pcl_sensor_data::avgZDistanceRequest :definition-)
      "#request
bool req
---
#response
float64 distance
")

(setf (get pcl_sensor_data::avgZDistanceResponse :md5sum-) "b7675e7f132f1b7fa6dcff657e1f118e")
(setf (get pcl_sensor_data::avgZDistanceResponse :datatype-) "pcl_sensor_data/avgZDistanceResponse")
(setf (get pcl_sensor_data::avgZDistanceResponse :definition-)
      "#request
bool req
---
#response
float64 distance
")



(provide :pcl_sensor_data/avgZDistance "b7675e7f132f1b7fa6dcff657e1f118e")


