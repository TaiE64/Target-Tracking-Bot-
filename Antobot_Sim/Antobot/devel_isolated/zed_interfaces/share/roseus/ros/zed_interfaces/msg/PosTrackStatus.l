;; Auto-generated. Do not edit!


(when (boundp 'zed_interfaces::PosTrackStatus)
  (if (not (find-package "ZED_INTERFACES"))
    (make-package "ZED_INTERFACES"))
  (shadow 'PosTrackStatus (find-package "ZED_INTERFACES")))
(unless (find-package "ZED_INTERFACES::POSTRACKSTATUS")
  (make-package "ZED_INTERFACES::POSTRACKSTATUS"))

(in-package "ROS")
;;//! \htmlinclude PosTrackStatus.msg.html


(intern "*SEARCHING*" (find-package "ZED_INTERFACES::POSTRACKSTATUS"))
(shadow '*SEARCHING* (find-package "ZED_INTERFACES::POSTRACKSTATUS"))
(defconstant zed_interfaces::PosTrackStatus::*SEARCHING* 0)
(intern "*OK*" (find-package "ZED_INTERFACES::POSTRACKSTATUS"))
(shadow '*OK* (find-package "ZED_INTERFACES::POSTRACKSTATUS"))
(defconstant zed_interfaces::PosTrackStatus::*OK* 1)
(intern "*OFF*" (find-package "ZED_INTERFACES::POSTRACKSTATUS"))
(shadow '*OFF* (find-package "ZED_INTERFACES::POSTRACKSTATUS"))
(defconstant zed_interfaces::PosTrackStatus::*OFF* 2)
(intern "*FPS_TOO_LOW*" (find-package "ZED_INTERFACES::POSTRACKSTATUS"))
(shadow '*FPS_TOO_LOW* (find-package "ZED_INTERFACES::POSTRACKSTATUS"))
(defconstant zed_interfaces::PosTrackStatus::*FPS_TOO_LOW* 3)
(intern "*SEARCHING_FLOOR_PLANE*" (find-package "ZED_INTERFACES::POSTRACKSTATUS"))
(shadow '*SEARCHING_FLOOR_PLANE* (find-package "ZED_INTERFACES::POSTRACKSTATUS"))
(defconstant zed_interfaces::PosTrackStatus::*SEARCHING_FLOOR_PLANE* 3)

(defun zed_interfaces::PosTrackStatus-to-symbol (const)
  (cond
        ((= const 0) 'zed_interfaces::PosTrackStatus::*SEARCHING*)
        ((= const 1) 'zed_interfaces::PosTrackStatus::*OK*)
        ((= const 2) 'zed_interfaces::PosTrackStatus::*OFF*)
        ((= const 3) 'zed_interfaces::PosTrackStatus::*FPS_TOO_LOW*)
        ((= const 3) 'zed_interfaces::PosTrackStatus::*SEARCHING_FLOOR_PLANE*)
        (t nil)))

(defclass zed_interfaces::PosTrackStatus
  :super ros::object
  :slots (_status ))

(defmethod zed_interfaces::PosTrackStatus
  (:init
   (&key
    ((:status __status) 0)
    )
   (send-super :init)
   (setq _status (round __status))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; uint8 _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _status
       (write-byte _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get zed_interfaces::PosTrackStatus :md5sum-) "16c87ef5951f2667d385cacb152a0d50")
(setf (get zed_interfaces::PosTrackStatus :datatype-) "zed_interfaces/PosTrackStatus")
(setf (get zed_interfaces::PosTrackStatus :definition-)
      "# Status constants
# SEARCHING - The camera is searching for a previously known position to locate itself
# OK - Positional tracking is working normally
# OFF - Positional tracking is not enabled.
# FPS_TOO_LOW - Effective FPS is too low to give proper results for motion tracking. Consider using PERFORMANCES parameters (DEPTH_MODE_PERFORMANCE, low camera resolution (VGA,HD720))
# SEARCHING_FLOOR_PLANE - The camera is searching for the floor plane to locate itself related to it, the REFERENCE_FRAME::WORLD will be set afterward.
uint8 SEARCHING=0 
uint8 OK = 1
uint8 OFF = 2
uint8 FPS_TOO_LOW = 3
uint8 SEARCHING_FLOOR_PLANE = 3

# Status
uint8 status
")



(provide :zed_interfaces/PosTrackStatus "16c87ef5951f2667d385cacb152a0d50")


