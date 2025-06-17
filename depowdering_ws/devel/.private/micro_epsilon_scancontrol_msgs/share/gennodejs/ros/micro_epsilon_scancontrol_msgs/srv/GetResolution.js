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

class GetResolutionRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetResolutionRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetResolutionRequest
    let len;
    let data = new GetResolutionRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'micro_epsilon_scancontrol_msgs/GetResolutionRequest';
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
    const resolved = new GetResolutionRequest(null);
    return resolved;
    }
};

class GetResolutionResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.resolution = null;
      this.return_code = null;
    }
    else {
      if (initObj.hasOwnProperty('resolution')) {
        this.resolution = initObj.resolution
      }
      else {
        this.resolution = 0;
      }
      if (initObj.hasOwnProperty('return_code')) {
        this.return_code = initObj.return_code
      }
      else {
        this.return_code = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetResolutionResponse
    // Serialize message field [resolution]
    bufferOffset = _serializer.uint32(obj.resolution, buffer, bufferOffset);
    // Serialize message field [return_code]
    bufferOffset = _serializer.int32(obj.return_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetResolutionResponse
    let len;
    let data = new GetResolutionResponse(null);
    // Deserialize message field [resolution]
    data.resolution = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [return_code]
    data.return_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'micro_epsilon_scancontrol_msgs/GetResolutionResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b29e2945c59c53f7e032bc7769074912';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 resolution
    int32 return_code
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetResolutionResponse(null);
    if (msg.resolution !== undefined) {
      resolved.resolution = msg.resolution;
    }
    else {
      resolved.resolution = 0
    }

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
  Request: GetResolutionRequest,
  Response: GetResolutionResponse,
  md5sum() { return 'b29e2945c59c53f7e032bc7769074912'; },
  datatype() { return 'micro_epsilon_scancontrol_msgs/GetResolution'; }
};
