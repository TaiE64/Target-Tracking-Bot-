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

class antoRecRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command = null;
    }
    else {
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type antoRecRequest
    // Serialize message field [command]
    bufferOffset = _serializer.int8(obj.command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type antoRecRequest
    let len;
    let data = new antoRecRequest(null);
    // Deserialize message field [command]
    data.command = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'antobot_msgs/antoRecRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '481ac5a494c3140a2539020bd74c82c7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 command	# 0 - open cam 1 - close cam, 2 - start recording, 3 - stop recording
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new antoRecRequest(null);
    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = 0
    }

    return resolved;
    }
};

class antoRecResponse {
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
        this.responseCode = false;
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
    // Serializes a message object of type antoRecResponse
    // Serialize message field [responseCode]
    bufferOffset = _serializer.bool(obj.responseCode, buffer, bufferOffset);
    // Serialize message field [responseString]
    bufferOffset = _serializer.string(obj.responseString, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type antoRecResponse
    let len;
    let data = new antoRecResponse(null);
    // Deserialize message field [responseCode]
    data.responseCode = _deserializer.bool(buffer, bufferOffset);
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
    return 'antobot_msgs/antoRecResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5b33b72772e7353b2979faecc153a5e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool responseCode		# False - failure, True - success
    string responseString	# Additional info
    
    
    
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new antoRecResponse(null);
    if (msg.responseCode !== undefined) {
      resolved.responseCode = msg.responseCode;
    }
    else {
      resolved.responseCode = false
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
  Request: antoRecRequest,
  Response: antoRecResponse,
  md5sum() { return 'd5a7288f1d26019f672552946e4bed3b'; },
  datatype() { return 'antobot_msgs/antoRec'; }
};
