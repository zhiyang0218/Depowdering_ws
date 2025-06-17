// Auto-generated. Do not edit!

// (in-package realsense_cam.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class FindWorkspaceCenterRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FindWorkspaceCenterRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FindWorkspaceCenterRequest
    let len;
    let data = new FindWorkspaceCenterRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'realsense_cam/FindWorkspaceCenterRequest';
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
    const resolved = new FindWorkspaceCenterRequest(null);
    return resolved;
    }
};

class FindWorkspaceCenterResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.point = null;
      this.z_change = null;
      this.x_change = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = new geometry_msgs.msg.PointStamped();
      }
      if (initObj.hasOwnProperty('z_change')) {
        this.z_change = initObj.z_change
      }
      else {
        this.z_change = 0.0;
      }
      if (initObj.hasOwnProperty('x_change')) {
        this.x_change = initObj.x_change
      }
      else {
        this.x_change = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FindWorkspaceCenterResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [point]
    bufferOffset = geometry_msgs.msg.PointStamped.serialize(obj.point, buffer, bufferOffset);
    // Serialize message field [z_change]
    bufferOffset = _serializer.float64(obj.z_change, buffer, bufferOffset);
    // Serialize message field [x_change]
    bufferOffset = _serializer.float64(obj.x_change, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FindWorkspaceCenterResponse
    let len;
    let data = new FindWorkspaceCenterResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [point]
    data.point = geometry_msgs.msg.PointStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [z_change]
    data.z_change = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [x_change]
    data.x_change = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PointStamped.getMessageSize(object.point);
    return length + 17;
  }

  static datatype() {
    // Returns string type for a service object
    return 'realsense_cam/FindWorkspaceCenterResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bd4595b8ce50ecc3768e9c5dc7e441ab';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Success: TRUE if frame is successfully delivered.
    # Reason: detail of error if not succeeded.
    bool success
    geometry_msgs/PointStamped point
    float64 z_change
    float64 x_change
    
    ================================================================================
    MSG: geometry_msgs/PointStamped
    # This represents a Point with reference coordinate frame and timestamp
    Header header
    Point point
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FindWorkspaceCenterResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.point !== undefined) {
      resolved.point = geometry_msgs.msg.PointStamped.Resolve(msg.point)
    }
    else {
      resolved.point = new geometry_msgs.msg.PointStamped()
    }

    if (msg.z_change !== undefined) {
      resolved.z_change = msg.z_change;
    }
    else {
      resolved.z_change = 0.0
    }

    if (msg.x_change !== undefined) {
      resolved.x_change = msg.x_change;
    }
    else {
      resolved.x_change = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: FindWorkspaceCenterRequest,
  Response: FindWorkspaceCenterResponse,
  md5sum() { return 'bd4595b8ce50ecc3768e9c5dc7e441ab'; },
  datatype() { return 'realsense_cam/FindWorkspaceCenter'; }
};
