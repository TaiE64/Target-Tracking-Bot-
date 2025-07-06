// Auto-generated. Do not edit!

// (in-package antobot_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class camManagerRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.camera_num = null;
      this.command = null;
    }
    else {
      if (initObj.hasOwnProperty('camera_num')) {
        this.camera_num = initObj.camera_num
      }
      else {
        this.camera_num = 0;
      }
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type camManagerRequest
    // Serialize message field [camera_num]
    bufferOffset = _serializer.int8(obj.camera_num, buffer, bufferOffset);
    // Serialize message field [command]
    bufferOffset = _serializer.int8(obj.command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type camManagerRequest
    let len;
    let data = new camManagerRequest(null);
    // Deserialize message field [camera_num]
    data.camera_num = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [command]
    data.command = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 2;
  }

  static datatype() {
    // Returns string type for a service object
    return 'antobot_msgs/camManagerRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c063391607e68c264c6221ac3f45ede5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 camera_num		    # 0 - front, 1 - back, 2 - left, 3 - right
    int8 command			# 0 - close/turn off, 1 - launch ROS code, 2 - start recording video
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new camManagerRequest(null);
    if (msg.camera_num !== undefined) {
      resolved.camera_num = msg.camera_num;
    }
    else {
      resolved.camera_num = 0
    }

    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = 0
    }

    return resolved;
    }
};

class camManagerResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.responseCode = null;
      this.responseString = null;
    }
    else {
      if (initObj.hasOwnProperty('responseCode')) {
        this.responseCode = initObj.responseCode
      }
      else {
        this.responseCode = 0;
      }
      if (initObj.hasOwnProperty('responseString')) {
        this.responseString = initObj.responseString
      }
      else {
        this.responseString = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type camManagerResponse
    // Serialize message field [responseCode]
    bufferOffset = _serializer.int8(obj.responseCode, buffer, bufferOffset);
    // Serialize message field [responseString]
    bufferOffset = _serializer.string(obj.responseString, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type camManagerResponse
    let len;
    let data = new camManagerResponse(null);
    // Deserialize message field [responseCode]
    data.responseCode = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [responseString]
    data.responseString = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.responseString);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'antobot_msgs/camManagerResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ffae894553e78674a1fb889cfce79059';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 responseCode		# 0 - success, -1 - failure
    string responseString   # Additional info
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new camManagerResponse(null);
    if (msg.responseCode !== undefined) {
      resolved.responseCode = msg.responseCode;
    }
    else {
      resolved.responseCode = 0
    }

    if (msg.responseString !== undefined) {
      resolved.responseString = msg.responseString;
    }
    else {
      resolved.responseString = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: camManagerRequest,
  Response: camManagerResponse,
  md5sum() { return 'fc42ba797ab7c1398107c36a354e835f'; },
  datatype() { return 'antobot_msgs/camManager'; }
};
