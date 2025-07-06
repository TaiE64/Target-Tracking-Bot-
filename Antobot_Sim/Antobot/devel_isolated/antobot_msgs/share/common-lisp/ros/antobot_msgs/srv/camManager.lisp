; Auto-generated. Do not edit!


(cl:in-package antobot_msgs-srv)


;//! \htmlinclude camManager-request.msg.html

(cl:defclass <camManager-request> (roslisp-msg-protocol:ros-message)
  ((camera_num
    :reader camera_num
    :initarg :camera_num
    :type cl:fixnum
    :initform 0)
   (command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0))
)

(cl:defclass camManager-request (<camManager-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <camManager-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'camManager-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name antobot_msgs-srv:<camManager-request> is deprecated: use antobot_msgs-srv:camManager-request instead.")))

(cl:ensure-generic-function 'camera_num-val :lambda-list '(m))
(cl:defmethod camera_num-val ((m <camManager-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader antobot_msgs-srv:camera_num-val is deprecated.  Use antobot_msgs-srv:camera_num instead.")
  (camera_num m))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <camManager-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader antobot_msgs-srv:command-val is deprecated.  Use antobot_msgs-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <camManager-request>) ostream)
  "Serializes a message object of type '<camManager-request>"
  (cl:let* ((signed (cl:slot-value msg 'camera_num)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <camManager-request>) istream)
  "Deserializes a message object of type '<camManager-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'camera_num) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<camManager-request>)))
  "Returns string type for a service object of type '<camManager-request>"
  "antobot_msgs/camManagerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'camManager-request)))
  "Returns string type for a service object of type 'camManager-request"
  "antobot_msgs/camManagerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<camManager-request>)))
  "Returns md5sum for a message object of type '<camManager-request>"
  "fc42ba797ab7c1398107c36a354e835f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'camManager-request)))
  "Returns md5sum for a message object of type 'camManager-request"
  "fc42ba797ab7c1398107c36a354e835f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<camManager-request>)))
  "Returns full string definition for message of type '<camManager-request>"
  (cl:format cl:nil "int8 camera_num		    # 0 - front, 1 - back, 2 - left, 3 - right~%int8 command			# 0 - close/turn off, 1 - launch ROS code, 2 - start recording video~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'camManager-request)))
  "Returns full string definition for message of type 'camManager-request"
  (cl:format cl:nil "int8 camera_num		    # 0 - front, 1 - back, 2 - left, 3 - right~%int8 command			# 0 - close/turn off, 1 - launch ROS code, 2 - start recording video~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <camManager-request>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <camManager-request>))
  "Converts a ROS message object to a list"
  (cl:list 'camManager-request
    (cl:cons ':camera_num (camera_num msg))
    (cl:cons ':command (command msg))
))
;//! \htmlinclude camManager-response.msg.html

(cl:defclass <camManager-response> (roslisp-msg-protocol:ros-message)
  ((responseCode
    :reader responseCode
    :initarg :responseCode
    :type cl:fixnum
    :initform 0)
   (responseString
    :reader responseString
    :initarg :responseString
    :type cl:string
    :initform ""))
)

(cl:defclass camManager-response (<camManager-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <camManager-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'camManager-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name antobot_msgs-srv:<camManager-response> is deprecated: use antobot_msgs-srv:camManager-response instead.")))

(cl:ensure-generic-function 'responseCode-val :lambda-list '(m))
(cl:defmethod responseCode-val ((m <camManager-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader antobot_msgs-srv:responseCode-val is deprecated.  Use antobot_msgs-srv:responseCode instead.")
  (responseCode m))

(cl:ensure-generic-function 'responseString-val :lambda-list '(m))
(cl:defmethod responseString-val ((m <camManager-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader antobot_msgs-srv:responseString-val is deprecated.  Use antobot_msgs-srv:responseString instead.")
  (responseString m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <camManager-response>) ostream)
  "Serializes a message object of type '<camManager-response>"
  (cl:let* ((signed (cl:slot-value msg 'responseCode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'responseString))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'responseString))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <camManager-response>) istream)
  "Deserializes a message object of type '<camManager-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'responseCode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'responseString) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'responseString) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<camManager-response>)))
  "Returns string type for a service object of type '<camManager-response>"
  "antobot_msgs/camManagerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'camManager-response)))
  "Returns string type for a service object of type 'camManager-response"
  "antobot_msgs/camManagerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<camManager-response>)))
  "Returns md5sum for a message object of type '<camManager-response>"
  "fc42ba797ab7c1398107c36a354e835f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'camManager-response)))
  "Returns md5sum for a message object of type 'camManager-response"
  "fc42ba797ab7c1398107c36a354e835f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<camManager-response>)))
  "Returns full string definition for message of type '<camManager-response>"
  (cl:format cl:nil "int8 responseCode		# 0 - success, -1 - failure~%string responseString   # Additional info~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'camManager-response)))
  "Returns full string definition for message of type 'camManager-response"
  (cl:format cl:nil "int8 responseCode		# 0 - success, -1 - failure~%string responseString   # Additional info~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <camManager-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'responseString))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <camManager-response>))
  "Converts a ROS message object to a list"
  (cl:list 'camManager-response
    (cl:cons ':responseCode (responseCode msg))
    (cl:cons ':responseString (responseString msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'camManager)))
  'camManager-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'camManager)))
  'camManager-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'camManager)))
  "Returns string type for a service object of type '<camManager>"
  "antobot_msgs/camManager")