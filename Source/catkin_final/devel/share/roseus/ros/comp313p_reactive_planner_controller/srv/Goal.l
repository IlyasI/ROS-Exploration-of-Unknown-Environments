;; Auto-generated. Do not edit!


(when (boundp 'comp313p_reactive_planner_controller::Goal)
  (if (not (find-package "COMP313P_REACTIVE_PLANNER_CONTROLLER"))
    (make-package "COMP313P_REACTIVE_PLANNER_CONTROLLER"))
  (shadow 'Goal (find-package "COMP313P_REACTIVE_PLANNER_CONTROLLER")))
(unless (find-package "COMP313P_REACTIVE_PLANNER_CONTROLLER::GOAL")
  (make-package "COMP313P_REACTIVE_PLANNER_CONTROLLER::GOAL"))
(unless (find-package "COMP313P_REACTIVE_PLANNER_CONTROLLER::GOALREQUEST")
  (make-package "COMP313P_REACTIVE_PLANNER_CONTROLLER::GOALREQUEST"))
(unless (find-package "COMP313P_REACTIVE_PLANNER_CONTROLLER::GOALRESPONSE")
  (make-package "COMP313P_REACTIVE_PLANNER_CONTROLLER::GOALRESPONSE"))

(in-package "ROS")





(defclass comp313p_reactive_planner_controller::GoalRequest
  :super ros::object
  :slots (_x _y _theta ))

(defmethod comp313p_reactive_planner_controller::GoalRequest
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:theta __theta) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _theta (float __theta))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:theta
   (&optional __theta)
   (if __theta (setq _theta __theta)) _theta)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _theta
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _theta
       (sys::poke _theta (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _theta
     (setq _theta (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass comp313p_reactive_planner_controller::GoalResponse
  :super ros::object
  :slots (_reachedGoal ))

(defmethod comp313p_reactive_planner_controller::GoalResponse
  (:init
   (&key
    ((:reachedGoal __reachedGoal) nil)
    )
   (send-super :init)
   (setq _reachedGoal __reachedGoal)
   self)
  (:reachedGoal
   (&optional __reachedGoal)
   (if __reachedGoal (setq _reachedGoal __reachedGoal)) _reachedGoal)
  (:serialization-length
   ()
   (+
    ;; bool _reachedGoal
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _reachedGoal
       (if _reachedGoal (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _reachedGoal
     (setq _reachedGoal (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass comp313p_reactive_planner_controller::Goal
  :super ros::object
  :slots ())

(setf (get comp313p_reactive_planner_controller::Goal :md5sum-) "b457b1c81af64c78b366c8737f41a06f")
(setf (get comp313p_reactive_planner_controller::Goal :datatype-) "comp313p_reactive_planner_controller/Goal")
(setf (get comp313p_reactive_planner_controller::Goal :request) comp313p_reactive_planner_controller::GoalRequest)
(setf (get comp313p_reactive_planner_controller::Goal :response) comp313p_reactive_planner_controller::GoalResponse)

(defmethod comp313p_reactive_planner_controller::GoalRequest
  (:response () (instance comp313p_reactive_planner_controller::GoalResponse :init)))

(setf (get comp313p_reactive_planner_controller::GoalRequest :md5sum-) "b457b1c81af64c78b366c8737f41a06f")
(setf (get comp313p_reactive_planner_controller::GoalRequest :datatype-) "comp313p_reactive_planner_controller/GoalRequest")
(setf (get comp313p_reactive_planner_controller::GoalRequest :definition-)
      "float32 x
float32 y
float32 theta
---
bool reachedGoal

")

(setf (get comp313p_reactive_planner_controller::GoalResponse :md5sum-) "b457b1c81af64c78b366c8737f41a06f")
(setf (get comp313p_reactive_planner_controller::GoalResponse :datatype-) "comp313p_reactive_planner_controller/GoalResponse")
(setf (get comp313p_reactive_planner_controller::GoalResponse :definition-)
      "float32 x
float32 y
float32 theta
---
bool reachedGoal

")



(provide :comp313p_reactive_planner_controller/Goal "b457b1c81af64c78b366c8737f41a06f")


