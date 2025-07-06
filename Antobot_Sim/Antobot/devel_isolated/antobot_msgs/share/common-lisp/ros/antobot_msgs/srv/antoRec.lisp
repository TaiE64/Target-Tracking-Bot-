; Auto-generated. Do not edit!


(cl:in-package antobot_msgs-srv)


;//! \htmlinclude antoRec-request.msg.html

(cl:defclass <antoRec-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:fixnum
    :initform 0))
)

(cl:defclass antoRec-request (<antoRec-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <antoRec-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'antoRec-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name antobot_msgs-srv:<antoRec-request> is deprecated: use antobot_msgs-srv:antoRec-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <antoRec-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader antobot_msgs-srv:command-val is deprecated.  Use antobot_msgs-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <antoRec-request>) ostream)
  "Serializes a message object of type '<antoRec-request>"
  (cl:let* ((signed (cl:slot-value msg 'command)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <antoRec-request>) istream)
  "Deserializes a message object of type '<antoRec-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<antoRec-request>)))
  "Returns string type for a service object of type '<antoRec-request>"
  "antobot_msgs/antoRecRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'antoRec-request)))
  "Returns string type for a service object of type 'antoRec-request"
  "antobot_msgs/antoRecRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<antoRec-request>)))
  "Returns md5sum for a message object of type '<antoRec-request>"
  "d5a7288f1d26019f672552946e4bed3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'antoRec-request)))
  "Returns md5sum for a message object of type 'antoRec-request"
  "d5a7288f1d26019f672552946e4bed3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<antoRec-request>)))
  "Returns full string definition for message of type '<antoRec-request>"
  (cl:format cl:nil "int8 command	# 0 - open cam 1 - close cam, 2 - start recording, 3 - stop recording~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'antoRec-request)))
  "Returns full string definition for message of type 'antoRec-request"
  (cl:format cl:nil "int8 command	# 0 - open cam 1 - close cam, 2 - start recording, 3 - stop recording~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <antoRec-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <antoRec-request>))
  "Converts a ROS message object to a list"
  (cl:list 'antoRec-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude antoRec-response.msg.html

(cl:defclass <antoRec-response> (roslisp-msg-protocol:ros-message)
  ((responseCode
    :reader responseCode
    :initarg :responseCode
    :type cl:boolean
    :initform cl:nil)
   (responseString
    :reader responseString
    :initarg :responseString
    :type cl:string
    :initform ""))
)

(cl:defclass antoRec-response (<antoRec-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <antoRec-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'antoRec-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name antobot_msgs-srv:<antoRec-response> is deprecated: use antobot_msgs-srv:antoRec-response instead.")))

(cl:ensure-generic-function 'responseCode-val :lambda-list '(m))
(cl:defmethod responseCode-val ((m <antoRec-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader antobot_msgs-srv:responseCode-val is deprecated.  Use antobot_msgs-srv:responseCode instead.")
  (responseCode m))

(cl:ensure-generic-function 'responseString-val :lambda-list '(m))
(cl:defmethod responseString-val ((m <antoRec-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader antobot_msgs-srv:responseString-val is deprecated.  Use antobot_msgs-srv:responseString instead.")
  (responseString m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <antoRec-response>) ostream)
  "Serializes a message object of type '<antoRec-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'responseCode) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'responseString))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'responseString))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <antoRec-response>) istream)
  "Deserializes a message object of type '<antoRec-response>"
    (cl:setf (cl:slot-value msg 'responseCode) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<antoRec-response>)))
  "Returns string type for a service object of type '<antoRec-response>"
  "antobot_msgs/antoRecResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'antoRec-response)))
  "Returns string type for a service object of type 'antoRec-response"
  "antobot_msgs/antoRecResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<antoRec-response>)))
  "Returns md5sum for a message object of type '<antoRec-response>"
  "d5a7288f1d26019f672552946e4bed3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'antoRec-response)))
  "Returns md5sum for a message object of type 'antoRec-response"
  "d5a7288f1d26019f672552946e4bed3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<antoRec-response>)))
  "Returns full string definition for message of type '<antoRec-response>"
  (cl:format cl:nil "bool responseCode		# False - failure, True - success~%string responseString	# Additional info~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'antoRec-response)))
  "Returns full string definition for message of type 'antoRec-response"
  (cl:format cl:nil "bool responseCode		# False - failure, True - success~%string responseString	# Additional info~%~%~%~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <antoRec-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'responseString))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <antoRec-response>))
  "Converts a ROS message object to a list"
  (cl:list 'antoRec-response
    (cl:cons ':responseCode (responseCode msg))
    (cl:cons ':responseString (responseString msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'antoRec)))
  'antoRec-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'antoRec)))
  'antoRec-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'antoRec)))
  "Returns string type for a service object of type '<antoRec>"
  "antobot_msgs/antoRec")