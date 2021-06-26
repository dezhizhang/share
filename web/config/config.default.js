
/* eslint valid-jsdoc: "off" */

'use strict';

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
  /**
   * built-in config
   * @type {Egg.EggAppConfig}
   **/
  const config = exports = {};

  // use for cookie sign key, should change to your own and keep security
  config.keys = appInfo.name + '_1624669936713_6858';

  config.uploadDir = 'app/public/upload';

  // add your middleware config here
  config.middleware = [];

  config.mongoose = {
    client:{
      url:'mongodb://127.0.0.1/share',
      options:{}
    }
  }

  //配置csrf
  config.security = {
    csrf:{
      enable:false
    }
  }
 
  config.view = {
    mapping: {
      '.html': 'ejs',
    },
  };

  // add your user config here
  const userConfig = {
    // myAppName: 'egg',
  };

  return {
    ...config,
    ...userConfig,
  };
};
