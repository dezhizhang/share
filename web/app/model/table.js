/*
 * :file description: 
 * :name: /share/web/app/model/table.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 11:57:43
 * :last editor: 张德志
 * :date last edited: 2021-06-26 12:23:00
 */
'use strict';
module.exports = app => {
    const mongoose = app.mongoose;
    const Schema = mongoose.Schema;
    const d = new Date();
    const TableSchema = new Schema({
        name:{ type:String },
        age:{ type:String },
        sex:{ type:Number },
        phone:{ type:String },
        address:{ type:String },
        add_time:{
            type:Number,
            default:d.getTime()
        }

    });
    return mongoose.model('Table',TableSchema,'table');
}