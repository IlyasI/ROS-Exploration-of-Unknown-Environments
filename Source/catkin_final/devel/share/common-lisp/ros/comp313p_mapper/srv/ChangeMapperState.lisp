; Auto-generated. Do not edit!


(cl:in-package comp313p_mapper-srv)


;//! \htmlinclude ChangeMapperState-request.msg.html

(cl:defclass <ChangeMapperState-request> (roslisp-msg-protocol:ros-message)
  ((enableMapping
    :reader enableMapping
    :initarg :enableMapping
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ChangeMapperState-request (<ChangeMapperState-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeMapperState-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeMapperState-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name comp313p_mapper-srv:<ChangeMapperState-request> is deprecated: use comp313p_mapper-srv:ChangeMapperState-request instead.")))

(cl:ensure-generic-function 'enableMapping-val :lambda-list '(m))
(cl:defmethod enableMapping-val ((m <ChangeMapperState-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_mapper-srv:enableMapping-val is deprecated.  Use comp313p_mapper-srv:enableMapping instead.")
  (enableMapping m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeMapperState-request>) ostream)
  "Serializes a message object of type '<ChangeMapperState-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'enableMapping) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeMapperState-request>) istream)
  "Deserializes a message object of type '<ChangeMapperState-request>"
    (cl:setf (cl:slot-value msg 'enableMapping) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeMapperState-request>)))
  "Returns string type for a service object of type '<ChangeMapperState-request>"
  "comp313p_mapper/ChangeMapperStateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeMapperState-request)))
  "Returns string type for a service object of type 'ChangeMapperState-request"
  "comp313p_mapper/ChangeMapperStateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeMapperState-request>)))
  "Returns md5sum for a message object of type '<ChangeMapperState-request>"
  "67481c27efef5721c8c4770c4dd3d307")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeMapperState-request)))
  "Returns md5sum for a message object of type 'ChangeMapperState-request"
  "67481c27efef5721c8c4770c4dd3d307")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeMapperState-request>)))
  "Returns full string definition for message of type '<ChangeMapperState-request>"
  (cl:format cl:nil "bool enableMapping~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeMapperState-request)))
  "Returns full string definition for message of type 'ChangeMapperState-request"
  (cl:format cl:nil "bool enableMapping~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeMapperState-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeMapperState-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeMapperState-request
    (cl:cons ':enableMapping (enableMapping msg))
))
;//! \htmlinclude ChangeMapperState-response.msg.html

(cl:defclass <ChangeMapperState-response> (roslisp-msg-protocol:ros-message)
  ((lastMapping
    :reader lastMapping
    :initarg :lastMapping
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ChangeMapperState-response (<ChangeMapperState-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ChangeMapperState-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ChangeMapperState-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name comp313p_mapper-srv:<ChangeMapperState-response> is deprecated: use comp313p_mapper-srv:ChangeMapperState-response instead.")))

(cl:ensure-generic-function 'lastMapping-val :lambda-list '(m))
(cl:defmethod lastMapping-val ((m <ChangeMapperState-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_mapper-srv:lastMapping-val is deprecated.  Use comp313p_mapper-srv:lastMapping instead.")
  (lastMapping m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ChangeMapperState-response>) ostream)
  "Serializes a message object of type '<ChangeMapperState-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'lastMapping) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ChangeMapperState-response>) istream)
  "Deserializes a message object of type '<ChangeMapperState-response>"
    (cl:setf (cl:slot-value msg 'lastMapping) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ChangeMapperState-response>)))
  "Returns string type for a service object of type '<ChangeMapperState-response>"
  "comp313p_mapper/ChangeMapperStateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeMapperState-response)))
  "Returns string type for a service object of type 'ChangeMapperState-response"
  "comp313p_mapper/ChangeMapperStateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ChangeMapperState-response>)))
  "Returns md5sum for a message object of type '<ChangeMapperState-response>"
  "67481c27efef5721c8c4770c4dd3d307")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ChangeMapperState-response)))
  "Returns md5sum for a message object of type 'ChangeMapperState-response"
  "67481c27efef5721c8c4770c4dd3d307")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ChangeMapperState-response>)))
  "Returns full string definition for message of type '<ChangeMapperState-response>"
  (cl:format cl:nil "bool lastMapping~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ChangeMapperState-response)))
  "Returns full string definition for message of type 'ChangeMapperState-response"
  (cl:format cl:nil "bool lastMapping~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ChangeMapperState-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ChangeMapperState-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ChangeMapperState-response
    (cl:cons ':lastMapping (lastMapping msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ChangeMapperState)))
  'ChangeMapperState-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ChangeMapperState)))
  'ChangeMapperState-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ChangeMapperState)))
  "Returns string type for a service object of type '<ChangeMapperState>"
  "comp313p_mapper/ChangeMapperState")