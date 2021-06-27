/* eslint-disable indent */
'use strict';
module.exports = app => {
    const mongoose = app.mongoose;
    const Schema = mongoose.Schema;
    const d = new Date();
    const FormSchema = new Schema({
        name: { type: String },
        age: { type: String },
        sex: { type: Number },
        phone: { type: String },
        hobby: { type: String },
        native: { type: String },
        address: { type: String },
        add_time: {
            type: Number,
            default: d.getTime(),
        },

    });
    return mongoose.model('Form', FormSchema, 'form');
};
