;; Auto-generated. Do not edit!


(when (boundp 'zed_interfaces::reset_roi)
  (if (not (find-package "ZED_INTERFACES"))
    (make-package "ZED_INTERFACES"))
  (shadow 'reset_roi (find-package "ZED_INTERFACES")))
(unless (find-package "ZED_INTERFACES::RESET_ROI")
  (make-package "ZED_INTERFACES::RESET_ROI"))
(unless (find-package "ZED_INTERFACES::RESET_ROIREQUEST")
  (make-package "ZED_INTERFACES::RESET_ROIREQUEST"))
(unless (find-package "ZED_INTERFACES::RESET_ROIRESPONSE")
  (make-package "ZED_INTERFACES::RESET_ROIRESPONSE"))

(in-package "ROS")





(defclass zed_interfaces::reset_roiRequest
  :super ros::object
  :slots ())

(defmethod zed_interfaces::reset_roiRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass zed_interfaces::reset_roiResponse
  :super ros::object
  :slots (_reset_done ))

(defmethod zed_interfaces::reset_roiResponse
  (:init
   (&key
    ((:reset_done __reset_done) nil)
    )
   (send-super :init)
   (setq _reset_done __reset_done)
   self)
  (:reset_done
   (&optional (__reset_done :null))
   (if (not (eq __reset_done :null)) (setq _reset_done __reset_done)) _reset_done)
  (:serialization-length
   ()
   (+
    ;; bool _reset_done
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _reset_done
       (if _reset_done (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _reset_done
     (setq _reset_done (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass zed_interfaces::reset_roi
  :super ros::object
  :slots ())

(setf (get zed_interfaces::reset_roi :md5sum-) "e1e87fc9e9e6c154eca93b9fa292cc05")
(setf (get zed_interfaces::reset_roi :datatype-) "zed_interfaces/reset_roi")
(setf (get zed_interfaces::reset_roi :request) zed_interfaces::reset_roiRequest)
(setf (get zed_interfaces::reset_roi :response) zed_interfaces::reset_roiResponse)

(defmethod zed_interfaces::reset_roiRequest
  (:response () (instance zed_interfaces::reset_roiResponse :init)))

(setf (get zed_interfaces::reset_roiRequest :md5sum-) "e1e87fc9e9e6c154eca93b9fa292cc05")
(setf (get zed_interfaces::reset_roiRequest :datatype-) "zed_interfaces/reset_roiRequest")
(setf (get zed_interfaces::reset_roiRequest :definition-)
      "---
bool reset_done
")

(setf (get zed_interfaces::reset_roiResponse :md5sum-) "e1e87fc9e9e6c154eca93b9fa292cc05")
(setf (get zed_interfaces::reset_roiResponse :datatype-) "zed_interfaces/reset_roiResponse")
(setf (get zed_interfaces::reset_roiResponse :definition-)
      "---
bool reset_done
")



(provide :zed_interfaces/reset_roi "e1e87fc9e9e6c154eca93b9fa292cc05")


