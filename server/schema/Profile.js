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
        default: "",
    },
    name: {
        type: String,
        default: "",
    },
    email: {
        type: String,
        default: "",
    },
    fame:{
        type:Number,
        default: 0,
    },
    star: {
        type:Number,
        default: 0,
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
        default: "",
    },
    phone_number:{
        type:String,
        default: "",
    },
    id_card:{
        type:String,
        default: "",
    },
    description:{
        type:String,
        default: "",
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