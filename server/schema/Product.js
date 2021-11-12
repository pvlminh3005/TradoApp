const mongoose = require("mongoose")
const Schema = mongoose.Schema
const { ObjectID } = mongoose.Schema.Types

const ProductSchema = new Schema({
    idUserSell: {
        type: ObjectID,
        ref: "account",
        required: true
    },
    tag: {
        type: String,
    },
    imageUrl: [
        {
            type: String,
            default: '',
        },
    ],
    title: {
        type: String,
        required: true
    },
    description: {
        type: String,
    },
    quantity: {
        type: Number,
        default: 1,
    },
    price: {
        type: Number,
        default: 0.0,
    },
    priceSale: {
        type: Number,
        default: 0
    },
    amountView: {
        type: Number,
        default: 0
    }
})

module.exports = Product = mongoose.model("product", ProductSchema)