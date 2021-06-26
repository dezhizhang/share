/*
 * :file description: 
 * :name: /share/web/app/model/form.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 11:57:43
 * :last editor: 张德志
 * :date last edited: 2021-06-26 23:38:51
 */
'use strict';
module.exports = app => {
    const mongoose = app.mongoose;
    const Schema = mongoose.Schema;
    const d = new Date();
    const FormSchema = new Schema({
        name:{ type:String },
        age:{ type:String },
        sex:{ type:Number },
        phone:{ type:String },
        hobby:{ type:String },
        native:{ type:String },
        address:{ type:String },
        add_time:{
            type:Number,
            default:d.getTime()
        }

    });
    return mongoose.model('Form',FormSchema,'form');
}