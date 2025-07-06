; Auto-generated. Do not edit!


(cl:in-package antobot_msgs-msg)


;//! \htmlinclude UInt16_Array.msg.html

(cl:defclass <UInt16_Array> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass UInt16_Array (<UInt16_Array>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UInt16_Array>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UInt16_Array)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name antobot_msgs-msg:<UInt16_Array> is deprecated: use antobot_msgs-msg:UInt16_Array instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <UInt16_Array>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader antobot_msgs-msg:data-val is deprecated.  Use antobot_msgs-msg:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UInt16_Array>) ostream)
  "Serializes a message object of type '<UInt16_Array>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) ele) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) ele) ostream))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UInt16_Array>) istream)
  "Deserializes a message object of type '<UInt16_Array>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:aref vals i)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:aref vals i)) (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UInt16_Array>)))
  "Returns string type for a message object of type '<UInt16_Array>"
  "antobot_msgs/UInt16_Array")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UInt16_Array)))
  "Returns string type for a message object of type 'UInt16_Array"
  "antobot_msgs/UInt16_Array")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UInt16_Array>)))
  "Returns md5sum for a message object of type '<UInt16_Array>"
  "e066daa5966378a57445687eb65bfa3b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UInt16_Array)))
  "Returns md5sum for a message object of type 'UInt16_Array"
  "e066daa5966378a57445687eb65bfa3b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UInt16_Array>)))
  "Returns full string definition for message of type '<UInt16_Array>"
  (cl:format cl:nil "uint16[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UInt16_Array)))
  "Returns full string definition for message of type 'UInt16_Array"
  (cl:format cl:nil "uint16[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UInt16_Array>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UInt16_Array>))
  "Converts a ROS message object to a list"
  (cl:list 'UInt16_Array
    (cl:cons ':data (data msg))
))
