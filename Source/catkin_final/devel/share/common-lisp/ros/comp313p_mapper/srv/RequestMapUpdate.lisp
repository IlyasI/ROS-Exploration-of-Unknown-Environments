; Auto-generated. Do not edit!


(cl:in-package comp313p_mapper-srv)


;//! \htmlinclude RequestMapUpdate-request.msg.html

(cl:defclass <RequestMapUpdate-request> (roslisp-msg-protocol:ros-message)
  ((deltaOccupancyGridRequired
    :reader deltaOccupancyGridRequired
    :initarg :deltaOccupancyGridRequired
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RequestMapUpdate-request (<RequestMapUpdate-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RequestMapUpdate-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RequestMapUpdate-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name comp313p_mapper-srv:<RequestMapUpdate-request> is deprecated: use comp313p_mapper-srv:RequestMapUpdate-request instead.")))

(cl:ensure-generic-function 'deltaOccupancyGridRequired-val :lambda-list '(m))
(cl:defmethod deltaOccupancyGridRequired-val ((m <RequestMapUpdate-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_mapper-srv:deltaOccupancyGridRequired-val is deprecated.  Use comp313p_mapper-srv:deltaOccupancyGridRequired instead.")
  (deltaOccupancyGridRequired m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RequestMapUpdate-request>) ostream)
  "Serializes a message object of type '<RequestMapUpdate-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'deltaOccupancyGridRequired) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RequestMapUpdate-request>) istream)
  "Deserializes a message object of type '<RequestMapUpdate-request>"
    (cl:setf (cl:slot-value msg 'deltaOccupancyGridRequired) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RequestMapUpdate-request>)))
  "Returns string type for a service object of type '<RequestMapUpdate-request>"
  "comp313p_mapper/RequestMapUpdateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RequestMapUpdate-request)))
  "Returns string type for a service object of type 'RequestMapUpdate-request"
  "comp313p_mapper/RequestMapUpdateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RequestMapUpdate-request>)))
  "Returns md5sum for a message object of type '<RequestMapUpdate-request>"
  "e5aa3588d7db3769375365d7ca3672e4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RequestMapUpdate-request)))
  "Returns md5sum for a message object of type 'RequestMapUpdate-request"
  "e5aa3588d7db3769375365d7ca3672e4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RequestMapUpdate-request>)))
  "Returns full string definition for message of type '<RequestMapUpdate-request>"
  (cl:format cl:nil "bool deltaOccupancyGridRequired~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RequestMapUpdate-request)))
  "Returns full string definition for message of type 'RequestMapUpdate-request"
  (cl:format cl:nil "bool deltaOccupancyGridRequired~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RequestMapUpdate-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RequestMapUpdate-request>))
  "Converts a ROS message object to a list"
  (cl:list 'RequestMapUpdate-request
    (cl:cons ':deltaOccupancyGridRequired (deltaOccupancyGridRequired msg))
))
;//! \htmlinclude RequestMapUpdate-response.msg.html

(cl:defclass <RequestMapUpdate-response> (roslisp-msg-protocol:ros-message)
  ((initialMapUpdate
    :reader initialMapUpdate
    :initarg :initialMapUpdate
    :type comp313p_mapper-msg:MapUpdate
    :initform (cl:make-instance 'comp313p_mapper-msg:MapUpdate)))
)

(cl:defclass RequestMapUpdate-response (<RequestMapUpdate-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RequestMapUpdate-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RequestMapUpdate-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name comp313p_mapper-srv:<RequestMapUpdate-response> is deprecated: use comp313p_mapper-srv:RequestMapUpdate-response instead.")))

(cl:ensure-generic-function 'initialMapUpdate-val :lambda-list '(m))
(cl:defmethod initialMapUpdate-val ((m <RequestMapUpdate-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_mapper-srv:initialMapUpdate-val is deprecated.  Use comp313p_mapper-srv:initialMapUpdate instead.")
  (initialMapUpdate m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RequestMapUpdate-response>) ostream)
  "Serializes a message object of type '<RequestMapUpdate-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'initialMapUpdate) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RequestMapUpdate-response>) istream)
  "Deserializes a message object of type '<RequestMapUpdate-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'initialMapUpdate) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RequestMapUpdate-response>)))
  "Returns string type for a service object of type '<RequestMapUpdate-response>"
  "comp313p_mapper/RequestMapUpdateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RequestMapUpdate-response)))
  "Returns string type for a service object of type 'RequestMapUpdate-response"
  "comp313p_mapper/RequestMapUpdateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RequestMapUpdate-response>)))
  "Returns md5sum for a message object of type '<RequestMapUpdate-response>"
  "e5aa3588d7db3769375365d7ca3672e4")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RequestMapUpdate-response)))
  "Returns md5sum for a message object of type 'RequestMapUpdate-response"
  "e5aa3588d7db3769375365d7ca3672e4")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RequestMapUpdate-response>)))
  "Returns full string definition for message of type '<RequestMapUpdate-response>"
  (cl:format cl:nil "comp313p_mapper/MapUpdate initialMapUpdate~%~%================================================================================~%MSG: comp313p_mapper/MapUpdate~%Header header~%~%bool isPriorMap~%~%float32 scale~%int16[] extentInCells~%float32 resolution~%~%float32[] occupancyGrid~%float32[] deltaOccupancyGrid~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RequestMapUpdate-response)))
  "Returns full string definition for message of type 'RequestMapUpdate-response"
  (cl:format cl:nil "comp313p_mapper/MapUpdate initialMapUpdate~%~%================================================================================~%MSG: comp313p_mapper/MapUpdate~%Header header~%~%bool isPriorMap~%~%float32 scale~%int16[] extentInCells~%float32 resolution~%~%float32[] occupancyGrid~%float32[] deltaOccupancyGrid~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RequestMapUpdate-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'initialMapUpdate))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RequestMapUpdate-response>))
  "Converts a ROS message object to a list"
  (cl:list 'RequestMapUpdate-response
    (cl:cons ':initialMapUpdate (initialMapUpdate msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'RequestMapUpdate)))
  'RequestMapUpdate-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'RequestMapUpdate)))
  'RequestMapUpdate-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RequestMapUpdate)))
  "Returns string type for a service object of type '<RequestMapUpdate>"
  "comp313p_mapper/RequestMapUpdate")