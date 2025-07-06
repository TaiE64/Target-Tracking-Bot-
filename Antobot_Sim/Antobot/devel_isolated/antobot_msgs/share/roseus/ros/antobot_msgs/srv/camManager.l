;; Auto-generated. Do not edit!


(when (boundp 'antobot_msgs::camManager)
  (if (not (find-package "ANTOBOT_MSGS"))
    (make-package "ANTOBOT_MSGS"))
  (shadow 'camManager (find-package "ANTOBOT_MSGS")))
(unless (find-package "ANTOBOT_MSGS::CAMMANAGER")
  (make-package "ANTOBOT_MSGS::CAMMANAGER"))
(unless (find-package "ANTOBOT_MSGS::CAMMANAGERREQUEST")
  (make-package "ANTOBOT_MSGS::CAMMANAGERREQUEST"))
(unless (find-package "ANTOBOT_MSGS::CAMMANAGERRESPONSE")
  (make-package "ANTOBOT_MSGS::CAMMANAGERRESPONSE"))

(in-package "ROS")





(defclass antobot_msgs::camManagerRequest
  :super ros::object
  :slots (_camera_num _command ))

(defmethod antobot_msgs::camManagerRequest
  (:init
   (&key
    ((:camera_num __camera_num) 0)
    ((:command __command) 0)
    )
   (send-super :init)
   (setq _camera_num (round __camera_num))
   (setq _command (round __command))
   self)
  (:camera_num
   (&optional __camera_num)
   (if __camera_num (setq _camera_num __camera_num)) _camera_num)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; int8 _camera_num
    1
    ;; int8 _command
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _camera_num
       (write-byte _camera_num s)
     ;; int8 _command
       (write-byte _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _camera_num
     (setq _camera_num (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _camera_num 127) (setq _camera_num (- _camera_num 256)))
   ;; int8 _command
     (setq _command (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _command 127) (setq _command (- _command 256)))
   ;;
   self)
  )

(defclass antobot_msgs::camManagerResponse
  :super ros::object
  :slots (_responseCode _responseString ))

(defmethod antobot_msgs::camManagerResponse
  (:init
   (&key
    ((:responseCode __responseCode) 0)
    ((:responseString __responseString) "")
    )
   (send-super :init)
   (setq _responseCode (round __responseCode))
   (setq _responseString (string __responseString))
   self)
  (:responseCode
   (&optional __responseCode)
   (if __responseCode (setq _responseCode __responseCode)) _responseCode)
  (:responseString
   (&optional __responseString)
   (if __responseString (setq _responseString __responseString)) _responseString)
  (:serialization-length
   ()
   (+
    ;; int8 _responseCode
    1
    ;; string _responseString
    4 (length _responseString)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _responseCode
       (write-byte _responseCode s)
     ;; string _responseString
       (write-long (length _responseString) s) (princ _responseString s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _responseCode
     (setq _responseCode (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _responseCode 127) (setq _responseCode (- _responseCode 256)))
   ;; string _responseString
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _responseString (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass antobot_msgs::camManager
  :super ros::object
  :slots ())

(setf (get antobot_msgs::camManager :md5sum-) "fc42ba797ab7c1398107c36a354e835f")
(setf (get antobot_msgs::camManager :datatype-) "antobot_msgs/camManager")
(setf (get antobot_msgs::camManager :request) antobot_msgs::camManagerRequest)
(setf (get antobot_msgs::camManager :response) antobot_msgs::camManagerResponse)

(defmethod antobot_msgs::camManagerRequest
  (:response () (instance antobot_msgs::camManagerResponse :init)))

(setf (get antobot_msgs::camManagerRequest :md5sum-) "fc42ba797ab7c1398107c36a354e835f")
(setf (get antobot_msgs::camManagerRequest :datatype-) "antobot_msgs/camManagerRequest")
(setf (get antobot_msgs::camManagerRequest :definition-)
      "int8 camera_num		    # 0 - front, 1 - back, 2 - left, 3 - right
int8 command			# 0 - close/turn off, 1 - launch ROS code, 2 - start recording video
---
int8 responseCode		# 0 - success, -1 - failure
string responseString   # Additional info

")

(setf (get antobot_msgs::camManagerResponse :md5sum-) "fc42ba797ab7c1398107c36a354e835f")
(setf (get antobot_msgs::camManagerResponse :datatype-) "antobot_msgs/camManagerResponse")
(setf (get antobot_msgs::camManagerResponse :definition-)
      "int8 camera_num		    # 0 - front, 1 - back, 2 - left, 3 - right
int8 command			# 0 - close/turn off, 1 - launch ROS code, 2 - start recording video
---
int8 responseCode		# 0 - success, -1 - failure
string responseString   # Additional info

")



(provide :antobot_msgs/camManager "fc42ba797ab7c1398107c36a354e835f")


