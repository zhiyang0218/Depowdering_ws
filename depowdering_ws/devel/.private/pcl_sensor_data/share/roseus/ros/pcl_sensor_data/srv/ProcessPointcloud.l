;; Auto-generated. Do not edit!


(when (boundp 'pcl_sensor_data::ProcessPointcloud)
  (if (not (find-package "PCL_SENSOR_DATA"))
    (make-package "PCL_SENSOR_DATA"))
  (shadow 'ProcessPointcloud (find-package "PCL_SENSOR_DATA")))
(unless (find-package "PCL_SENSOR_DATA::PROCESSPOINTCLOUD")
  (make-package "PCL_SENSOR_DATA::PROCESSPOINTCLOUD"))
(unless (find-package "PCL_SENSOR_DATA::PROCESSPOINTCLOUDREQUEST")
  (make-package "PCL_SENSOR_DATA::PROCESSPOINTCLOUDREQUEST"))
(unless (find-package "PCL_SENSOR_DATA::PROCESSPOINTCLOUDRESPONSE")
  (make-package "PCL_SENSOR_DATA::PROCESSPOINTCLOUDRESPONSE"))

(in-package "ROS")





(defclass pcl_sensor_data::ProcessPointcloudRequest
  :super ros::object
  :slots (_req ))

(defmethod pcl_sensor_data::ProcessPointcloudRequest
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

(defclass pcl_sensor_data::ProcessPointcloudResponse
  :super ros::object
  :slots (_success ))

(defmethod pcl_sensor_data::ProcessPointcloudResponse
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

(defclass pcl_sensor_data::ProcessPointcloud
  :super ros::object
  :slots ())

(setf (get pcl_sensor_data::ProcessPointcloud :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::ProcessPointcloud :datatype-) "pcl_sensor_data/ProcessPointcloud")
(setf (get pcl_sensor_data::ProcessPointcloud :request) pcl_sensor_data::ProcessPointcloudRequest)
(setf (get pcl_sensor_data::ProcessPointcloud :response) pcl_sensor_data::ProcessPointcloudResponse)

(defmethod pcl_sensor_data::ProcessPointcloudRequest
  (:response () (instance pcl_sensor_data::ProcessPointcloudResponse :init)))

(setf (get pcl_sensor_data::ProcessPointcloudRequest :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::ProcessPointcloudRequest :datatype-) "pcl_sensor_data/ProcessPointcloudRequest")
(setf (get pcl_sensor_data::ProcessPointcloudRequest :definition-)
      "#request
bool req
---
#response
bool success
")

(setf (get pcl_sensor_data::ProcessPointcloudResponse :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::ProcessPointcloudResponse :datatype-) "pcl_sensor_data/ProcessPointcloudResponse")
(setf (get pcl_sensor_data::ProcessPointcloudResponse :definition-)
      "#request
bool req
---
#response
bool success
")



(provide :pcl_sensor_data/ProcessPointcloud "e188e0aaebb633ed14c21333921ef038")


