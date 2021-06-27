/* eslint-disable indent */
'use strict';
module.exports = app => {
    const mongoose = app.mongoose;
    const Schema = mongoose.Schema;
    const d = new Date();
    const ImageSchema = new Schema({
        name: { type: String },
        url: { type: String },
        add_time: {
            type: Number,
            default: d.getTime(),
        },

    });
    return mongoose.model('Image', ImageSchema, 'image');
};
