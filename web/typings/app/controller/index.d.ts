// This file is created by egg-ts-helper@1.25.9
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportApi = require('../../../app/controller/api');
import ExportHome = require('../../../app/controller/home');
import ExportImage = require('../../../app/controller/image');
import ExportTable = require('../../../app/controller/table');

declare module 'egg' {
  interface IController {
    api: ExportApi;
    home: ExportHome;
    image: ExportImage;
    table: ExportTable;
  }
}
