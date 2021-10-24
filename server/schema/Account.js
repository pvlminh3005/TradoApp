const mongoose = require("mongoose")
const Schema = mongoose.Schema
const { ObjectID } = mongoose.Schema.Types

const AccountSchema = new Schema({
    username: {
        type: String,
        unique: true,
    },
    email: {
        type: String,
        unique: true,
    },
    password: {
        type: String,
    },
    registration_data: {
        type: Date,
        default: Date.now,
    }
})

module.exports = Account = mongoose.model("account", AccountSchema)