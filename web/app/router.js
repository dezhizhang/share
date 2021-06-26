/*
 * :file description: 
 * :name: /share/web/app/router.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 09:12:26
 * :last editor: 张德志
 * :date last edited: 2021-06-26 11:57:32
 */
'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  router.get('/', controller.table.index);
  router.get('/table', controller.table.index);
  router.get('/table/add',controller.table.add);
  router.post('/table/doAdd',controller.table.doAdd);
};
