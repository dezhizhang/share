/*
 * :file description: 
 * :name: /share/web/app/controller/table.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 09:12:26
 * :last editor: 张德志
 * :date last edited: 2021-06-26 14:24:27
 */
'use strict';

const Controller = require('egg').Controller;

class TableController extends Controller {
  async index() {
    const list = await this.ctx.model.Table.find();
    await this.ctx.render('/table.html',{
        list
    });
  }
  async add() {
      await this.ctx.render('/tableForm.html')
  }
  async doAdd() {
    const data = this.ctx.request.body;
    const table = new this.ctx.model.Table(data)
    await table.save();
    await this.ctx.redirect('/table');
  }
  async delete() {
      const data = await this.ctx.request.query;
      await this.ctx.model.Table.deleteOne({"_id":data.id});
      await this.ctx.redirect('/table');
  }
}

module.exports = TableController;
