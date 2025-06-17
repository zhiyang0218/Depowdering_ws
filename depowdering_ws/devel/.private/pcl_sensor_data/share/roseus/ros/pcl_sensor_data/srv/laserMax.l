;; Auto-generated. Do not edit!


(when (boundp 'pcl_sensor_data::laserMax)
  (if (not (find-package "PCL_SENSOR_DATA"))
    (make-package "PCL_SENSOR_DATA"))
  (shadow 'laserMax (find-package "PCL_SENSOR_DATA")))
(unless (find-package "PCL_SENSOR_DATA::LASERMAX")
  (make-package "PCL_SENSOR_DATA::LASERMAX"))
(unless (find-package "PCL_SENSOR_DATA::LASERMAXREQUEST")
  (make-package "PCL_SENSOR_DATA::LASERMAXREQUEST"))
(unless (find-package "PCL_SENSOR_DATA::LASERMAXRESPONSE")
  (make-package "PCL_SENSOR_DATA::LASERMAXRESPONSE"))

(in-package "ROS")





(defclass pcl_sensor_data::laserMaxRequest
  :super ros::object
  :slots (_req ))

(defmethod pcl_sensor_data::laserMaxRequest
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

(defclass pcl_sensor_data::laserMaxResponse
  :super ros::object
  :slots (_laserMax ))

(defmethod pcl_sensor_data::laserMaxResponse
  (:init
   (&key
    ((:laserMax __laserMax) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _laserMax __laserMax)
   self)
  (:laserMax
   (&optional __laserMax)
   (if __laserMax (setq _laserMax __laserMax)) _laserMax)
  (:serialization-length
   ()
   (+
    ;; float64[] _laserMax
    (* 8    (length _laserMax)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _laserMax
     (write-long (length _laserMax) s)
     (dotimes (i (length _laserMax))
       (sys::poke (elt _laserMax i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _laserMax
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _laserMax (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _laserMax i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass pcl_sensor_data::laserMax
  :super ros::object
  :slots ())

(setf (get pcl_sensor_data::laserMax :md5sum-) "124fa1b43cf028c996c86f4d96158bb6")
(setf (get pcl_sensor_data::laserMax :datatype-) "pcl_sensor_data/laserMax")
(setf (get pcl_sensor_data::laserMax :request) pcl_sensor_data::laserMaxRequest)
(setf (get pcl_sensor_data::laserMax :response) pcl_sensor_data::laserMaxResponse)

(defmethod pcl_sensor_data::laserMaxRequest
  (:response () (instance pcl_sensor_data::laserMaxResponse :init)))

(setf (get pcl_sensor_data::laserMaxRequest :md5sum-) "124fa1b43cf028c996c86f4d96158bb6")
(setf (get pcl_sensor_data::laserMaxRequest :datatype-) "pcl_sensor_data/laserMaxRequest")
(setf (get pcl_sensor_data::laserMaxRequest :definition-)
      "#request
bool req
---
#response
float64[] laserMax
")

(setf (get pcl_sensor_data::laserMaxResponse :md5sum-) "124fa1b43cf028c996c86f4d96158bb6")
(setf (get pcl_sensor_data::laserMaxResponse :datatype-) "pcl_sensor_data/laserMaxResponse")
(setf (get pcl_sensor_data::laserMaxResponse :definition-)
      "#request
bool req
---
#response
float64[] laserMax
")



(provide :pcl_sensor_data/laserMax "124fa1b43cf028c996c86f4d96158bb6")


