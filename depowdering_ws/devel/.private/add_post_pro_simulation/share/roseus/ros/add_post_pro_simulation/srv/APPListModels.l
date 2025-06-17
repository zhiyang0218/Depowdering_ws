;; Auto-generated. Do not edit!


(when (boundp 'add_post_pro_simulation::APPListModels)
  (if (not (find-package "ADD_POST_PRO_SIMULATION"))
    (make-package "ADD_POST_PRO_SIMULATION"))
  (shadow 'APPListModels (find-package "ADD_POST_PRO_SIMULATION")))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPLISTMODELS")
  (make-package "ADD_POST_PRO_SIMULATION::APPLISTMODELS"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPLISTMODELSREQUEST")
  (make-package "ADD_POST_PRO_SIMULATION::APPLISTMODELSREQUEST"))
(unless (find-package "ADD_POST_PRO_SIMULATION::APPLISTMODELSRESPONSE")
  (make-package "ADD_POST_PRO_SIMULATION::APPLISTMODELSRESPONSE"))

(in-package "ROS")





(defclass add_post_pro_simulation::APPListModelsRequest
  :super ros::object
  :slots ())

(defmethod add_post_pro_simulation::APPListModelsRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass add_post_pro_simulation::APPListModelsResponse
  :super ros::object
  :slots (_models ))

(defmethod add_post_pro_simulation::APPListModelsResponse
  (:init
   (&key
    ((:models __models) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _models __models)
   self)
  (:models
   (&optional __models)
   (if __models (setq _models __models)) _models)
  (:serialization-length
   ()
   (+
    ;; string[] _models
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _models)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _models
     (write-long (length _models) s)
     (dolist (elem _models)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _models
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _models (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _models i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass add_post_pro_simulation::APPListModels
  :super ros::object
  :slots ())

(setf (get add_post_pro_simulation::APPListModels :md5sum-) "68c1312e15cb67cd7b79f814607addf5")
(setf (get add_post_pro_simulation::APPListModels :datatype-) "add_post_pro_simulation/APPListModels")
(setf (get add_post_pro_simulation::APPListModels :request) add_post_pro_simulation::APPListModelsRequest)
(setf (get add_post_pro_simulation::APPListModels :response) add_post_pro_simulation::APPListModelsResponse)

(defmethod add_post_pro_simulation::APPListModelsRequest
  (:response () (instance add_post_pro_simulation::APPListModelsResponse :init)))

(setf (get add_post_pro_simulation::APPListModelsRequest :md5sum-) "68c1312e15cb67cd7b79f814607addf5")
(setf (get add_post_pro_simulation::APPListModelsRequest :datatype-) "add_post_pro_simulation/APPListModelsRequest")
(setf (get add_post_pro_simulation::APPListModelsRequest :definition-)
      "---
string[] models
")

(setf (get add_post_pro_simulation::APPListModelsResponse :md5sum-) "68c1312e15cb67cd7b79f814607addf5")
(setf (get add_post_pro_simulation::APPListModelsResponse :datatype-) "add_post_pro_simulation/APPListModelsResponse")
(setf (get add_post_pro_simulation::APPListModelsResponse :definition-)
      "---
string[] models
")



(provide :add_post_pro_simulation/APPListModels "68c1312e15cb67cd7b79f814607addf5")


