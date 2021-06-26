/*
 * :file description: 
 * :name: /share/web/app/controller/table.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 09:12:26
 * :last editor: 张德志
 * :date last edited: 2021-06-26 11:57:12
 */
'use strict';

const Controller = require('egg').Controller;

class TableController extends Controller {
  async index() {
    await this.ctx.render('/table.html');
  }
  async add() {
      await this.ctx.render('/tableForm.html')
  }
  async doAdd() {
    let data = this.ctx.request.body;
    let table = new this.ctx.model.Table(data);
    await table.save();
    await this.success('/table','增加用户成功');
  }
}

module.exports = TableController;
