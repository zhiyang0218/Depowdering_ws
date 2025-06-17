;; Auto-generated. Do not edit!


(when (boundp 'pcl_sensor_data::RestartRecording)
  (if (not (find-package "PCL_SENSOR_DATA"))
    (make-package "PCL_SENSOR_DATA"))
  (shadow 'RestartRecording (find-package "PCL_SENSOR_DATA")))
(unless (find-package "PCL_SENSOR_DATA::RESTARTRECORDING")
  (make-package "PCL_SENSOR_DATA::RESTARTRECORDING"))
(unless (find-package "PCL_SENSOR_DATA::RESTARTRECORDINGREQUEST")
  (make-package "PCL_SENSOR_DATA::RESTARTRECORDINGREQUEST"))
(unless (find-package "PCL_SENSOR_DATA::RESTARTRECORDINGRESPONSE")
  (make-package "PCL_SENSOR_DATA::RESTARTRECORDINGRESPONSE"))

(in-package "ROS")





(defclass pcl_sensor_data::RestartRecordingRequest
  :super ros::object
  :slots (_req ))

(defmethod pcl_sensor_data::RestartRecordingRequest
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

(defclass pcl_sensor_data::RestartRecordingResponse
  :super ros::object
  :slots (_success ))

(defmethod pcl_sensor_data::RestartRecordingResponse
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

(defclass pcl_sensor_data::RestartRecording
  :super ros::object
  :slots ())

(setf (get pcl_sensor_data::RestartRecording :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::RestartRecording :datatype-) "pcl_sensor_data/RestartRecording")
(setf (get pcl_sensor_data::RestartRecording :request) pcl_sensor_data::RestartRecordingRequest)
(setf (get pcl_sensor_data::RestartRecording :response) pcl_sensor_data::RestartRecordingResponse)

(defmethod pcl_sensor_data::RestartRecordingRequest
  (:response () (instance pcl_sensor_data::RestartRecordingResponse :init)))

(setf (get pcl_sensor_data::RestartRecordingRequest :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::RestartRecordingRequest :datatype-) "pcl_sensor_data/RestartRecordingRequest")
(setf (get pcl_sensor_data::RestartRecordingRequest :definition-)
      "#request
bool req
---
#response
bool success
")

(setf (get pcl_sensor_data::RestartRecordingResponse :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::RestartRecordingResponse :datatype-) "pcl_sensor_data/RestartRecordingResponse")
(setf (get pcl_sensor_data::RestartRecordingResponse :definition-)
      "#request
bool req
---
#response
bool success
")



(provide :pcl_sensor_data/RestartRecording "e188e0aaebb633ed14c21333921ef038")


