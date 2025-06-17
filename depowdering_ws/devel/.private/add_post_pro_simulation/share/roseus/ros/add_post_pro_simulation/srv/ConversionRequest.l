;; Auto-generated. Do not edit!


(when (boundp 'add_post_pro_simulation::ConversionRequest)
  (if (not (find-package "ADD_POST_PRO_SIMULATION"))
    (make-package "ADD_POST_PRO_SIMULATION"))
  (shadow 'ConversionRequest (find-package "ADD_POST_PRO_SIMULATION")))
(unless (find-package "ADD_POST_PRO_SIMULATION::CONVERSIONREQUEST")
  (make-package "ADD_POST_PRO_SIMULATION::CONVERSIONREQUEST"))
(unless (find-package "ADD_POST_PRO_SIMULATION::CONVERSIONREQUESTREQUEST")
  (make-package "ADD_POST_PRO_SIMULATION::CONVERSIONREQUESTREQUEST"))
(unless (find-package "ADD_POST_PRO_SIMULATION::CONVERSIONREQUESTRESPONSE")
  (make-package "ADD_POST_PRO_SIMULATION::CONVERSIONREQUESTRESPONSE"))

(in-package "ROS")





(defclass add_post_pro_simulation::ConversionRequestRequest
  :super ros::object
  :slots (_name ))

(defmethod add_post_pro_simulation::ConversionRequestRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass add_post_pro_simulation::ConversionRequestResponse
  :super ros::object
  :slots (_success ))

(defmethod add_post_pro_simulation::ConversionRequestResponse
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

(defclass add_post_pro_simulation::ConversionRequest
  :super ros::object
  :slots ())

(setf (get add_post_pro_simulation::ConversionRequest :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get add_post_pro_simulation::ConversionRequest :datatype-) "add_post_pro_simulation/ConversionRequest")
(setf (get add_post_pro_simulation::ConversionRequest :request) add_post_pro_simulation::ConversionRequestRequest)
(setf (get add_post_pro_simulation::ConversionRequest :response) add_post_pro_simulation::ConversionRequestResponse)

(defmethod add_post_pro_simulation::ConversionRequestRequest
  (:response () (instance add_post_pro_simulation::ConversionRequestResponse :init)))

(setf (get add_post_pro_simulation::ConversionRequestRequest :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get add_post_pro_simulation::ConversionRequestRequest :datatype-) "add_post_pro_simulation/ConversionRequestRequest")
(setf (get add_post_pro_simulation::ConversionRequestRequest :definition-)
      "
string name
---
bool success
")

(setf (get add_post_pro_simulation::ConversionRequestResponse :md5sum-) "d08a3b641c2f8680fbdfb1ea2e17a3e1")
(setf (get add_post_pro_simulation::ConversionRequestResponse :datatype-) "add_post_pro_simulation/ConversionRequestResponse")
(setf (get add_post_pro_simulation::ConversionRequestResponse :definition-)
      "
string name
---
bool success
")



(provide :add_post_pro_simulation/ConversionRequest "d08a3b641c2f8680fbdfb1ea2e17a3e1")


