; Auto-generated. Do not edit!


(cl:in-package antobot_msgs-srv)


;//! \htmlinclude softShutdown-request.msg.html

(cl:defclass <softShutdown-request> (roslisp-msg-protocol:ros-message)
  ((softshutdownreq
    :reader softshutdownreq
    :initarg :softshutdownreq
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass softShutdown-request (<softShutdown-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <softShutdown-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'softShutdown-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name antobot_msgs-srv:<softShutdown-request> is deprecated: use antobot_msgs-srv:softShutdown-request instead.")))

(cl:ensure-generic-function 'softshutdownreq-val :lambda-list '(m))
(cl:defmethod softshutdownreq-val ((m <softShutdown-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader antobot_msgs-srv:softshutdownreq-val is deprecated.  Use antobot_msgs-srv:softshutdownreq instead.")
  (softshutdownreq m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <softShutdown-request>) ostream)
  "Serializes a message object of type '<softShutdown-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'softshutdownreq) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <softShutdown-request>) istream)
  "Deserializes a message object of type '<softShutdown-request>"
    (cl:setf (cl:slot-value msg 'softshutdownreq) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<softShutdown-request>)))
  "Returns string type for a service object of type '<softShutdown-request>"
  "antobot_msgs/softShutdownRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'softShutdown-request)))
  "Returns string type for a service object of type 'softShutdown-request"
  "antobot_msgs/softShutdownRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<softShutdown-request>)))
  "Returns md5sum for a message object of type '<softShutdown-request>"
  "f4f225f161cdec955f047b31d2533a97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'softShutdown-request)))
  "Returns md5sum for a message object of type 'softShutdown-request"
  "f4f225f161cdec955f047b31d2533a97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<softShutdown-request>)))
  "Returns full string definition for message of type '<softShutdown-request>"
  (cl:format cl:nil "bool softshutdownreq~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'softShutdown-request)))
  "Returns full string definition for message of type 'softShutdown-request"
  (cl:format cl:nil "bool softshutdownreq~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <softShutdown-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <softShutdown-request>))
  "Converts a ROS message object to a list"
  (cl:list 'softShutdown-request
    (cl:cons ':softshutdownreq (softshutdownreq msg))
))
;//! \htmlinclude softShutdown-response.msg.html

(cl:defclass <softShutdown-response> (roslisp-msg-protocol:ros-message)
  ((responseBool
    :reader responseBool
    :initarg :responseBool
    :type cl:boolean
    :initform cl:nil)
   (responseString
    :reader responseString
    :initarg :responseString
    :type cl:string
    :initform ""))
)

(cl:defclass softShutdown-response (<softShutdown-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <softShutdown-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'softShutdown-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name antobot_msgs-srv:<softShutdown-response> is deprecated: use antobot_msgs-srv:softShutdown-response instead.")))

(cl:ensure-generic-function 'responseBool-val :lambda-list '(m))
(cl:defmethod responseBool-val ((m <softShutdown-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader antobot_msgs-srv:responseBool-val is deprecated.  Use antobot_msgs-srv:responseBool instead.")
  (responseBool m))

(cl:ensure-generic-function 'responseString-val :lambda-list '(m))
(cl:defmethod responseString-val ((m <softShutdown-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader antobot_msgs-srv:responseString-val is deprecated.  Use antobot_msgs-srv:responseString instead.")
  (responseString m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <softShutdown-response>) ostream)
  "Serializes a message object of type '<softShutdown-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'responseBool) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'responseString))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'responseString))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <softShutdown-response>) istream)
  "Deserializes a message object of type '<softShutdown-response>"
    (cl:setf (cl:slot-value msg 'responseBool) (cl:not (cl:zerop (cl:read-byte istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<softShutdown-response>)))
  "Returns string type for a service object of type '<softShutdown-response>"
  "antobot_msgs/softShutdownResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'softShutdown-response)))
  "Returns string type for a service object of type 'softShutdown-response"
  "antobot_msgs/softShutdownResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<softShutdown-response>)))
  "Returns md5sum for a message object of type '<softShutdown-response>"
  "f4f225f161cdec955f047b31d2533a97")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'softShutdown-response)))
  "Returns md5sum for a message object of type 'softShutdown-response"
  "f4f225f161cdec955f047b31d2533a97")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<softShutdown-response>)))
  "Returns full string definition for message of type '<softShutdown-response>"
  (cl:format cl:nil "bool responseBool~%string responseString~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'softShutdown-response)))
  "Returns full string definition for message of type 'softShutdown-response"
  (cl:format cl:nil "bool responseBool~%string responseString~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <softShutdown-response>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'responseString))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <softShutdown-response>))
  "Converts a ROS message object to a list"
  (cl:list 'softShutdown-response
    (cl:cons ':responseBool (responseBool msg))
    (cl:cons ':responseString (responseString msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'softShutdown)))
  'softShutdown-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'softShutdown)))
  'softShutdown-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'softShutdown)))
  "Returns string type for a service object of type '<softShutdown>"
  "antobot_msgs/softShutdown")