
(cl:in-package :asdf)

(defsystem "realsense_cam-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "FetchOneDepth" :depends-on ("_package_FetchOneDepth"))
    (:file "_package_FetchOneDepth" :depends-on ("_package"))
    (:file "FetchOnePointCloud" :depends-on ("_package_FetchOnePointCloud"))
    (:file "_package_FetchOnePointCloud" :depends-on ("_package"))
    (:file "FetchOneRGB" :depends-on ("_package_FetchOneRGB"))
    (:file "_package_FetchOneRGB" :depends-on ("_package"))
    (:file "FetchPointCloudConverted" :depends-on ("_package_FetchPointCloudConverted"))
    (:file "_package_FetchPointCloudConverted" :depends-on ("_package"))
    (:file "FindBoxPoints" :depends-on ("_package_FindBoxPoints"))
    (:file "_package_FindBoxPoints" :depends-on ("_package"))
    (:file "FindWorkspaceCenter" :depends-on ("_package_FindWorkspaceCenter"))
    (:file "_package_FindWorkspaceCenter" :depends-on ("_package"))
    (:file "SaveOnePCL" :depends-on ("_package_SaveOnePCL"))
    (:file "_package_SaveOnePCL" :depends-on ("_package"))
    (:file "SaveOneRGB" :depends-on ("_package_SaveOneRGB"))
    (:file "_package_SaveOneRGB" :depends-on ("_package"))
  ))