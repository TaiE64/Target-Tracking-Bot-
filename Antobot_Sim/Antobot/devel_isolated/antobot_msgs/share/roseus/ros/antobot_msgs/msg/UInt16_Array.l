;; Auto-generated. Do not edit!


(when (boundp 'antobot_msgs::UInt16_Array)
  (if (not (find-package "ANTOBOT_MSGS"))
    (make-package "ANTOBOT_MSGS"))
  (shadow 'UInt16_Array (find-package "ANTOBOT_MSGS")))
(unless (find-package "ANTOBOT_MSGS::UINT16_ARRAY")
  (make-package "ANTOBOT_MSGS::UINT16_ARRAY"))

(in-package "ROS")
;;//! \htmlinclude UInt16_Array.msg.html


(defclass antobot_msgs::UInt16_Array
  :super ros::object
  :slots (_data ))

(defmethod antobot_msgs::UInt16_Array
  (:init
   (&key
    ((:data __data) (make-array 0 :initial-element 0 :element-type :integer))
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
    ;; uint16[] _data
    (* 2    (length _data)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint16[] _data
     (write-long (length _data) s)
     (dotimes (i (length _data))
       (write-word (elt _data i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint16[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _data i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get antobot_msgs::UInt16_Array :md5sum-) "e066daa5966378a57445687eb65bfa3b")
(setf (get antobot_msgs::UInt16_Array :datatype-) "antobot_msgs/UInt16_Array")
(setf (get antobot_msgs::UInt16_Array :definition-)
      "uint16[] data

")



(provide :antobot_msgs/UInt16_Array "e066daa5966378a57445687eb65bfa3b")


