// Auto-generated. Do not edit!

// (in-package add_post_pro_simulation.srv)


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

class APPSpawnModelRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.model_name = null;
      this.instance_name = null;
      this.turntable = null;
      this.pose = null;
      this.parent_frame = null;
    }
    else {
      if (initObj.hasOwnProperty('model_name')) {
        this.model_name = initObj.model_name
      }
      else {
        this.model_name = '';
      }
      if (initObj.hasOwnProperty('instance_name')) {
        this.instance_name = initObj.instance_name
      }
      else {
        this.instance_name = '';
      }
      if (initObj.hasOwnProperty('turntable')) {
        this.turntable = initObj.turntable
      }
      else {
        this.turntable = false;
      }
      if (initObj.hasOwnProperty('pose')) {
        this.pose = initObj.pose
      }
      else {
        this.pose = new geometry_msgs.msg.Pose();
      }
      if (initObj.hasOwnProperty('parent_frame')) {
        this.parent_frame = initObj.parent_frame
      }
      else {
        this.parent_frame = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type APPSpawnModelRequest
    // Serialize message field [model_name]
    bufferOffset = _serializer.string(obj.model_name, buffer, bufferOffset);
    // Serialize message field [instance_name]
    bufferOffset = _serializer.string(obj.instance_name, buffer, bufferOffset);
    // Serialize message field [turntable]
    bufferOffset = _serializer.bool(obj.turntable, buffer, bufferOffset);
    // Serialize message field [pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.pose, buffer, bufferOffset);
    // Serialize message field [parent_frame]
    bufferOffset = _serializer.string(obj.parent_frame, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type APPSpawnModelRequest
    let len;
    let data = new APPSpawnModelRequest(null);
    // Deserialize message field [model_name]
    data.model_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [instance_name]
    data.instance_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [turntable]
    data.turntable = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [pose]
    data.pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    // Deserialize message field [parent_frame]
    data.parent_frame = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.model_name);
    length += _getByteLength(object.instance_name);
    length += _getByteLength(object.parent_frame);
    return length + 69;
  }

  static datatype() {
    // Returns string type for a service object
    return 'add_post_pro_simulation/APPSpawnModelRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '76a460d134ffd162f77fd5071072d4e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string model_name
    string instance_name
    bool turntable
    geometry_msgs/Pose pose
    string parent_frame
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new APPSpawnModelRequest(null);
    if (msg.model_name !== undefined) {
      resolved.model_name = msg.model_name;
    }
    else {
      resolved.model_name = ''
    }

    if (msg.instance_name !== undefined) {
      resolved.instance_name = msg.instance_name;
    }
    else {
      resolved.instance_name = ''
    }

    if (msg.turntable !== undefined) {
      resolved.turntable = msg.turntable;
    }
    else {
      resolved.turntable = false
    }

    if (msg.pose !== undefined) {
      resolved.pose = geometry_msgs.msg.Pose.Resolve(msg.pose)
    }
    else {
      resolved.pose = new geometry_msgs.msg.Pose()
    }

    if (msg.parent_frame !== undefined) {
      resolved.parent_frame = msg.parent_frame;
    }
    else {
      resolved.parent_frame = ''
    }

    return resolved;
    }
};

class APPSpawnModelResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type APPSpawnModelResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type APPSpawnModelResponse
    let len;
    let data = new APPSpawnModelResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'add_post_pro_simulation/APPSpawnModelResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new APPSpawnModelResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: APPSpawnModelRequest,
  Response: APPSpawnModelResponse,
  md5sum() { return '6cdf43566fecf3a5e31bc8aac7b0f400'; },
  datatype() { return 'add_post_pro_simulation/APPSpawnModel'; }
};
