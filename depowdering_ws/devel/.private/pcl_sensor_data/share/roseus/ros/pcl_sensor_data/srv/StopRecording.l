;; Auto-generated. Do not edit!


(when (boundp 'pcl_sensor_data::StopRecording)
  (if (not (find-package "PCL_SENSOR_DATA"))
    (make-package "PCL_SENSOR_DATA"))
  (shadow 'StopRecording (find-package "PCL_SENSOR_DATA")))
(unless (find-package "PCL_SENSOR_DATA::STOPRECORDING")
  (make-package "PCL_SENSOR_DATA::STOPRECORDING"))
(unless (find-package "PCL_SENSOR_DATA::STOPRECORDINGREQUEST")
  (make-package "PCL_SENSOR_DATA::STOPRECORDINGREQUEST"))
(unless (find-package "PCL_SENSOR_DATA::STOPRECORDINGRESPONSE")
  (make-package "PCL_SENSOR_DATA::STOPRECORDINGRESPONSE"))

(in-package "ROS")





(defclass pcl_sensor_data::StopRecordingRequest
  :super ros::object
  :slots (_req ))

(defmethod pcl_sensor_data::StopRecordingRequest
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

(defclass pcl_sensor_data::StopRecordingResponse
  :super ros::object
  :slots (_success ))

(defmethod pcl_sensor_data::StopRecordingResponse
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

(defclass pcl_sensor_data::StopRecording
  :super ros::object
  :slots ())

(setf (get pcl_sensor_data::StopRecording :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::StopRecording :datatype-) "pcl_sensor_data/StopRecording")
(setf (get pcl_sensor_data::StopRecording :request) pcl_sensor_data::StopRecordingRequest)
(setf (get pcl_sensor_data::StopRecording :response) pcl_sensor_data::StopRecordingResponse)

(defmethod pcl_sensor_data::StopRecordingRequest
  (:response () (instance pcl_sensor_data::StopRecordingResponse :init)))

(setf (get pcl_sensor_data::StopRecordingRequest :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::StopRecordingRequest :datatype-) "pcl_sensor_data/StopRecordingRequest")
(setf (get pcl_sensor_data::StopRecordingRequest :definition-)
      "#request
bool req
---
#response
bool success
")

(setf (get pcl_sensor_data::StopRecordingResponse :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::StopRecordingResponse :datatype-) "pcl_sensor_data/StopRecordingResponse")
(setf (get pcl_sensor_data::StopRecordingResponse :definition-)
      "#request
bool req
---
#response
bool success
")



(provide :pcl_sensor_data/StopRecording "e188e0aaebb633ed14c21333921ef038")


