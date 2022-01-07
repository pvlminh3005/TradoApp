const mongoose = require("mongoose")
const Room = require("../schema/Room")
const StatusCode = require('../common/StatusCode');
const bcrypt = require("bcryptjs");

//#region Create Room
const creatRoom = async (idUser1, idUser2) =>{

    const room = await Room.findOne({$or:[
        {user1: idUser1},
        {user1: idUser2}
    ],$or: [
        {user2: idUser1},
        {user2: idUser2}]
    }).populate('user1').populate('user2')
    if(room)
        return room
    const newRoom = new Room({
        user1: idUser1,
        user2: idUser2
    })

    const room1 = await newRoom.save().catch(()=>{
        return null
    })
    return room1
}
//#endregion

//#region Get all room
const getAllRoom = async (req,res) => {
    const {idUser} = req.query

    try{
        const allRoom = await Room.find({$or:[
            {user1: idUser},
            {user2: idUser}
        ]}).populate('user1').populate('user2')

        return res.status(StatusCode.SuccessStatus).json({
            code: StatusCode.SuccessStatus,
            data: allRoom,
        })
    }
    catch{
        return res.status(StatusCode.CannotAccess).json({
            code: StatusCode.CannotAccess,
            message: "Fail get room",
        })
    }
}
//#endregion

module.exports = {
    creatRoom,
    getAllRoom,
}