
(cl:in-package :asdf)

(defsystem "comp313p_mapper-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :comp313p_mapper-msg
)
  :components ((:file "_package")
    (:file "ChangeMapperState" :depends-on ("_package_ChangeMapperState"))
    (:file "_package_ChangeMapperState" :depends-on ("_package"))
    (:file "RequestMapUpdate" :depends-on ("_package_RequestMapUpdate"))
    (:file "_package_RequestMapUpdate" :depends-on ("_package"))
  ))