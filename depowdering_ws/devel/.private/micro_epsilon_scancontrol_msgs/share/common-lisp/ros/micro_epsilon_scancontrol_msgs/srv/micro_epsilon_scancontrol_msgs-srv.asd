
(cl:in-package :asdf)

(defsystem "micro_epsilon_scancontrol_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GetAvailableResolutions" :depends-on ("_package_GetAvailableResolutions"))
    (:file "_package_GetAvailableResolutions" :depends-on ("_package"))
    (:file "GetFeature" :depends-on ("_package_GetFeature"))
    (:file "_package_GetFeature" :depends-on ("_package"))
    (:file "GetResolution" :depends-on ("_package_GetResolution"))
    (:file "_package_GetResolution" :depends-on ("_package"))
    (:file "SetFeature" :depends-on ("_package_SetFeature"))
    (:file "_package_SetFeature" :depends-on ("_package"))
    (:file "SetResolution" :depends-on ("_package_SetResolution"))
    (:file "_package_SetResolution" :depends-on ("_package"))
  ))