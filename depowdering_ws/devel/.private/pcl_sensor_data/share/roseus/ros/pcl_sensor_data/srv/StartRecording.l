;; Auto-generated. Do not edit!


(when (boundp 'pcl_sensor_data::StartRecording)
  (if (not (find-package "PCL_SENSOR_DATA"))
    (make-package "PCL_SENSOR_DATA"))
  (shadow 'StartRecording (find-package "PCL_SENSOR_DATA")))
(unless (find-package "PCL_SENSOR_DATA::STARTRECORDING")
  (make-package "PCL_SENSOR_DATA::STARTRECORDING"))
(unless (find-package "PCL_SENSOR_DATA::STARTRECORDINGREQUEST")
  (make-package "PCL_SENSOR_DATA::STARTRECORDINGREQUEST"))
(unless (find-package "PCL_SENSOR_DATA::STARTRECORDINGRESPONSE")
  (make-package "PCL_SENSOR_DATA::STARTRECORDINGRESPONSE"))

(in-package "ROS")





(defclass pcl_sensor_data::StartRecordingRequest
  :super ros::object
  :slots (_req ))

(defmethod pcl_sensor_data::StartRecordingRequest
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

(defclass pcl_sensor_data::StartRecordingResponse
  :super ros::object
  :slots (_success ))

(defmethod pcl_sensor_data::StartRecordingResponse
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

(defclass pcl_sensor_data::StartRecording
  :super ros::object
  :slots ())

(setf (get pcl_sensor_data::StartRecording :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::StartRecording :datatype-) "pcl_sensor_data/StartRecording")
(setf (get pcl_sensor_data::StartRecording :request) pcl_sensor_data::StartRecordingRequest)
(setf (get pcl_sensor_data::StartRecording :response) pcl_sensor_data::StartRecordingResponse)

(defmethod pcl_sensor_data::StartRecordingRequest
  (:response () (instance pcl_sensor_data::StartRecordingResponse :init)))

(setf (get pcl_sensor_data::StartRecordingRequest :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::StartRecordingRequest :datatype-) "pcl_sensor_data/StartRecordingRequest")
(setf (get pcl_sensor_data::StartRecordingRequest :definition-)
      "#request
bool req
---
#response
bool success
")

(setf (get pcl_sensor_data::StartRecordingResponse :md5sum-) "e188e0aaebb633ed14c21333921ef038")
(setf (get pcl_sensor_data::StartRecordingResponse :datatype-) "pcl_sensor_data/StartRecordingResponse")
(setf (get pcl_sensor_data::StartRecordingResponse :definition-)
      "#request
bool req
---
#response
bool success
")



(provide :pcl_sensor_data/StartRecording "e188e0aaebb633ed14c21333921ef038")


