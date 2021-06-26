/*
 * :file description: 
 * :name: /share/web/app/router.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 09:12:26
 * :last editor: 张德志
 * :date last edited: 2021-06-26 17:16:21
 */
'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  //table
  router.get('/', controller.table.index);
  router.get('/table', controller.table.index);
  router.get('/table/add',controller.table.add);
  router.post('/table/doAdd',controller.table.doAdd);
  router.get('/table/delete',controller.table.delete);
  
  //image
  router.get('/image',controller.image.index);
  router.get('/image/add',controller.image.add);
  router.post('/image/doAdd',controller.image.doAdd);
  router.get('/image/delete',controller.image.delete);




  //api
  router.get('/api/table/list',controller.api.list);
  //图片上传
  router.post('/api/image/upload',controller.api.upload);
};
