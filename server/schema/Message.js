const mongoose = require("mongoose")
const Schema = mongoose.Schema
const { ObjectID } = mongoose.Schema.Types

const MessageSchema = new Schema({
    idRoom:{
        type:ObjectID,
        ref: "room",
        required: true
    },
    idUser:{
        type:ObjectID,
        ref: "profile",
        required: true
    },
    message:{
        type:String,
        require: true
    },
    registration_data: {
        type: Date,
        default: Date.now,
    }
})

module.exports = Message = mongoose.model("message", MessageSchema)