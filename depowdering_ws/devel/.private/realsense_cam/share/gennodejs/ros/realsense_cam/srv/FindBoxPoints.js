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

let sensor_msgs = _finder('sensor_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class FindBoxPointsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FindBoxPointsRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FindBoxPointsRequest
    let len;
    let data = new FindBoxPointsRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'realsense_cam/FindBoxPointsRequest';
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
    const resolved = new FindBoxPointsRequest(null);
    return resolved;
    }
};

class FindBoxPointsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.points = null;
      this.boundary_points = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = new sensor_msgs.msg.PointCloud2();
      }
      if (initObj.hasOwnProperty('boundary_points')) {
        this.boundary_points = initObj.boundary_points
      }
      else {
        this.boundary_points = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FindBoxPointsResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [points]
    bufferOffset = sensor_msgs.msg.PointCloud2.serialize(obj.points, buffer, bufferOffset);
    // Serialize message field [boundary_points]
    // Serialize the length for message field [boundary_points]
    bufferOffset = _serializer.uint32(obj.boundary_points.length, buffer, bufferOffset);
    obj.boundary_points.forEach((val) => {
      bufferOffset = geometry_msgs.msg.PointStamped.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FindBoxPointsResponse
    let len;
    let data = new FindBoxPointsResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [points]
    data.points = sensor_msgs.msg.PointCloud2.deserialize(buffer, bufferOffset);
    // Deserialize message field [boundary_points]
    // Deserialize array length for message field [boundary_points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.boundary_points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.boundary_points[i] = geometry_msgs.msg.PointStamped.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += sensor_msgs.msg.PointCloud2.getMessageSize(object.points);
    object.boundary_points.forEach((val) => {
      length += geometry_msgs.msg.PointStamped.getMessageSize(val);
    });
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'realsense_cam/FindBoxPointsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5f515f4ac24677f0676cc1d53c1e289b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Success: TRUE if frame is successfully delivered.
    # Reason: detail of error if not succeeded.
    bool success
    
    # Points: Pointcloud of points inside the work area 
    sensor_msgs/PointCloud2 points
    
    # Boundary_points: 2 points representing top-left & bottom-right of the work area, respectively
    geometry_msgs/PointStamped[] boundary_points
    
    ================================================================================
    MSG: sensor_msgs/PointCloud2
    # This message holds a collection of N-dimensional points, which may
    # contain additional information such as normals, intensity, etc. The
    # point data is stored as a binary blob, its layout described by the
    # contents of the "fields" array.
    
    # The point cloud data may be organized 2d (image-like) or 1d
    # (unordered). Point clouds organized as 2d images may be produced by
    # camera depth sensors such as stereo or time-of-flight.
    
    # Time of sensor data acquisition, and the coordinate frame ID (for 3d
    # points).
    Header header
    
    # 2D structure of the point cloud. If the cloud is unordered, height is
    # 1 and width is the length of the point cloud.
    uint32 height
    uint32 width
    
    # Describes the channels and their layout in the binary data blob.
    PointField[] fields
    
    bool    is_bigendian # Is this data bigendian?
    uint32  point_step   # Length of a point in bytes
    uint32  row_step     # Length of a row in bytes
    uint8[] data         # Actual point data, size is (row_step*height)
    
    bool is_dense        # True if there are no invalid points
    
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
    MSG: sensor_msgs/PointField
    # This message holds the description of one point entry in the
    # PointCloud2 message format.
    uint8 INT8    = 1
    uint8 UINT8   = 2
    uint8 INT16   = 3
    uint8 UINT16  = 4
    uint8 INT32   = 5
    uint8 UINT32  = 6
    uint8 FLOAT32 = 7
    uint8 FLOAT64 = 8
    
    string name      # Name of field
    uint32 offset    # Offset from start of point struct
    uint8  datatype  # Datatype enumeration, see above
    uint32 count     # How many elements in the field
    
    ================================================================================
    MSG: geometry_msgs/PointStamped
    # This represents a Point with reference coordinate frame and timestamp
    Header header
    Point point
    
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
    const resolved = new FindBoxPointsResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.points !== undefined) {
      resolved.points = sensor_msgs.msg.PointCloud2.Resolve(msg.points)
    }
    else {
      resolved.points = new sensor_msgs.msg.PointCloud2()
    }

    if (msg.boundary_points !== undefined) {
      resolved.boundary_points = new Array(msg.boundary_points.length);
      for (let i = 0; i < resolved.boundary_points.length; ++i) {
        resolved.boundary_points[i] = geometry_msgs.msg.PointStamped.Resolve(msg.boundary_points[i]);
      }
    }
    else {
      resolved.boundary_points = []
    }

    return resolved;
    }
};

module.exports = {
  Request: FindBoxPointsRequest,
  Response: FindBoxPointsResponse,
  md5sum() { return '5f515f4ac24677f0676cc1d53c1e289b'; },
  datatype() { return 'realsense_cam/FindBoxPoints'; }
};
