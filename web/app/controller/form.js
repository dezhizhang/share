/*
 * :file description: 
 * :name: /share/web/app/controller/form.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 09:12:26
 * :last editor: 张德志
 * :date last edited: 2021-06-26 23:51:43
 */
'use strict';

const Controller = require('egg').Controller;

class FormController extends Controller {
  async index() {
    const list = await this.ctx.model.Form.find();
    await this.ctx.render('/form.html',{
      list
    });
  }
  async add() {
    await this.ctx.render('/formForm.html')
  }
  async doAdd() {
    const data = this.ctx.request.body;
    const form = new this.ctx.model.Form(data);
    await form.save();
    await this.ctx.redirect('/form');
  }
  async delete() {
    const { id } = this.ctx.request.query;
    await this.ctx.model.Form.deleteOne({'_id':id});
    await this.ctx.redirect('/form'); 
  }
}

module.exports = FormController;
