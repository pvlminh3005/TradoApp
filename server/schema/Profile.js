const mongoose = require("mongoose")
const Schema = mongoose.Schema
const { ObjectID } = mongoose.Schema.Types

const ProfileSchema = new Schema({
    _id:{
        type:ObjectID,
        ref: "account",
    },
    image:{
        type: String,
    },
    name: {
        type: String,
    },
    fame:{
        type:Number,
    },
    star: {
        type:Number,
    },
    count_star:{
        type:Number,
        default:0,
    },
    feed_back:{
        type:Number,
        default:0,
    },
    count_sell:{
        type:Number,
        default:0
    },
    address:{
        type:String,
    },
    phone_number:{
        type:String,
    },
    id_card:{
        type:String,
    },
    description:{
        type:String,
    },
    count_buy:{
        type:Number,
        default:0
    },
    registration_data: {
        type: Date,
        default: Date.now,
    }
})

module.exports = Profile = mongoose.model("profile", ProfileSchema)