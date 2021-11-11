const mongoose = require("mongoose")
const Schema = mongoose.Schema
const { ObjectID } = mongoose.Schema.Types

const OrderSchema = new Schema({
    idUser:{
        type:ObjectID,
        ref: "profile",
        required: true
    },
    item:[
        {
            productId: { type: ObjectID, ref: "product", required: true},
            amount: Number,
        },
    ],
    totalmoney:Number,
    registration_data: {
        type: Date,
        default: Date.now,
    }
})

module.exports = Order = mongoose.model("order", OrderSchema)