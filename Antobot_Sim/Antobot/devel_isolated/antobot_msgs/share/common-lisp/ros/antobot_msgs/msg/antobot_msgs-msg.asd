
(cl:in-package :asdf)

(defsystem "antobot_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Float32_Array" :depends-on ("_package_Float32_Array"))
    (:file "_package_Float32_Array" :depends-on ("_package"))
    (:file "UInt16_Array" :depends-on ("_package_UInt16_Array"))
    (:file "_package_UInt16_Array" :depends-on ("_package"))
    (:file "UInt8_Array" :depends-on ("_package_UInt8_Array"))
    (:file "_package_UInt8_Array" :depends-on ("_package"))
  ))