; Auto-generated. Do not edit!


(cl:in-package zed_interfaces-srv)


;//! \htmlinclude reset_roi-request.msg.html

(cl:defclass <reset_roi-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass reset_roi-request (<reset_roi-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <reset_roi-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'reset_roi-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zed_interfaces-srv:<reset_roi-request> is deprecated: use zed_interfaces-srv:reset_roi-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <reset_roi-request>) ostream)
  "Serializes a message object of type '<reset_roi-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <reset_roi-request>) istream)
  "Deserializes a message object of type '<reset_roi-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<reset_roi-request>)))
  "Returns string type for a service object of type '<reset_roi-request>"
  "zed_interfaces/reset_roiRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reset_roi-request)))
  "Returns string type for a service object of type 'reset_roi-request"
  "zed_interfaces/reset_roiRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<reset_roi-request>)))
  "Returns md5sum for a message object of type '<reset_roi-request>"
  "e1e87fc9e9e6c154eca93b9fa292cc05")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'reset_roi-request)))
  "Returns md5sum for a message object of type 'reset_roi-request"
  "e1e87fc9e9e6c154eca93b9fa292cc05")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<reset_roi-request>)))
  "Returns full string definition for message of type '<reset_roi-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'reset_roi-request)))
  "Returns full string definition for message of type 'reset_roi-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <reset_roi-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <reset_roi-request>))
  "Converts a ROS message object to a list"
  (cl:list 'reset_roi-request
))
;//! \htmlinclude reset_roi-response.msg.html

(cl:defclass <reset_roi-response> (roslisp-msg-protocol:ros-message)
  ((reset_done
    :reader reset_done
    :initarg :reset_done
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass reset_roi-response (<reset_roi-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <reset_roi-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'reset_roi-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name zed_interfaces-srv:<reset_roi-response> is deprecated: use zed_interfaces-srv:reset_roi-response instead.")))

(cl:ensure-generic-function 'reset_done-val :lambda-list '(m))
(cl:defmethod reset_done-val ((m <reset_roi-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader zed_interfaces-srv:reset_done-val is deprecated.  Use zed_interfaces-srv:reset_done instead.")
  (reset_done m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <reset_roi-response>) ostream)
  "Serializes a message object of type '<reset_roi-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reset_done) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <reset_roi-response>) istream)
  "Deserializes a message object of type '<reset_roi-response>"
    (cl:setf (cl:slot-value msg 'reset_done) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<reset_roi-response>)))
  "Returns string type for a service object of type '<reset_roi-response>"
  "zed_interfaces/reset_roiResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reset_roi-response)))
  "Returns string type for a service object of type 'reset_roi-response"
  "zed_interfaces/reset_roiResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<reset_roi-response>)))
  "Returns md5sum for a message object of type '<reset_roi-response>"
  "e1e87fc9e9e6c154eca93b9fa292cc05")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'reset_roi-response)))
  "Returns md5sum for a message object of type 'reset_roi-response"
  "e1e87fc9e9e6c154eca93b9fa292cc05")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<reset_roi-response>)))
  "Returns full string definition for message of type '<reset_roi-response>"
  (cl:format cl:nil "bool reset_done~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'reset_roi-response)))
  "Returns full string definition for message of type 'reset_roi-response"
  (cl:format cl:nil "bool reset_done~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <reset_roi-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <reset_roi-response>))
  "Converts a ROS message object to a list"
  (cl:list 'reset_roi-response
    (cl:cons ':reset_done (reset_done msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'reset_roi)))
  'reset_roi-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'reset_roi)))
  'reset_roi-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'reset_roi)))
  "Returns string type for a service object of type '<reset_roi>"
  "zed_interfaces/reset_roi")