
(cl:in-package :asdf)

(defsystem "antobot_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "antoRec" :depends-on ("_package_antoRec"))
    (:file "_package_antoRec" :depends-on ("_package"))
    (:file "camManager" :depends-on ("_package_camManager"))
    (:file "_package_camManager" :depends-on ("_package"))
    (:file "softShutdown" :depends-on ("_package_softShutdown"))
    (:file "_package_softShutdown" :depends-on ("_package"))
  ))