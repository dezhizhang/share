// This file is created by egg-ts-helper@1.25.9
// Do not modify this file!!!!!!!!!

import 'egg';
import ExportHome = require('../../../app/controller/home');
import ExportTable = require('../../../app/controller/table');

declare module 'egg' {
  interface IController {
    home: ExportHome;
    table: ExportTable;
  }
}
