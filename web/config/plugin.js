/*
 * :file description: 
 * :name: /share/web/config/plugin.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 09:12:26
 * :last editor: 张德志
 * :date last edited: 2021-06-26 12:04:12
 */
'use strict';

/** @type Egg.EggPlugin */
// module.exports = {
//   // had enabled by egg
//   // static: {
//   //   enable: true,
//   // }
// };
//配置mongodb
exports.mongoose = {
  enable:true,
  package:'egg-mongoose'
}
//配置ejs
exports.ejs = {
  enable: true,
  package: 'egg-view-ejs',
};

exports.mongo = {
  enable:true,
  package:'egg-mongo-native'
}


