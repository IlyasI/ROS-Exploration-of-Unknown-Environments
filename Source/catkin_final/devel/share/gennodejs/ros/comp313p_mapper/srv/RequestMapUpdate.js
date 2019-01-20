// Auto-generated. Do not edit!

// (in-package comp313p_mapper.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let MapUpdate = require('../msg/MapUpdate.js');

//-----------------------------------------------------------

class RequestMapUpdateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.deltaOccupancyGridRequired = null;
    }
    else {
      if (initObj.hasOwnProperty('deltaOccupancyGridRequired')) {
        this.deltaOccupancyGridRequired = initObj.deltaOccupancyGridRequired
      }
      else {
        this.deltaOccupancyGridRequired = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RequestMapUpdateRequest
    // Serialize message field [deltaOccupancyGridRequired]
    bufferOffset = _serializer.bool(obj.deltaOccupancyGridRequired, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RequestMapUpdateRequest
    let len;
    let data = new RequestMapUpdateRequest(null);
    // Deserialize message field [deltaOccupancyGridRequired]
    data.deltaOccupancyGridRequired = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'comp313p_mapper/RequestMapUpdateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f7f3f7638aa1640753832d43db8a1853';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool deltaOccupancyGridRequired
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RequestMapUpdateRequest(null);
    if (msg.deltaOccupancyGridRequired !== undefined) {
      resolved.deltaOccupancyGridRequired = msg.deltaOccupancyGridRequired;
    }
    else {
      resolved.deltaOccupancyGridRequired = false
    }

    return resolved;
    }
};

class RequestMapUpdateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.initialMapUpdate = null;
    }
    else {
      if (initObj.hasOwnProperty('initialMapUpdate')) {
        this.initialMapUpdate = initObj.initialMapUpdate
      }
      else {
        this.initialMapUpdate = new MapUpdate();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RequestMapUpdateResponse
    // Serialize message field [initialMapUpdate]
    bufferOffset = MapUpdate.serialize(obj.initialMapUpdate, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RequestMapUpdateResponse
    let len;
    let data = new RequestMapUpdateResponse(null);
    // Deserialize message field [initialMapUpdate]
    data.initialMapUpdate = MapUpdate.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += MapUpdate.getMessageSize(object.initialMapUpdate);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'comp313p_mapper/RequestMapUpdateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c38a84a7069507e7645c74bfe20d6807';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    comp313p_mapper/MapUpdate initialMapUpdate
    
    ================================================================================
    MSG: comp313p_mapper/MapUpdate
    Header header
    
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RequestMapUpdateResponse(null);
    if (msg.initialMapUpdate !== undefined) {
      resolved.initialMapUpdate = MapUpdate.Resolve(msg.initialMapUpdate)
    }
    else {
      resolved.initialMapUpdate = new MapUpdate()
    }

    return resolved;
    }
};

module.exports = {
  Request: RequestMapUpdateRequest,
  Response: RequestMapUpdateResponse,
  md5sum() { return 'e5aa3588d7db3769375365d7ca3672e4'; },
  datatype() { return 'comp313p_mapper/RequestMapUpdate'; }
};
