; Auto-generated. Do not edit!


(cl:in-package zed_interfaces-msg)


;//! \htmlinclude PosTrackStatus.msg.html

(cl:defclass <PosTrackStatus> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PosTrackStatus (<PosTrackStatus>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PosTrackStatus>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PosTrackStatus)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zed_interfaces-msg:<PosTrackStatus> is deprecated: use zed_interfaces-msg:PosTrackStatus instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <PosTrackStatus>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zed_interfaces-msg:status-val is deprecated.  Use zed_interfaces-msg:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<PosTrackStatus>)))
    "Constants for message type '<PosTrackStatus>"
  '((:SEARCHING . 0)
    (:OK . 1)
    (:OFF . 2)
    (:FPS_TOO_LOW . 3)
    (:SEARCHING_FLOOR_PLANE . 3))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'PosTrackStatus)))
    "Constants for message type 'PosTrackStatus"
  '((:SEARCHING . 0)
    (:OK . 1)
    (:OFF . 2)
    (:FPS_TOO_LOW . 3)
    (:SEARCHING_FLOOR_PLANE . 3))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PosTrackStatus>) ostream)
  "Serializes a message object of type '<PosTrackStatus>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PosTrackStatus>) istream)
  "Deserializes a message object of type '<PosTrackStatus>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'status)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PosTrackStatus>)))
  "Returns string type for a message object of type '<PosTrackStatus>"
  "zed_interfaces/PosTrackStatus")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PosTrackStatus)))
  "Returns string type for a message object of type 'PosTrackStatus"
  "zed_interfaces/PosTrackStatus")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PosTrackStatus>)))
  "Returns md5sum for a message object of type '<PosTrackStatus>"
  "16c87ef5951f2667d385cacb152a0d50")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PosTrackStatus)))
  "Returns md5sum for a message object of type 'PosTrackStatus"
  "16c87ef5951f2667d385cacb152a0d50")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PosTrackStatus>)))
  "Returns full string definition for message of type '<PosTrackStatus>"
  (cl:format cl:nil "# Status constants~%# SEARCHING - The camera is searching for a previously known position to locate itself~%# OK - Positional tracking is working normally~%# OFF - Positional tracking is not enabled.~%# FPS_TOO_LOW - Effective FPS is too low to give proper results for motion tracking. Consider using PERFORMANCES parameters (DEPTH_MODE_PERFORMANCE, low camera resolution (VGA,HD720))~%# SEARCHING_FLOOR_PLANE - The camera is searching for the floor plane to locate itself related to it, the REFERENCE_FRAME::WORLD will be set afterward.~%uint8 SEARCHING=0 ~%uint8 OK = 1~%uint8 OFF = 2~%uint8 FPS_TOO_LOW = 3~%uint8 SEARCHING_FLOOR_PLANE = 3~%~%# Status~%uint8 status~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PosTrackStatus)))
  "Returns full string definition for message of type 'PosTrackStatus"
  (cl:format cl:nil "# Status constants~%# SEARCHING - The camera is searching for a previously known position to locate itself~%# OK - Positional tracking is working normally~%# OFF - Positional tracking is not enabled.~%# FPS_TOO_LOW - Effective FPS is too low to give proper results for motion tracking. Consider using PERFORMANCES parameters (DEPTH_MODE_PERFORMANCE, low camera resolution (VGA,HD720))~%# SEARCHING_FLOOR_PLANE - The camera is searching for the floor plane to locate itself related to it, the REFERENCE_FRAME::WORLD will be set afterward.~%uint8 SEARCHING=0 ~%uint8 OK = 1~%uint8 OFF = 2~%uint8 FPS_TOO_LOW = 3~%uint8 SEARCHING_FLOOR_PLANE = 3~%~%# Status~%uint8 status~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PosTrackStatus>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PosTrackStatus>))
  "Converts a ROS message object to a list"
  (cl:list 'PosTrackStatus
    (cl:cons ':status (status msg))
))
