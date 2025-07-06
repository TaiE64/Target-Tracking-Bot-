;; Auto-generated. Do not edit!


(when (boundp 'zed_interfaces::set_roi)
  (if (not (find-package "ZED_INTERFACES"))
    (make-package "ZED_INTERFACES"))
  (shadow 'set_roi (find-package "ZED_INTERFACES")))
(unless (find-package "ZED_INTERFACES::SET_ROI")
  (make-package "ZED_INTERFACES::SET_ROI"))
(unless (find-package "ZED_INTERFACES::SET_ROIREQUEST")
  (make-package "ZED_INTERFACES::SET_ROIREQUEST"))
(unless (find-package "ZED_INTERFACES::SET_ROIRESPONSE")
  (make-package "ZED_INTERFACES::SET_ROIRESPONSE"))

(in-package "ROS")





(defclass zed_interfaces::set_roiRequest
  :super ros::object
  :slots (_roi ))

(defmethod zed_interfaces::set_roiRequest
  (:init
   (&key
    ((:roi __roi) "")
    )
   (send-super :init)
   (setq _roi (string __roi))
   self)
  (:roi
   (&optional __roi)
   (if __roi (setq _roi __roi)) _roi)
  (:serialization-length
   ()
   (+
    ;; string _roi
    4 (length _roi)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _roi
       (write-long (length _roi) s) (princ _roi s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _roi
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _roi (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass zed_interfaces::set_roiResponse
  :super ros::object
  :slots (_success _message ))

(defmethod zed_interfaces::set_roiResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:message __message) "")
    )
   (send-super :init)
   (setq _success __success)
   (setq _message (string __message))
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:message
   (&optional __message)
   (if __message (setq _message __message)) _message)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; string _message
    4 (length _message)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; string _message
       (write-long (length _message) s) (princ _message s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _message
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _message (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass zed_interfaces::set_roi
  :super ros::object
  :slots ())

(setf (get zed_interfaces::set_roi :md5sum-) "4d207dda349313cd8eabd3b09064e700")
(setf (get zed_interfaces::set_roi :datatype-) "zed_interfaces/set_roi")
(setf (get zed_interfaces::set_roi :request) zed_interfaces::set_roiRequest)
(setf (get zed_interfaces::set_roi :response) zed_interfaces::set_roiResponse)

(defmethod zed_interfaces::set_roiRequest
  (:response () (instance zed_interfaces::set_roiResponse :init)))

(setf (get zed_interfaces::set_roiRequest :md5sum-) "4d207dda349313cd8eabd3b09064e700")
(setf (get zed_interfaces::set_roiRequest :datatype-) "zed_interfaces/set_roiRequest")
(setf (get zed_interfaces::set_roiRequest :definition-)
      "# Set the Region of Interest for ZED SDK computing

# Region of interest polygon as an array of normalized vertices. e.g. \"[[0.5,0.25],[0.75,0.5],[0.5,0.75],[0.25,0.5]]\"
# You can use
string roi
---
bool success   # indicate successful run of service
string message # informational, e.g. for error messages
")

(setf (get zed_interfaces::set_roiResponse :md5sum-) "4d207dda349313cd8eabd3b09064e700")
(setf (get zed_interfaces::set_roiResponse :datatype-) "zed_interfaces/set_roiResponse")
(setf (get zed_interfaces::set_roiResponse :definition-)
      "# Set the Region of Interest for ZED SDK computing

# Region of interest polygon as an array of normalized vertices. e.g. \"[[0.5,0.25],[0.75,0.5],[0.5,0.75],[0.25,0.5]]\"
# You can use
string roi
---
bool success   # indicate successful run of service
string message # informational, e.g. for error messages
")



(provide :zed_interfaces/set_roi "4d207dda349313cd8eabd3b09064e700")


