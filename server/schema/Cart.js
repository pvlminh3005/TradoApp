const mongoose = require("mongoose")
const Schema = mongoose.Schema
const { ObjectID } = mongoose.Schema.Types

const CartSchema = new Schema({
    idUser:{
        type:ObjectID,
        ref: "profile",
        required: true
    },
    idProduct:{
        type:ObjectID,
        ref: "product",
        required: true
    },
    amount:Number,
    show: {
        type: Boolean,
        default: true,
    },
    registration_data: {
        type: Date,
        default: Date.now,
    }
})

module.exports = Cart = mongoose.model("cart", CartSchema)