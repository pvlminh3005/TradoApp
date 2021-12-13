const mongoose = require("mongoose")
const Schema = mongoose.Schema
const { ObjectID } = mongoose.Schema.Types

const OrderSchema = new Schema({
    idUser:{
        type:ObjectID,
        ref: "profile",
        required: true
    },
    name: String,
    statusOrder: Number,
    totalPrice: Number,
    methodPayment: Number,
    address: {
        type:ObjectID,
        ref: "tagshipping",
        required: true
    },
    cart:[
        {
            cartId: { type: ObjectID, ref: "cart", required: true}
        },
    ],
    timeOrder: { type: Date, default: null },
    timePayment: { type: Date, default: null },
    timeDelivery: { type: Date, default: null },
    timeFinish: { type: Date, default: null },
    timeCancel: { type: Date, default: null },
    registration_data: {
        type: Date,
        default: Date.now,
    }
})

module.exports = Order = mongoose.model("order", OrderSchema)