// Auto-generated. Do not edit!

// (in-package add_post_pro_simulation.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class APPDeleteModelRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.instance_name = null;
    }
    else {
      if (initObj.hasOwnProperty('instance_name')) {
        this.instance_name = initObj.instance_name
      }
      else {
        this.instance_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type APPDeleteModelRequest
    // Serialize message field [instance_name]
    bufferOffset = _serializer.string(obj.instance_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type APPDeleteModelRequest
    let len;
    let data = new APPDeleteModelRequest(null);
    // Deserialize message field [instance_name]
    data.instance_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.instance_name);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'add_post_pro_simulation/APPDeleteModelRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6bbfbee528e42398b58119d8fe56c6a3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string instance_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new APPDeleteModelRequest(null);
    if (msg.instance_name !== undefined) {
      resolved.instance_name = msg.instance_name;
    }
    else {
      resolved.instance_name = ''
    }

    return resolved;
    }
};

class APPDeleteModelResponse {
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
    // Serializes a message object of type APPDeleteModelResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type APPDeleteModelResponse
    let len;
    let data = new APPDeleteModelResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'add_post_pro_simulation/APPDeleteModelResponse';
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
    const resolved = new APPDeleteModelResponse(null);
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
  Request: APPDeleteModelRequest,
  Response: APPDeleteModelResponse,
  md5sum() { return 'dd7ff374ac75c6b3ba8044c8720cd572'; },
  datatype() { return 'add_post_pro_simulation/APPDeleteModel'; }
};
