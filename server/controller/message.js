const mongoose = require("mongoose")
const Message = require("../schema/Message")
const Room = require("../schema/Room")
const StatusCode = require('../common/StatusCode');
const bcrypt = require("bcryptjs");

//#region Send Message
const sendMessage = async (idUser, idRoom, message) =>{

    const newMessage = new Message({
        idRoom: idRoom,
        idUser: idUser,
        message: message,
    })

    const Messagesend = await newMessage.save().catch(()=>{
        return null
    })

    return Messagesend
}
//#endregion

//#region Get Message
const getMessage = async (req, res)=>{
    const {idRoom} = req.query

    try{
        const room = await Room.findById(idRoom)
        if(!room)
            return res.status(StatusCode.ResourceNotFound).json({
                code: StatusCode.ResourceNotFound,
                message: "Dont have room",
            })

        const allMessage = await Message.find().sort({registration_data:1}).limit(100)

        return res.status(StatusCode.SuccessStatus).json({
            code: StatusCode.SuccessStatus,
            data: allMessage,
        })
    }
    catch{
        return res.status(StatusCode.CannotAccess).json({
            code: StatusCode.CannotAccess,
            message: "Fail get data message",
        })
    }

}
//#endregion
module.exports = {
    sendMessage,
    getMessage,
}