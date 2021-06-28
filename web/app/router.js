/* eslint-disable spaced-comment */
'use strict';

/**
 * @param {Egg.Application} app - egg application
 */
module.exports = app => {
  const { router, controller } = app;
  //table
  router.get('/', controller.table.index);
  router.get('/table', controller.table.index);
  router.get('/table/add', controller.table.add);
  router.post('/table/doAdd', controller.table.doAdd);
  router.get('/table/delete', controller.table.delete);
  //image
  router.get('/image', controller.image.index);
  router.get('/image/add', controller.image.add);
  router.post('/image/doAdd', controller.image.doAdd);
  router.get('/image/delete', controller.image.delete);
  //form表单
  router.get('/form', controller.form.index);
  router.get('/form/add', controller.form.add);
  router.post('/form/doAdd', controller.form.doAdd);
  router.get('/form/delete', controller.form.delete);
  //列表
  router.get('/list', controller.list.index);
  router.get('/list/add', controller.list.add);
  router.post('/list/doAdd', controller.list.doAdd);
  router.get('/list/delete', controller.list.delete);
  //api
  router.get('/api/table/list', controller.api.list);
  //图片上传
  router.post('/api/image/upload', controller.api.upload);
  router.get('/api/image/download', controller.api.download);
  //表单添加
  router.post('/api/form/add', controller.api.add);
  //列表页
  router.get('/api/list/search', controller.api.search);

};
