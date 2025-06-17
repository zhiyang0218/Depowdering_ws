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

class GetFeatureRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.setting = null;
    }
    else {
      if (initObj.hasOwnProperty('setting')) {
        this.setting = initObj.setting
      }
      else {
        this.setting = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetFeatureRequest
    // Serialize message field [setting]
    bufferOffset = _serializer.uint32(obj.setting, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetFeatureRequest
    let len;
    let data = new GetFeatureRequest(null);
    // Deserialize message field [setting]
    data.setting = _deserializer.uint32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'micro_epsilon_scancontrol_msgs/GetFeatureRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '340dffc55dcd5acf86424b2679b5cac5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 setting
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetFeatureRequest(null);
    if (msg.setting !== undefined) {
      resolved.setting = msg.setting;
    }
    else {
      resolved.setting = 0
    }

    return resolved;
    }
};

class GetFeatureResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.value = null;
      this.return_code = null;
    }
    else {
      if (initObj.hasOwnProperty('value')) {
        this.value = initObj.value
      }
      else {
        this.value = 0;
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
    // Serializes a message object of type GetFeatureResponse
    // Serialize message field [value]
    bufferOffset = _serializer.uint32(obj.value, buffer, bufferOffset);
    // Serialize message field [return_code]
    bufferOffset = _serializer.int32(obj.return_code, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetFeatureResponse
    let len;
    let data = new GetFeatureResponse(null);
    // Deserialize message field [value]
    data.value = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [return_code]
    data.return_code = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'micro_epsilon_scancontrol_msgs/GetFeatureResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '06059ea2827d83c8150ee6fe06bbfd6a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32 value
    int32 return_code
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetFeatureResponse(null);
    if (msg.value !== undefined) {
      resolved.value = msg.value;
    }
    else {
      resolved.value = 0
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
  Request: GetFeatureRequest,
  Response: GetFeatureResponse,
  md5sum() { return '4a270fe9e59018192da9c039467ff2b9'; },
  datatype() { return 'micro_epsilon_scancontrol_msgs/GetFeature'; }
};
