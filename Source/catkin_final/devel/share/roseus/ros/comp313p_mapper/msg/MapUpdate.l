;; Auto-generated. Do not edit!


(when (boundp 'comp313p_mapper::MapUpdate)
  (if (not (find-package "COMP313P_MAPPER"))
    (make-package "COMP313P_MAPPER"))
  (shadow 'MapUpdate (find-package "COMP313P_MAPPER")))
(unless (find-package "COMP313P_MAPPER::MAPUPDATE")
  (make-package "COMP313P_MAPPER::MAPUPDATE"))

(in-package "ROS")
;;//! \htmlinclude MapUpdate.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass comp313p_mapper::MapUpdate
  :super ros::object
  :slots (_header _isPriorMap _scale _extentInCells _resolution _occupancyGrid _deltaOccupancyGrid ))

(defmethod comp313p_mapper::MapUpdate
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:isPriorMap __isPriorMap) nil)
    ((:scale __scale) 0.0)
    ((:extentInCells __extentInCells) (make-array 0 :initial-element 0 :element-type :integer))
    ((:resolution __resolution) 0.0)
    ((:occupancyGrid __occupancyGrid) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:deltaOccupancyGrid __deltaOccupancyGrid) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _isPriorMap __isPriorMap)
   (setq _scale (float __scale))
   (setq _extentInCells __extentInCells)
   (setq _resolution (float __resolution))
   (setq _occupancyGrid __occupancyGrid)
   (setq _deltaOccupancyGrid __deltaOccupancyGrid)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:isPriorMap
   (&optional __isPriorMap)
   (if __isPriorMap (setq _isPriorMap __isPriorMap)) _isPriorMap)
  (:scale
   (&optional __scale)
   (if __scale (setq _scale __scale)) _scale)
  (:extentInCells
   (&optional __extentInCells)
   (if __extentInCells (setq _extentInCells __extentInCells)) _extentInCells)
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:occupancyGrid
   (&optional __occupancyGrid)
   (if __occupancyGrid (setq _occupancyGrid __occupancyGrid)) _occupancyGrid)
  (:deltaOccupancyGrid
   (&optional __deltaOccupancyGrid)
   (if __deltaOccupancyGrid (setq _deltaOccupancyGrid __deltaOccupancyGrid)) _deltaOccupancyGrid)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; bool _isPriorMap
    1
    ;; float32 _scale
    4
    ;; int16[] _extentInCells
    (* 2    (length _extentInCells)) 4
    ;; float32 _resolution
    4
    ;; float32[] _occupancyGrid
    (* 4    (length _occupancyGrid)) 4
    ;; float32[] _deltaOccupancyGrid
    (* 4    (length _deltaOccupancyGrid)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; bool _isPriorMap
       (if _isPriorMap (write-byte -1 s) (write-byte 0 s))
     ;; float32 _scale
       (sys::poke _scale (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; int16[] _extentInCells
     (write-long (length _extentInCells) s)
     (dotimes (i (length _extentInCells))
       (write-word (elt _extentInCells i) s)
       )
     ;; float32 _resolution
       (sys::poke _resolution (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _occupancyGrid
     (write-long (length _occupancyGrid) s)
     (dotimes (i (length _occupancyGrid))
       (sys::poke (elt _occupancyGrid i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[] _deltaOccupancyGrid
     (write-long (length _deltaOccupancyGrid) s)
     (dotimes (i (length _deltaOccupancyGrid))
       (sys::poke (elt _deltaOccupancyGrid i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; bool _isPriorMap
     (setq _isPriorMap (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _scale
     (setq _scale (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; int16[] _extentInCells
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _extentInCells (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _extentInCells i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;; float32 _resolution
     (setq _resolution (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _occupancyGrid
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _occupancyGrid (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _occupancyGrid i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; float32[] _deltaOccupancyGrid
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _deltaOccupancyGrid (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _deltaOccupancyGrid i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get comp313p_mapper::MapUpdate :md5sum-) "bb9eab5859acbeac865abd611e41d4b8")
(setf (get comp313p_mapper::MapUpdate :datatype-) "comp313p_mapper/MapUpdate")
(setf (get comp313p_mapper::MapUpdate :definition-)
      "Header header

bool isPriorMap

float32 scale
int16[] extentInCells
float32 resolution

float32[] occupancyGrid
float32[] deltaOccupancyGrid
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :comp313p_mapper/MapUpdate "bb9eab5859acbeac865abd611e41d4b8")


