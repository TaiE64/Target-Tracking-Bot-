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

class softShutdownRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.softshutdownreq = null;
    }
    else {
      if (initObj.hasOwnProperty('softshutdownreq')) {
        this.softshutdownreq = initObj.softshutdownreq
      }
      else {
        this.softshutdownreq = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type softShutdownRequest
    // Serialize message field [softshutdownreq]
    bufferOffset = _serializer.bool(obj.softshutdownreq, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type softShutdownRequest
    let len;
    let data = new softShutdownRequest(null);
    // Deserialize message field [softshutdownreq]
    data.softshutdownreq = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'antobot_msgs/softShutdownRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '264b76d04f2863905b6aba0e5f5b18a0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool softshutdownreq
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new softShutdownRequest(null);
    if (msg.softshutdownreq !== undefined) {
      resolved.softshutdownreq = msg.softshutdownreq;
    }
    else {
      resolved.softshutdownreq = false
    }

    return resolved;
    }
};

class softShutdownResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.responseBool = null;
      this.responseString = null;
    }
    else {
      if (initObj.hasOwnProperty('responseBool')) {
        this.responseBool = initObj.responseBool
      }
      else {
        this.responseBool = false;
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
    // Serializes a message object of type softShutdownResponse
    // Serialize message field [responseBool]
    bufferOffset = _serializer.bool(obj.responseBool, buffer, bufferOffset);
    // Serialize message field [responseString]
    bufferOffset = _serializer.string(obj.responseString, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type softShutdownResponse
    let len;
    let data = new softShutdownResponse(null);
    // Deserialize message field [responseBool]
    data.responseBool = _deserializer.bool(buffer, bufferOffset);
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
    return 'antobot_msgs/softShutdownResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '64df45fda081ce59f91d7993b5be89f3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool responseBool
    string responseString
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new softShutdownResponse(null);
    if (msg.responseBool !== undefined) {
      resolved.responseBool = msg.responseBool;
    }
    else {
      resolved.responseBool = false
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
  Request: softShutdownRequest,
  Response: softShutdownResponse,
  md5sum() { return 'f4f225f161cdec955f047b31d2533a97'; },
  datatype() { return 'antobot_msgs/softShutdown'; }
};
