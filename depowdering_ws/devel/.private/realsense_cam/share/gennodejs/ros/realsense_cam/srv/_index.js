
"use strict";

let FetchOneRGB = require('./FetchOneRGB.js')
let SaveOnePCL = require('./SaveOnePCL.js')
let FetchOnePointCloud = require('./FetchOnePointCloud.js')
let FindBoxPoints = require('./FindBoxPoints.js')
let SaveOneRGB = require('./SaveOneRGB.js')
let FindWorkspaceCenter = require('./FindWorkspaceCenter.js')
let FetchPointCloudConverted = require('./FetchPointCloudConverted.js')
let FetchOneDepth = require('./FetchOneDepth.js')

module.exports = {
  FetchOneRGB: FetchOneRGB,
  SaveOnePCL: SaveOnePCL,
  FetchOnePointCloud: FetchOnePointCloud,
  FindBoxPoints: FindBoxPoints,
  SaveOneRGB: SaveOneRGB,
  FindWorkspaceCenter: FindWorkspaceCenter,
  FetchPointCloudConverted: FetchPointCloudConverted,
  FetchOneDepth: FetchOneDepth,
};
