const mongoose = require("mongoose")
const Schema = mongoose.Schema
const { ObjectID } = mongoose.Schema.Types

const ReviewSchema = new Schema({
    idProduct:{
        type:ObjectID,
        ref: "product",
        required: true
    },
    idUser:{
        type:ObjectID,
        ref: "profile",
        required: true
    },
    comment:{
        type:String,
        required: true
    },
    stars:{
        type:Number,
    },
    registration_data: {
        type: Date,
        default: Date.now,
    },
})

module.exports = Review = mongoose.model("review", ReviewSchema)