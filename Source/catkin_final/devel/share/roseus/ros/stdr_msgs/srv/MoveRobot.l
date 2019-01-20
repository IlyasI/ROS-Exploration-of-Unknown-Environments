;; Auto-generated. Do not edit!


(when (boundp 'stdr_msgs::MoveRobot)
  (if (not (find-package "STDR_MSGS"))
    (make-package "STDR_MSGS"))
  (shadow 'MoveRobot (find-package "STDR_MSGS")))
(unless (find-package "STDR_MSGS::MOVEROBOT")
  (make-package "STDR_MSGS::MOVEROBOT"))
(unless (find-package "STDR_MSGS::MOVEROBOTREQUEST")
  (make-package "STDR_MSGS::MOVEROBOTREQUEST"))
(unless (find-package "STDR_MSGS::MOVEROBOTRESPONSE")
  (make-package "STDR_MSGS::MOVEROBOTRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass stdr_msgs::MoveRobotRequest
  :super ros::object
  :slots (_newPose ))

(defmethod stdr_msgs::MoveRobotRequest
  (:init
   (&key
    ((:newPose __newPose) (instance geometry_msgs::Pose2D :init))
    )
   (send-super :init)
   (setq _newPose __newPose)
   self)
  (:newPose
   (&rest __newPose)
   (if (keywordp (car __newPose))
       (send* _newPose __newPose)
     (progn
       (if __newPose (setq _newPose (car __newPose)))
       _newPose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose2D _newPose
    (send _newPose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose2D _newPose
       (send _newPose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose2D _newPose
     (send _newPose :deserialize buf ptr-) (incf ptr- (send _newPose :serialization-length))
   ;;
   self)
  )

(defclass stdr_msgs::MoveRobotResponse
  :super ros::object
  :slots ())

(defmethod stdr_msgs::MoveRobotResponse
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass stdr_msgs::MoveRobot
  :super ros::object
  :slots ())

(setf (get stdr_msgs::MoveRobot :md5sum-) "3f8cb1536a8bfe7e956ece9331b2cd07")
(setf (get stdr_msgs::MoveRobot :datatype-) "stdr_msgs/MoveRobot")
(setf (get stdr_msgs::MoveRobot :request) stdr_msgs::MoveRobotRequest)
(setf (get stdr_msgs::MoveRobot :response) stdr_msgs::MoveRobotResponse)

(defmethod stdr_msgs::MoveRobotRequest
  (:response () (instance stdr_msgs::MoveRobotResponse :init)))

(setf (get stdr_msgs::MoveRobotRequest :md5sum-) "3f8cb1536a8bfe7e956ece9331b2cd07")
(setf (get stdr_msgs::MoveRobotRequest :datatype-) "stdr_msgs/MoveRobotRequest")
(setf (get stdr_msgs::MoveRobotRequest :definition-)
      "geometry_msgs/Pose2D newPose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---

")

(setf (get stdr_msgs::MoveRobotResponse :md5sum-) "3f8cb1536a8bfe7e956ece9331b2cd07")
(setf (get stdr_msgs::MoveRobotResponse :datatype-) "stdr_msgs/MoveRobotResponse")
(setf (get stdr_msgs::MoveRobotResponse :definition-)
      "geometry_msgs/Pose2D newPose

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
---

")



(provide :stdr_msgs/MoveRobot "3f8cb1536a8bfe7e956ece9331b2cd07")


