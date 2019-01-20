; Auto-generated. Do not edit!


(cl:in-package comp313p_reactive_planner_controller-srv)


;//! \htmlinclude Goal-request.msg.html

(cl:defclass <Goal-request> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (theta
    :reader theta
    :initarg :theta
    :type cl:float
    :initform 0.0))
)

(cl:defclass Goal-request (<Goal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Goal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Goal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name comp313p_reactive_planner_controller-srv:<Goal-request> is deprecated: use comp313p_reactive_planner_controller-srv:Goal-request instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Goal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_reactive_planner_controller-srv:x-val is deprecated.  Use comp313p_reactive_planner_controller-srv:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Goal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_reactive_planner_controller-srv:y-val is deprecated.  Use comp313p_reactive_planner_controller-srv:y instead.")
  (y m))

(cl:ensure-generic-function 'theta-val :lambda-list '(m))
(cl:defmethod theta-val ((m <Goal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_reactive_planner_controller-srv:theta-val is deprecated.  Use comp313p_reactive_planner_controller-srv:theta instead.")
  (theta m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Goal-request>) ostream)
  "Serializes a message object of type '<Goal-request>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'theta))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Goal-request>) istream)
  "Deserializes a message object of type '<Goal-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'theta) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Goal-request>)))
  "Returns string type for a service object of type '<Goal-request>"
  "comp313p_reactive_planner_controller/GoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Goal-request)))
  "Returns string type for a service object of type 'Goal-request"
  "comp313p_reactive_planner_controller/GoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Goal-request>)))
  "Returns md5sum for a message object of type '<Goal-request>"
  "b457b1c81af64c78b366c8737f41a06f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Goal-request)))
  "Returns md5sum for a message object of type 'Goal-request"
  "b457b1c81af64c78b366c8737f41a06f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Goal-request>)))
  "Returns full string definition for message of type '<Goal-request>"
  (cl:format cl:nil "float32 x~%float32 y~%float32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Goal-request)))
  "Returns full string definition for message of type 'Goal-request"
  (cl:format cl:nil "float32 x~%float32 y~%float32 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Goal-request>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Goal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Goal-request
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':theta (theta msg))
))
;//! \htmlinclude Goal-response.msg.html

(cl:defclass <Goal-response> (roslisp-msg-protocol:ros-message)
  ((reachedGoal
    :reader reachedGoal
    :initarg :reachedGoal
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Goal-response (<Goal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Goal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Goal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name comp313p_reactive_planner_controller-srv:<Goal-response> is deprecated: use comp313p_reactive_planner_controller-srv:Goal-response instead.")))

(cl:ensure-generic-function 'reachedGoal-val :lambda-list '(m))
(cl:defmethod reachedGoal-val ((m <Goal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader comp313p_reactive_planner_controller-srv:reachedGoal-val is deprecated.  Use comp313p_reactive_planner_controller-srv:reachedGoal instead.")
  (reachedGoal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Goal-response>) ostream)
  "Serializes a message object of type '<Goal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'reachedGoal) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Goal-response>) istream)
  "Deserializes a message object of type '<Goal-response>"
    (cl:setf (cl:slot-value msg 'reachedGoal) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Goal-response>)))
  "Returns string type for a service object of type '<Goal-response>"
  "comp313p_reactive_planner_controller/GoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Goal-response)))
  "Returns string type for a service object of type 'Goal-response"
  "comp313p_reactive_planner_controller/GoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Goal-response>)))
  "Returns md5sum for a message object of type '<Goal-response>"
  "b457b1c81af64c78b366c8737f41a06f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Goal-response)))
  "Returns md5sum for a message object of type 'Goal-response"
  "b457b1c81af64c78b366c8737f41a06f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Goal-response>)))
  "Returns full string definition for message of type '<Goal-response>"
  (cl:format cl:nil "bool reachedGoal~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Goal-response)))
  "Returns full string definition for message of type 'Goal-response"
  (cl:format cl:nil "bool reachedGoal~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Goal-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Goal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Goal-response
    (cl:cons ':reachedGoal (reachedGoal msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Goal)))
  'Goal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Goal)))
  'Goal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Goal)))
  "Returns string type for a service object of type '<Goal>"
  "comp313p_reactive_planner_controller/Goal")