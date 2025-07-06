; Auto-generated. Do not edit!


(cl:in-package zed_interfaces-srv)


;//! \htmlinclude set_roi-request.msg.html

(cl:defclass <set_roi-request> (roslisp-msg-protocol:ros-message)
  ((roi
    :reader roi
    :initarg :roi
    :type cl:string
    :initform ""))
)

(cl:defclass set_roi-request (<set_roi-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_roi-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_roi-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zed_interfaces-srv:<set_roi-request> is deprecated: use zed_interfaces-srv:set_roi-request instead.")))

(cl:ensure-generic-function 'roi-val :lambda-list '(m))
(cl:defmethod roi-val ((m <set_roi-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zed_interfaces-srv:roi-val is deprecated.  Use zed_interfaces-srv:roi instead.")
  (roi m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_roi-request>) ostream)
  "Serializes a message object of type '<set_roi-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'roi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'roi))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_roi-request>) istream)
  "Deserializes a message object of type '<set_roi-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'roi) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'roi) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_roi-request>)))
  "Returns string type for a service object of type '<set_roi-request>"
  "zed_interfaces/set_roiRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_roi-request)))
  "Returns string type for a service object of type 'set_roi-request"
  "zed_interfaces/set_roiRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_roi-request>)))
  "Returns md5sum for a message object of type '<set_roi-request>"
  "4d207dda349313cd8eabd3b09064e700")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_roi-request)))
  "Returns md5sum for a message object of type 'set_roi-request"
  "4d207dda349313cd8eabd3b09064e700")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_roi-request>)))
  "Returns full string definition for message of type '<set_roi-request>"
  (cl:format cl:nil "# Set the Region of Interest for ZED SDK computing~%~%# Region of interest polygon as an array of normalized vertices. e.g. \"[[0.5,0.25],[0.75,0.5],[0.5,0.75],[0.25,0.5]]\"~%# You can use~%string roi~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_roi-request)))
  "Returns full string definition for message of type 'set_roi-request"
  (cl:format cl:nil "# Set the Region of Interest for ZED SDK computing~%~%# Region of interest polygon as an array of normalized vertices. e.g. \"[[0.5,0.25],[0.75,0.5],[0.5,0.75],[0.25,0.5]]\"~%# You can use~%string roi~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_roi-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'roi))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_roi-request>))
  "Converts a ROS message object to a list"
  (cl:list 'set_roi-request
    (cl:cons ':roi (roi msg))
))
;//! \htmlinclude set_roi-response.msg.html

(cl:defclass <set_roi-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (message
    :reader message
    :initarg :message
    :type cl:string
    :initform ""))
)

(cl:defclass set_roi-response (<set_roi-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <set_roi-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'set_roi-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zed_interfaces-srv:<set_roi-response> is deprecated: use zed_interfaces-srv:set_roi-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <set_roi-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zed_interfaces-srv:success-val is deprecated.  Use zed_interfaces-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'message-val :lambda-list '(m))
(cl:defmethod message-val ((m <set_roi-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zed_interfaces-srv:message-val is deprecated.  Use zed_interfaces-srv:message instead.")
  (message m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <set_roi-response>) ostream)
  "Serializes a message object of type '<set_roi-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'message))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'message))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <set_roi-response>) istream)
  "Deserializes a message object of type '<set_roi-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'message) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'message) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<set_roi-response>)))
  "Returns string type for a service object of type '<set_roi-response>"
  "zed_interfaces/set_roiResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_roi-response)))
  "Returns string type for a service object of type 'set_roi-response"
  "zed_interfaces/set_roiResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<set_roi-response>)))
  "Returns md5sum for a message object of type '<set_roi-response>"
  "4d207dda349313cd8eabd3b09064e700")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'set_roi-response)))
  "Returns md5sum for a message object of type 'set_roi-response"
  "4d207dda349313cd8eabd3b09064e700")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<set_roi-response>)))
  "Returns full string definition for message of type '<set_roi-response>"
  (cl:format cl:nil "bool success   # indicate successful run of service~%string message # informational, e.g. for error messages~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'set_roi-response)))
  "Returns full string definition for message of type 'set_roi-response"
  (cl:format cl:nil "bool success   # indicate successful run of service~%string message # informational, e.g. for error messages~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <set_roi-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'message))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <set_roi-response>))
  "Converts a ROS message object to a list"
  (cl:list 'set_roi-response
    (cl:cons ':success (success msg))
    (cl:cons ':message (message msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'set_roi)))
  'set_roi-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'set_roi)))
  'set_roi-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'set_roi)))
  "Returns string type for a service object of type '<set_roi>"
  "zed_interfaces/set_roi")