// Auto-generated. Do not edit!

// (in-package micro_epsilon_scancontrol_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetResolutionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.resolution = null;
    }
    else {
      if (initObj.hasOwnProperty('resolution')) {
        this.resolution = initObj.resolution
      }
      else {
        this.resolution = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetResolutionRequest
    // Serialize message field [resolution]
    bufferOffset = _serializer.uint32(obj.resolution, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetResolutionRequest
    let len;
    let data = new SetResolutionRequest(null);
    // Deserialize message field [resolution]
    data.resolution = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'micro_epsilon_scancontrol_msgs/SetResolutionRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e823819950f9b6151b09f32dfb02b2fa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 resolution
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetResolutionRequest(null);
    if (msg.resolution !== undefined) {
      resolved.resolution = msg.resolution;
    }
    else {
      resolved.resolution = 0
    }

    return resolved;
    }
};

class SetResolutionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.return_code = null;
    }
    else {
      if (initObj.hasOwnProperty('return_code')) {
        this.return_code = initObj.return_code
      }
      else {
        this.return_code = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetResolutionResponse
    // Serialize message field [return_code]
    bufferOffset = _serializer.int32(obj.return_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetResolutionResponse
    let len;
    let data = new SetResolutionResponse(null);
    // Deserialize message field [return_code]
    data.return_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'micro_epsilon_scancontrol_msgs/SetResolutionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c285fc637ab43abc6f59f97aab55a3bb';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 return_code
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetResolutionResponse(null);
    if (msg.return_code !== undefined) {
      resolved.return_code = msg.return_code;
    }
    else {
      resolved.return_code = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: SetResolutionRequest,
  Response: SetResolutionResponse,
  md5sum() { return '31b37757a8d3cae8da33ee6b9ff1b953'; },
  datatype() { return 'micro_epsilon_scancontrol_msgs/SetResolution'; }
};
