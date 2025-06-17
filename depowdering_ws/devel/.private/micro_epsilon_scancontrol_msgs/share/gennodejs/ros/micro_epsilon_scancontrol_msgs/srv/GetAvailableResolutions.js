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

class GetAvailableResolutionsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetAvailableResolutionsRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetAvailableResolutionsRequest
    let len;
    let data = new GetAvailableResolutionsRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'micro_epsilon_scancontrol_msgs/GetAvailableResolutionsRequest';
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
    const resolved = new GetAvailableResolutionsRequest(null);
    return resolved;
    }
};

class GetAvailableResolutionsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.resolutions = null;
      this.return_code = null;
    }
    else {
      if (initObj.hasOwnProperty('resolutions')) {
        this.resolutions = initObj.resolutions
      }
      else {
        this.resolutions = [];
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
    // Serializes a message object of type GetAvailableResolutionsResponse
    // Serialize message field [resolutions]
    bufferOffset = _arraySerializer.uint32(obj.resolutions, buffer, bufferOffset, null);
    // Serialize message field [return_code]
    bufferOffset = _serializer.int32(obj.return_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetAvailableResolutionsResponse
    let len;
    let data = new GetAvailableResolutionsResponse(null);
    // Deserialize message field [resolutions]
    data.resolutions = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    // Deserialize message field [return_code]
    data.return_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.resolutions.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'micro_epsilon_scancontrol_msgs/GetAvailableResolutionsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a603ff8225a17994979733ebf35285f3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32[] resolutions
    int32 return_code
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetAvailableResolutionsResponse(null);
    if (msg.resolutions !== undefined) {
      resolved.resolutions = msg.resolutions;
    }
    else {
      resolved.resolutions = []
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
  Request: GetAvailableResolutionsRequest,
  Response: GetAvailableResolutionsResponse,
  md5sum() { return 'a603ff8225a17994979733ebf35285f3'; },
  datatype() { return 'micro_epsilon_scancontrol_msgs/GetAvailableResolutions'; }
};
