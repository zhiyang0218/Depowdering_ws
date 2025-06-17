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

class SetFeatureRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.setting = null;
      this.value = null;
    }
    else {
      if (initObj.hasOwnProperty('setting')) {
        this.setting = initObj.setting
      }
      else {
        this.setting = 0;
      }
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetFeatureRequest
    // Serialize message field [setting]
    bufferOffset = _serializer.uint32(obj.setting, buffer, bufferOffset);
    // Serialize message field [value]
    bufferOffset = _serializer.uint32(obj.value, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetFeatureRequest
    let len;
    let data = new SetFeatureRequest(null);
    // Deserialize message field [setting]
    data.setting = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [value]
    data.value = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'micro_epsilon_scancontrol_msgs/SetFeatureRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3072132c0245282731d0c5ccc2b15093';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 setting
    uint32 value
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetFeatureRequest(null);
    if (msg.setting !== undefined) {
      resolved.setting = msg.setting;
    }
    else {
      resolved.setting = 0
    }

    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0
    }

    return resolved;
    }
};

class SetFeatureResponse {
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
    // Serializes a message object of type SetFeatureResponse
    // Serialize message field [return_code]
    bufferOffset = _serializer.int32(obj.return_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetFeatureResponse
    let len;
    let data = new SetFeatureResponse(null);
    // Deserialize message field [return_code]
    data.return_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'micro_epsilon_scancontrol_msgs/SetFeatureResponse';
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
    const resolved = new SetFeatureResponse(null);
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
  Request: SetFeatureRequest,
  Response: SetFeatureResponse,
  md5sum() { return 'b6319c48811935bafcd8759d2c550c8f'; },
  datatype() { return 'micro_epsilon_scancontrol_msgs/SetFeature'; }
};
