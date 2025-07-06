;; Auto-generated. Do not edit!


(when (boundp 'antobot_msgs::UInt8_Array)
  (if (not (find-package "ANTOBOT_MSGS"))
    (make-package "ANTOBOT_MSGS"))
  (shadow 'UInt8_Array (find-package "ANTOBOT_MSGS")))
(unless (find-package "ANTOBOT_MSGS::UINT8_ARRAY")
  (make-package "ANTOBOT_MSGS::UINT8_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude UInt8_Array.msg.html


(defclass antobot_msgs::UInt8_Array
  :super ros::object
  :slots (_data ))

(defmethod antobot_msgs::UInt8_Array
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0 :element-type :char))
    )
   (send-super :init)
   (setq _data __data)
   self)
  (:data
   (&optional __data)
   (if __data (setq _data __data)) _data)
  (:serialization-length
   ()
   (+
    ;; uint8[] _data
    (* 1    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8[] _data
     (write-long (length _data) s)
     (princ _data s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8[] _data
   (let ((n (sys::peek buf ptr- :integer))) (incf ptr- 4)
     (setq _data (make-array n :element-type :char))
     (replace _data buf :start2 ptr-) (incf ptr- n))
   ;;
   self)
  )

(setf (get antobot_msgs::UInt8_Array :md5sum-) "f43a8e1b362b75baa741461b46adc7e0")
(setf (get antobot_msgs::UInt8_Array :datatype-) "antobot_msgs/UInt8_Array")
(setf (get antobot_msgs::UInt8_Array :definition-)
      "uint8[] data

")



(provide :antobot_msgs/UInt8_Array "f43a8e1b362b75baa741461b46adc7e0")


