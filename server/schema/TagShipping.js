const mongoose = require("mongoose")
const Schema = mongoose.Schema
const { ObjectID } = mongoose.Schema.Types

const TagShippingSchema = new Schema({
    idUser:{
        type:ObjectID,
        ref: "profile",
        required: true
    },
    name:{
        type:String,
    },
    phone:{
        type:String,
        required:true,
    },
    address:{
        type:String,
        required:true,
    },
    note:{
        type:String,
    },
    select:{
        type:Boolean,
        default: false,
    }
})

module.exports = TagShipping = mongoose.model("tagshipping", TagShippingSchema)