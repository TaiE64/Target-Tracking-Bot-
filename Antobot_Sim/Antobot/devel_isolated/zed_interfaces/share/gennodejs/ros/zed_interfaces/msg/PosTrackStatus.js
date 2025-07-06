// Auto-generated. Do not edit!

// (in-package zed_interfaces.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PosTrackStatus {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.status = null;
    }
    else {
      if (initObj.hasOwnProperty('status')) {
        this.status = initObj.status
      }
      else {
        this.status = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PosTrackStatus
    // Serialize message field [status]
    bufferOffset = _serializer.uint8(obj.status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PosTrackStatus
    let len;
    let data = new PosTrackStatus(null);
    // Deserialize message field [status]
    data.status = _deserializer.uint8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a message object
    return 'zed_interfaces/PosTrackStatus';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '16c87ef5951f2667d385cacb152a0d50';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Status constants
    # SEARCHING - The camera is searching for a previously known position to locate itself
    # OK - Positional tracking is working normally
    # OFF - Positional tracking is not enabled.
    # FPS_TOO_LOW - Effective FPS is too low to give proper results for motion tracking. Consider using PERFORMANCES parameters (DEPTH_MODE_PERFORMANCE, low camera resolution (VGA,HD720))
    # SEARCHING_FLOOR_PLANE - The camera is searching for the floor plane to locate itself related to it, the REFERENCE_FRAME::WORLD will be set afterward.
    uint8 SEARCHING=0 
    uint8 OK = 1
    uint8 OFF = 2
    uint8 FPS_TOO_LOW = 3
    uint8 SEARCHING_FLOOR_PLANE = 3
    
    # Status
    uint8 status
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PosTrackStatus(null);
    if (msg.status !== undefined) {
      resolved.status = msg.status;
    }
    else {
      resolved.status = 0
    }

    return resolved;
    }
};

// Constants for message
PosTrackStatus.Constants = {
  SEARCHING: 0,
  OK: 1,
  OFF: 2,
  FPS_TOO_LOW: 3,
  SEARCHING_FLOOR_PLANE: 3,
}

module.exports = PosTrackStatus;
