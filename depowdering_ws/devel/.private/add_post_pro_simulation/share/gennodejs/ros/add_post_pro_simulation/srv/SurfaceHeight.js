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

class SurfaceHeightRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.z_delta = null;
    }
    else {
      if (initObj.hasOwnProperty('z_delta')) {
        this.z_delta = initObj.z_delta
      }
      else {
        this.z_delta = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SurfaceHeightRequest
    // Serialize message field [z_delta]
    bufferOffset = _serializer.float32(obj.z_delta, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SurfaceHeightRequest
    let len;
    let data = new SurfaceHeightRequest(null);
    // Deserialize message field [z_delta]
    data.z_delta = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'add_post_pro_simulation/SurfaceHeightRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fc5c11c84cdf4837ef607818cd76c4ae';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 z_delta
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SurfaceHeightRequest(null);
    if (msg.z_delta !== undefined) {
      resolved.z_delta = msg.z_delta;
    }
    else {
      resolved.z_delta = 0.0
    }

    return resolved;
    }
};

class SurfaceHeightResponse {
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
    // Serializes a message object of type SurfaceHeightResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SurfaceHeightResponse
    let len;
    let data = new SurfaceHeightResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'add_post_pro_simulation/SurfaceHeightResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Success: TRUE if height is successfully changed.
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SurfaceHeightResponse(null);
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
  Request: SurfaceHeightRequest,
  Response: SurfaceHeightResponse,
  md5sum() { return '84a8867fc8ccf3b6b9067181a42e5ae9'; },
  datatype() { return 'add_post_pro_simulation/SurfaceHeight'; }
};
