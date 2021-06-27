'use strict';
const fs = require('fs');
const pump = require('mz-modules/pump');
const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const list = await this.ctx.model.List.find();
    await this.ctx.render('/list.html', {
      list,
    });
  }
  async add() {
    await this.ctx.render('/listForm.html');
  }
  async doAdd() {
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
    const image = new this.ctx.model.List(Object.assign(files, parts.field));
    await image.save();
    await this.ctx.redirect('/list');
  }
  async delete() {
    const { id } = this.ctx.request.query;
    await this.ctx.model.List.deleteOne({ _id: id });
    await this.ctx.redirect('/list');
  }
}

module.exports = HomeController;
