/*
 * :file description:
 * :name: /share/web/app/controller/api.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 14:25:36
 * :last editor: 张德志
 * :date last edited: 2021-06-27 00:42:46
 */
'use strict';
const fs = require('fs');
const pump = require('mz-modules/pump');

const Controller = require('egg').Controller;

class ApiController extends Controller {
  async list() {
    const data = await this.ctx.model.Table.find();
    this.ctx.body = {
      code: 200,
      msg: 'ok',
      data,
    };
  }

  async upload() {
    const parts = this.ctx.multipart({ autoFields: true });
    let files = {};
    let stream;
    while ((stream = await parts()) != null) {
      if (!stream.filename) {
        break;
      }
      const fieldname = stream.fieldname; // file表单的名字
      // 上传图片的目录
      const dir = await this.service.tools.getUploadFile(stream.filename);
      const target = dir.uploadDir;
      const writeStream = fs.createWriteStream(target);
      await pump(stream, writeStream);
      files = Object.assign(files, {
        [fieldname]: dir.saveDir,
      });
    }
    const image = new this.ctx.model.Image(Object.assign(files, parts.field));
    await image.save();
    this.ctx.body = {
      code: 200,
      msg: '上传成功',
      data: null,
    };
  }
  async add() {
    const data = this.ctx.request.body;
    const form = new this.ctx.model.Form(data);
    await form.save();
    this.ctx.body = {
      code: 200,
      msg: '添加成功',
      data: null,
    };
  }
}

module.exports = ApiController;
