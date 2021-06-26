/*
 * :file description: 
 * :name: /share/web/app/controller/image.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 09:12:26
 * :last editor: 张德志
 * :date last edited: 2021-06-26 17:16:04
 */
'use strict';
const fs=require('fs');
const pump = require('mz-modules/pump');
const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    const list = await this.ctx.model.Image.find();
    await this.ctx.render('/image.html',{
        list
    });
  }
  async add() {
    await this.ctx.render('/imageForm.html');
  }
  async doAdd() {
    let parts = this.ctx.multipart({ autoFields: true });
    let files = {};               
    let stream;
    while ((stream = await parts()) != null) {
        if (!stream.filename) {          
            break;
        }       
        let fieldname = stream.fieldname;  //file表单的名字
        //上传图片的目录
        let dir=await this.service.tools.getUploadFile(stream.filename);
        let target = dir.uploadDir;
        let writeStream = fs.createWriteStream(target);
        await pump(stream, writeStream);  
        files=Object.assign(files,{
            [fieldname]:dir.saveDir    
        })
        
    }      
    let image =new this.ctx.model.Image(Object.assign(files,parts.field));
    let result=await image.save();
    await this.ctx.redirect('/image');
  }

  async delete() {
    const { id } = this.ctx.request.query;
    await this.ctx.model.Image.deleteOne({"_id":id});
    await this.ctx.redirect('/image');
  }

}

module.exports = HomeController;
