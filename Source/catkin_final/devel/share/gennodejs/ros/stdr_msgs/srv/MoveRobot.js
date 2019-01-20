// Auto-generated. Do not edit!

// (in-package stdr_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class MoveRobotRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.newPose = null;
    }
    else {
      if (initObj.hasOwnProperty('newPose')) {
        this.newPose = initObj.newPose
      }
      else {
        this.newPose = new geometry_msgs.msg.Pose2D();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveRobotRequest
    // Serialize message field [newPose]
    bufferOffset = geometry_msgs.msg.Pose2D.serialize(obj.newPose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveRobotRequest
    let len;
    let data = new MoveRobotRequest(null);
    // Deserialize message field [newPose]
    data.newPose = geometry_msgs.msg.Pose2D.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'stdr_msgs/MoveRobotRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3f8cb1536a8bfe7e956ece9331b2cd07';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose2D newPose
    
    ================================================================================
    MSG: geometry_msgs/Pose2D
    # This expresses a position and orientation on a 2D manifold.
    
    float64 x
    float64 y
    float64 theta
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveRobotRequest(null);
    if (msg.newPose !== undefined) {
      resolved.newPose = geometry_msgs.msg.Pose2D.Resolve(msg.newPose)
    }
    else {
      resolved.newPose = new geometry_msgs.msg.Pose2D()
    }

    return resolved;
    }
};

class MoveRobotResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MoveRobotResponse
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MoveRobotResponse
    let len;
    let data = new MoveRobotResponse(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'stdr_msgs/MoveRobotResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MoveRobotResponse(null);
    return resolved;
    }
};

module.exports = {
  Request: MoveRobotRequest,
  Response: MoveRobotResponse,
  md5sum() { return '3f8cb1536a8bfe7e956ece9331b2cd07'; },
  datatype() { return 'stdr_msgs/MoveRobot'; }
};
