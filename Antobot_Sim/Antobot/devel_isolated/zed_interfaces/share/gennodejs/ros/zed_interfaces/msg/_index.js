
"use strict";

let Skeleton3D = require('./Skeleton3D.js');
let BoundingBox2Df = require('./BoundingBox2Df.js');
let Keypoint2Df = require('./Keypoint2Df.js');
let BoundingBox3D = require('./BoundingBox3D.js');
let Skeleton2D = require('./Skeleton2D.js');
let PosTrackStatus = require('./PosTrackStatus.js');
let Keypoint2Di = require('./Keypoint2Di.js');
let Object = require('./Object.js');
let BoundingBox2Di = require('./BoundingBox2Di.js');
let RGBDSensors = require('./RGBDSensors.js');
let ObjectsStamped = require('./ObjectsStamped.js');
let Keypoint3D = require('./Keypoint3D.js');
let PlaneStamped = require('./PlaneStamped.js');

module.exports = {
  Skeleton3D: Skeleton3D,
  BoundingBox2Df: BoundingBox2Df,
  Keypoint2Df: Keypoint2Df,
  BoundingBox3D: BoundingBox3D,
  Skeleton2D: Skeleton2D,
  PosTrackStatus: PosTrackStatus,
  Keypoint2Di: Keypoint2Di,
  Object: Object,
  BoundingBox2Di: BoundingBox2Di,
  RGBDSensors: RGBDSensors,
  ObjectsStamped: ObjectsStamped,
  Keypoint3D: Keypoint3D,
  PlaneStamped: PlaneStamped,
};
