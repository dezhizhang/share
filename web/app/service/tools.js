/*
 * :file description: 
 * :name: /share/web/app/service/tools.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 16:58:50
 * :last editor: 张德志
 * :date last edited: 2021-06-26 17:06:35
 */
'use strict';
const path = require('path');
const Service = require('egg').Service;
const sd = require('silly-datetime');
const mkdirp = require('mz-modules/mkdirp');

class ToolsService extends Service {
    //生成验证码
  
    //生成上传文件
    async getUploadFile(filename) {
        let day = sd.format(new Date(),'YYYY-MM-DD');
        let dir = path.join(this.config.uploadDir,day);
        await mkdirp(dir);
        let d = await this.getTime();
        let uploadDir = path.join(dir,d+path.extname(filename));
        return {
            uploadDir:uploadDir,
            saveDir:uploadDir.slice(3).replace(/\\/g,'/')
        }
    }
    //生成时间
    async getTime() {
        let t = new Date();
        return t.getTime();

    }
 
}

module.exports = ToolsService;