;; Auto-generated. Do not edit!


(when (boundp 'antobot_msgs::antoRec)
  (if (not (find-package "ANTOBOT_MSGS"))
    (make-package "ANTOBOT_MSGS"))
  (shadow 'antoRec (find-package "ANTOBOT_MSGS")))
(unless (find-package "ANTOBOT_MSGS::ANTOREC")
  (make-package "ANTOBOT_MSGS::ANTOREC"))
(unless (find-package "ANTOBOT_MSGS::ANTORECREQUEST")
  (make-package "ANTOBOT_MSGS::ANTORECREQUEST"))
(unless (find-package "ANTOBOT_MSGS::ANTORECRESPONSE")
  (make-package "ANTOBOT_MSGS::ANTORECRESPONSE"))

(in-package "ROS")





(defclass antobot_msgs::antoRecRequest
  :super ros::object
  :slots (_command ))

(defmethod antobot_msgs::antoRecRequest
  (:init
   (&key
    ((:command __command) 0)
    )
   (send-super :init)
   (setq _command (round __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; int8 _command
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _command
       (write-byte _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _command
     (setq _command (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _command 127) (setq _command (- _command 256)))
   ;;
   self)
  )

(defclass antobot_msgs::antoRecResponse
  :super ros::object
  :slots (_responseCode _responseString ))

(defmethod antobot_msgs::antoRecResponse
  (:init
   (&key
    ((:responseCode __responseCode) nil)
    ((:responseString __responseString) "")
    )
   (send-super :init)
   (setq _responseCode __responseCode)
   (setq _responseString (string __responseString))
   self)
  (:responseCode
   (&optional (__responseCode :null))
   (if (not (eq __responseCode :null)) (setq _responseCode __responseCode)) _responseCode)
  (:responseString
   (&optional __responseString)
   (if __responseString (setq _responseString __responseString)) _responseString)
  (:serialization-length
   ()
   (+
    ;; bool _responseCode
    1
    ;; string _responseString
    4 (length _responseString)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _responseCode
       (if _responseCode (write-byte -1 s) (write-byte 0 s))
     ;; string _responseString
       (write-long (length _responseString) s) (princ _responseString s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _responseCode
     (setq _responseCode (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _responseString
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _responseString (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass antobot_msgs::antoRec
  :super ros::object
  :slots ())

(setf (get antobot_msgs::antoRec :md5sum-) "d5a7288f1d26019f672552946e4bed3b")
(setf (get antobot_msgs::antoRec :datatype-) "antobot_msgs/antoRec")
(setf (get antobot_msgs::antoRec :request) antobot_msgs::antoRecRequest)
(setf (get antobot_msgs::antoRec :response) antobot_msgs::antoRecResponse)

(defmethod antobot_msgs::antoRecRequest
  (:response () (instance antobot_msgs::antoRecResponse :init)))

(setf (get antobot_msgs::antoRecRequest :md5sum-) "d5a7288f1d26019f672552946e4bed3b")
(setf (get antobot_msgs::antoRecRequest :datatype-) "antobot_msgs/antoRecRequest")
(setf (get antobot_msgs::antoRecRequest :definition-)
      "int8 command	# 0 - open cam 1 - close cam, 2 - start recording, 3 - stop recording
---
bool responseCode		# False - failure, True - success
string responseString	# Additional info





")

(setf (get antobot_msgs::antoRecResponse :md5sum-) "d5a7288f1d26019f672552946e4bed3b")
(setf (get antobot_msgs::antoRecResponse :datatype-) "antobot_msgs/antoRecResponse")
(setf (get antobot_msgs::antoRecResponse :definition-)
      "int8 command	# 0 - open cam 1 - close cam, 2 - start recording, 3 - stop recording
---
bool responseCode		# False - failure, True - success
string responseString	# Additional info





")



(provide :antobot_msgs/antoRec "d5a7288f1d26019f672552946e4bed3b")


