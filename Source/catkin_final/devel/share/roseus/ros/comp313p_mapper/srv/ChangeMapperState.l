;; Auto-generated. Do not edit!


(when (boundp 'comp313p_mapper::ChangeMapperState)
  (if (not (find-package "COMP313P_MAPPER"))
    (make-package "COMP313P_MAPPER"))
  (shadow 'ChangeMapperState (find-package "COMP313P_MAPPER")))
(unless (find-package "COMP313P_MAPPER::CHANGEMAPPERSTATE")
  (make-package "COMP313P_MAPPER::CHANGEMAPPERSTATE"))
(unless (find-package "COMP313P_MAPPER::CHANGEMAPPERSTATEREQUEST")
  (make-package "COMP313P_MAPPER::CHANGEMAPPERSTATEREQUEST"))
(unless (find-package "COMP313P_MAPPER::CHANGEMAPPERSTATERESPONSE")
  (make-package "COMP313P_MAPPER::CHANGEMAPPERSTATERESPONSE"))

(in-package "ROS")





(defclass comp313p_mapper::ChangeMapperStateRequest
  :super ros::object
  :slots (_enableMapping ))

(defmethod comp313p_mapper::ChangeMapperStateRequest
  (:init
   (&key
    ((:enableMapping __enableMapping) nil)
    )
   (send-super :init)
   (setq _enableMapping __enableMapping)
   self)
  (:enableMapping
   (&optional __enableMapping)
   (if __enableMapping (setq _enableMapping __enableMapping)) _enableMapping)
  (:serialization-length
   ()
   (+
    ;; bool _enableMapping
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _enableMapping
       (if _enableMapping (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _enableMapping
     (setq _enableMapping (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass comp313p_mapper::ChangeMapperStateResponse
  :super ros::object
  :slots (_lastMapping ))

(defmethod comp313p_mapper::ChangeMapperStateResponse
  (:init
   (&key
    ((:lastMapping __lastMapping) nil)
    )
   (send-super :init)
   (setq _lastMapping __lastMapping)
   self)
  (:lastMapping
   (&optional __lastMapping)
   (if __lastMapping (setq _lastMapping __lastMapping)) _lastMapping)
  (:serialization-length
   ()
   (+
    ;; bool _lastMapping
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _lastMapping
       (if _lastMapping (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _lastMapping
     (setq _lastMapping (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass comp313p_mapper::ChangeMapperState
  :super ros::object
  :slots ())

(setf (get comp313p_mapper::ChangeMapperState :md5sum-) "67481c27efef5721c8c4770c4dd3d307")
(setf (get comp313p_mapper::ChangeMapperState :datatype-) "comp313p_mapper/ChangeMapperState")
(setf (get comp313p_mapper::ChangeMapperState :request) comp313p_mapper::ChangeMapperStateRequest)
(setf (get comp313p_mapper::ChangeMapperState :response) comp313p_mapper::ChangeMapperStateResponse)

(defmethod comp313p_mapper::ChangeMapperStateRequest
  (:response () (instance comp313p_mapper::ChangeMapperStateResponse :init)))

(setf (get comp313p_mapper::ChangeMapperStateRequest :md5sum-) "67481c27efef5721c8c4770c4dd3d307")
(setf (get comp313p_mapper::ChangeMapperStateRequest :datatype-) "comp313p_mapper/ChangeMapperStateRequest")
(setf (get comp313p_mapper::ChangeMapperStateRequest :definition-)
      "bool enableMapping
---
bool lastMapping

")

(setf (get comp313p_mapper::ChangeMapperStateResponse :md5sum-) "67481c27efef5721c8c4770c4dd3d307")
(setf (get comp313p_mapper::ChangeMapperStateResponse :datatype-) "comp313p_mapper/ChangeMapperStateResponse")
(setf (get comp313p_mapper::ChangeMapperStateResponse :definition-)
      "bool enableMapping
---
bool lastMapping

")



(provide :comp313p_mapper/ChangeMapperState "67481c27efef5721c8c4770c4dd3d307")


