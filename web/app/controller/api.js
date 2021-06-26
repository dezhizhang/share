/*
 * :file description: 
 * :name: /share/web/app/controller/api.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 14:25:36
 * :last editor: 张德志
 * :date last edited: 2021-06-26 14:27:26
 */
'use strict';

const Controller = require('egg').Controller;

class ApiController extends Controller {
  async list() {
   const data = await this.ctx.model.Table.find();
   this.ctx.body = {
       code:200,
       msg:'ok',
       data:data
   }
  }
}

module.exports = ApiController;
