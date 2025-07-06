;; Auto-generated. Do not edit!


(when (boundp 'antobot_msgs::softShutdown)
  (if (not (find-package "ANTOBOT_MSGS"))
    (make-package "ANTOBOT_MSGS"))
  (shadow 'softShutdown (find-package "ANTOBOT_MSGS")))
(unless (find-package "ANTOBOT_MSGS::SOFTSHUTDOWN")
  (make-package "ANTOBOT_MSGS::SOFTSHUTDOWN"))
(unless (find-package "ANTOBOT_MSGS::SOFTSHUTDOWNREQUEST")
  (make-package "ANTOBOT_MSGS::SOFTSHUTDOWNREQUEST"))
(unless (find-package "ANTOBOT_MSGS::SOFTSHUTDOWNRESPONSE")
  (make-package "ANTOBOT_MSGS::SOFTSHUTDOWNRESPONSE"))

(in-package "ROS")





(defclass antobot_msgs::softShutdownRequest
  :super ros::object
  :slots (_softshutdownreq ))

(defmethod antobot_msgs::softShutdownRequest
  (:init
   (&key
    ((:softshutdownreq __softshutdownreq) nil)
    )
   (send-super :init)
   (setq _softshutdownreq __softshutdownreq)
   self)
  (:softshutdownreq
   (&optional (__softshutdownreq :null))
   (if (not (eq __softshutdownreq :null)) (setq _softshutdownreq __softshutdownreq)) _softshutdownreq)
  (:serialization-length
   ()
   (+
    ;; bool _softshutdownreq
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _softshutdownreq
       (if _softshutdownreq (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _softshutdownreq
     (setq _softshutdownreq (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass antobot_msgs::softShutdownResponse
  :super ros::object
  :slots (_responseBool _responseString ))

(defmethod antobot_msgs::softShutdownResponse
  (:init
   (&key
    ((:responseBool __responseBool) nil)
    ((:responseString __responseString) "")
    )
   (send-super :init)
   (setq _responseBool __responseBool)
   (setq _responseString (string __responseString))
   self)
  (:responseBool
   (&optional (__responseBool :null))
   (if (not (eq __responseBool :null)) (setq _responseBool __responseBool)) _responseBool)
  (:responseString
   (&optional __responseString)
   (if __responseString (setq _responseString __responseString)) _responseString)
  (:serialization-length
   ()
   (+
    ;; bool _responseBool
    1
    ;; string _responseString
    4 (length _responseString)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _responseBool
       (if _responseBool (write-byte -1 s) (write-byte 0 s))
     ;; string _responseString
       (write-long (length _responseString) s) (princ _responseString s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _responseBool
     (setq _responseBool (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _responseString
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _responseString (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass antobot_msgs::softShutdown
  :super ros::object
  :slots ())

(setf (get antobot_msgs::softShutdown :md5sum-) "f4f225f161cdec955f047b31d2533a97")
(setf (get antobot_msgs::softShutdown :datatype-) "antobot_msgs/softShutdown")
(setf (get antobot_msgs::softShutdown :request) antobot_msgs::softShutdownRequest)
(setf (get antobot_msgs::softShutdown :response) antobot_msgs::softShutdownResponse)

(defmethod antobot_msgs::softShutdownRequest
  (:response () (instance antobot_msgs::softShutdownResponse :init)))

(setf (get antobot_msgs::softShutdownRequest :md5sum-) "f4f225f161cdec955f047b31d2533a97")
(setf (get antobot_msgs::softShutdownRequest :datatype-) "antobot_msgs/softShutdownRequest")
(setf (get antobot_msgs::softShutdownRequest :definition-)
      "bool softshutdownreq
---
bool responseBool
string responseString
")

(setf (get antobot_msgs::softShutdownResponse :md5sum-) "f4f225f161cdec955f047b31d2533a97")
(setf (get antobot_msgs::softShutdownResponse :datatype-) "antobot_msgs/softShutdownResponse")
(setf (get antobot_msgs::softShutdownResponse :definition-)
      "bool softshutdownreq
---
bool responseBool
string responseString
")



(provide :antobot_msgs/softShutdown "f4f225f161cdec955f047b31d2533a97")


