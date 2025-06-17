// Auto-generated. Do not edit!

// (in-package pcl_sensor_data.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class angleAdjustRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.req = null;
    }
    else {
      if (initObj.hasOwnProperty('req')) {
        this.req = initObj.req
      }
      else {
        this.req = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type angleAdjustRequest
    // Serialize message field [req]
    bufferOffset = _serializer.bool(obj.req, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type angleAdjustRequest
    let len;
    let data = new angleAdjustRequest(null);
    // Deserialize message field [req]
    data.req = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pcl_sensor_data/angleAdjustRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'be3c44e19d0c6b00b25e356c69155e2a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #request
    bool req
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new angleAdjustRequest(null);
    if (msg.req !== undefined) {
      resolved.req = msg.req;
    }
    else {
      resolved.req = false
    }

    return resolved;
    }
};

class angleAdjustResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.angle = null;
    }
    else {
      if (initObj.hasOwnProperty('angle')) {
        this.angle = initObj.angle
      }
      else {
        this.angle = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type angleAdjustResponse
    // Serialize message field [angle]
    bufferOffset = _serializer.float64(obj.angle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type angleAdjustResponse
    let len;
    let data = new angleAdjustResponse(null);
    // Deserialize message field [angle]
    data.angle = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pcl_sensor_data/angleAdjustResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4edb55038e2b888976a0c0c56935341c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #response
    float64 angle
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new angleAdjustResponse(null);
    if (msg.angle !== undefined) {
      resolved.angle = msg.angle;
    }
    else {
      resolved.angle = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: angleAdjustRequest,
  Response: angleAdjustResponse,
  md5sum() { return 'f263ad018944d1f74b66bb892b6765bf'; },
  datatype() { return 'pcl_sensor_data/angleAdjust'; }
};
