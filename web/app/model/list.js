/* eslint-disable indent */
'use strict';
module.exports = app => {
    const mongoose = app.mongoose;
    const Schema = mongoose.Schema;
    const d = new Date();
    const ListSchema = new Schema({
        title: { type: String },
        price: { type: String },
        url: { type: String },
        status: { type: String },
        subtitle: { type: String },
        add_time: {
            type: Number,
            default: d.getTime(),
        },

    });
    return mongoose.model('List', ListSchema, 'list');
};
