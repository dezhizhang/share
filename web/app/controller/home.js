/*
 * :file description: 
 * :name: /share/web/app/controller/home.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 09:12:26
 * :last editor: 张德志
 * :date last edited: 2021-06-26 09:34:04
 */
'use strict';

const Controller = require('egg').Controller;

class HomeController extends Controller {
  async index() {
    await this.ctx.render('/index.html');
  }
}

module.exports = HomeController;
