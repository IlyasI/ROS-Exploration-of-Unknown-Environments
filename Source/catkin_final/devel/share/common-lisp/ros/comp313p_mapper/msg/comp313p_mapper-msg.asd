
(cl:in-package :asdf)

(defsystem "comp313p_mapper-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "MapUpdate" :depends-on ("_package_MapUpdate"))
    (:file "_package_MapUpdate" :depends-on ("_package"))
  ))