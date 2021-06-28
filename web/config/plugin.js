
'use strict';

/** @type Egg.EggPlugin */
// module.exports = {
//   // had enabled by egg
//   // static: {
//   //   enable: true,
//   // }
// };
// 配置mongodb
exports.mongoose = {
  enable: true,
  package: 'egg-mongoose',
};
// 配置ejs
exports.ejs = {
  enable: true,
  package: 'egg-view-ejs',
};

exports.mongo = {
  enable: true,
  package: 'egg-mongo-native',
};

