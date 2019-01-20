// Auto-generated. Do not edit!

// (in-package comp313p_mapper.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class MapUpdate {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.isPriorMap = null;
      this.scale = null;
      this.extentInCells = null;
      this.resolution = null;
      this.occupancyGrid = null;
      this.deltaOccupancyGrid = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('isPriorMap')) {
        this.isPriorMap = initObj.isPriorMap
      }
      else {
        this.isPriorMap = false;
      }
      if (initObj.hasOwnProperty('scale')) {
        this.scale = initObj.scale
      }
      else {
        this.scale = 0.0;
      }
      if (initObj.hasOwnProperty('extentInCells')) {
        this.extentInCells = initObj.extentInCells
      }
      else {
        this.extentInCells = [];
      }
      if (initObj.hasOwnProperty('resolution')) {
        this.resolution = initObj.resolution
      }
      else {
        this.resolution = 0.0;
      }
      if (initObj.hasOwnProperty('occupancyGrid')) {
        this.occupancyGrid = initObj.occupancyGrid
      }
      else {
        this.occupancyGrid = [];
      }
      if (initObj.hasOwnProperty('deltaOccupancyGrid')) {
        this.deltaOccupancyGrid = initObj.deltaOccupancyGrid
      }
      else {
        this.deltaOccupancyGrid = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MapUpdate
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [isPriorMap]
    bufferOffset = _serializer.bool(obj.isPriorMap, buffer, bufferOffset);
    // Serialize message field [scale]
    bufferOffset = _serializer.float32(obj.scale, buffer, bufferOffset);
    // Serialize message field [extentInCells]
    bufferOffset = _arraySerializer.int16(obj.extentInCells, buffer, bufferOffset, null);
    // Serialize message field [resolution]
    bufferOffset = _serializer.float32(obj.resolution, buffer, bufferOffset);
    // Serialize message field [occupancyGrid]
    bufferOffset = _arraySerializer.float32(obj.occupancyGrid, buffer, bufferOffset, null);
    // Serialize message field [deltaOccupancyGrid]
    bufferOffset = _arraySerializer.float32(obj.deltaOccupancyGrid, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MapUpdate
    let len;
    let data = new MapUpdate(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [isPriorMap]
    data.isPriorMap = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [scale]
    data.scale = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [extentInCells]
    data.extentInCells = _arrayDeserializer.int16(buffer, bufferOffset, null)
    // Deserialize message field [resolution]
    data.resolution = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [occupancyGrid]
    data.occupancyGrid = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [deltaOccupancyGrid]
    data.deltaOccupancyGrid = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 2 * object.extentInCells.length;
    length += 4 * object.occupancyGrid.length;
    length += 4 * object.deltaOccupancyGrid.length;
    return length + 21;
  }

  static datatype() {
    // Returns string type for a message object
    return 'comp313p_mapper/MapUpdate';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bb9eab5859acbeac865abd611e41d4b8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new MapUpdate(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.isPriorMap !== undefined) {
      resolved.isPriorMap = msg.isPriorMap;
    }
    else {
      resolved.isPriorMap = false
    }

    if (msg.scale !== undefined) {
      resolved.scale = msg.scale;
    }
    else {
      resolved.scale = 0.0
    }

    if (msg.extentInCells !== undefined) {
      resolved.extentInCells = msg.extentInCells;
    }
    else {
      resolved.extentInCells = []
    }

    if (msg.resolution !== undefined) {
      resolved.resolution = msg.resolution;
    }
    else {
      resolved.resolution = 0.0
    }

    if (msg.occupancyGrid !== undefined) {
      resolved.occupancyGrid = msg.occupancyGrid;
    }
    else {
      resolved.occupancyGrid = []
    }

    if (msg.deltaOccupancyGrid !== undefined) {
      resolved.deltaOccupancyGrid = msg.deltaOccupancyGrid;
    }
    else {
      resolved.deltaOccupancyGrid = []
    }

    return resolved;
    }
};

module.exports = MapUpdate;
