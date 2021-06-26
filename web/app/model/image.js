/*
 * :file description: 
 * :name: /share/web/app/model/image.js
 * :author: 张德志
 * :copyright: (c) 2021, Tungee
 * :date created: 2021-06-26 16:55:05
 * :last editor: 张德志
 * :date last edited: 2021-06-26 16:55:45
 */
'use strict';
module.exports = app => {
    const mongoose = app.mongoose;
    const Schema = mongoose.Schema;
    const d = new Date();
    const ImageSchema = new Schema({
        name:{ type:String },
        url:{ type:String },
        add_time:{
            type:Number,
            default:d.getTime()
        }

    });
    return mongoose.model('Image',ImageSchema,'image');
}