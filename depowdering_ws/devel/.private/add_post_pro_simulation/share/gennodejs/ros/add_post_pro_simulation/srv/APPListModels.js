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

class APPListModelsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type APPListModelsRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type APPListModelsRequest
    let len;
    let data = new APPListModelsRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'add_post_pro_simulation/APPListModelsRequest';
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
    const resolved = new APPListModelsRequest(null);
    return resolved;
    }
};

class APPListModelsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.models = null;
    }
    else {
      if (initObj.hasOwnProperty('models')) {
        this.models = initObj.models
      }
      else {
        this.models = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type APPListModelsResponse
    // Serialize message field [models]
    bufferOffset = _arraySerializer.string(obj.models, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type APPListModelsResponse
    let len;
    let data = new APPListModelsResponse(null);
    // Deserialize message field [models]
    data.models = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.models.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'add_post_pro_simulation/APPListModelsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '68c1312e15cb67cd7b79f814607addf5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] models
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new APPListModelsResponse(null);
    if (msg.models !== undefined) {
      resolved.models = msg.models;
    }
    else {
      resolved.models = []
    }

    return resolved;
    }
};

module.exports = {
  Request: APPListModelsRequest,
  Response: APPListModelsResponse,
  md5sum() { return '68c1312e15cb67cd7b79f814607addf5'; },
  datatype() { return 'add_post_pro_simulation/APPListModels'; }
};
