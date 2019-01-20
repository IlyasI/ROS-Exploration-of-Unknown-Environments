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


//-----------------------------------------------------------

class ChangeMapperStateRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.enableMapping = null;
    }
    else {
      if (initObj.hasOwnProperty('enableMapping')) {
        this.enableMapping = initObj.enableMapping
      }
      else {
        this.enableMapping = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChangeMapperStateRequest
    // Serialize message field [enableMapping]
    bufferOffset = _serializer.bool(obj.enableMapping, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangeMapperStateRequest
    let len;
    let data = new ChangeMapperStateRequest(null);
    // Deserialize message field [enableMapping]
    data.enableMapping = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'comp313p_mapper/ChangeMapperStateRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b54392e4214b88bd2d37f5ea819cc245';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool enableMapping
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChangeMapperStateRequest(null);
    if (msg.enableMapping !== undefined) {
      resolved.enableMapping = msg.enableMapping;
    }
    else {
      resolved.enableMapping = false
    }

    return resolved;
    }
};

class ChangeMapperStateResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.lastMapping = null;
    }
    else {
      if (initObj.hasOwnProperty('lastMapping')) {
        this.lastMapping = initObj.lastMapping
      }
      else {
        this.lastMapping = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ChangeMapperStateResponse
    // Serialize message field [lastMapping]
    bufferOffset = _serializer.bool(obj.lastMapping, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ChangeMapperStateResponse
    let len;
    let data = new ChangeMapperStateResponse(null);
    // Deserialize message field [lastMapping]
    data.lastMapping = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'comp313p_mapper/ChangeMapperStateResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9f0e749386b8ef208714d1e26ce4d111';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool lastMapping
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ChangeMapperStateResponse(null);
    if (msg.lastMapping !== undefined) {
      resolved.lastMapping = msg.lastMapping;
    }
    else {
      resolved.lastMapping = false
    }

    return resolved;
    }
};

module.exports = {
  Request: ChangeMapperStateRequest,
  Response: ChangeMapperStateResponse,
  md5sum() { return '67481c27efef5721c8c4770c4dd3d307'; },
  datatype() { return 'comp313p_mapper/ChangeMapperState'; }
};
