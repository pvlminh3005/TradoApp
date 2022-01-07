const mongoose = require("mongoose")
const Profile = require('../schema/Profile')
const StatusCode = require('../common/StatusCode');

//#region update profile
const updateprofile = async (req, res) => {

    const {idUser, name, id_card, phone, address, email, image} = req.body

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    try{
        const profile = await Profile.findOne({_id:idUser});
        if (!profile) 
            throw new Error("Profile doesn't exist")
        
        if(name)
            profile.name = name
        if(id_card)
            profile.id_card = id_card
        if(phone)
            profile.phone_number = phone
        if(address)
            profile.address = address
        if(email)
            profile.email = email
        if(image)
            profile.image = image

        const result = await profile.save().catch(err=>{
            throw new Error("Cant update profile")
        })

        return res.status(StatusCode.SuccessStatus).json({
            profile: result,
            msg: "Update profile success"
        })
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
    
}
//#endregion

//#region get profile
const getProfile = async (req, res) => {

    const {idUser} = req.query

    if(!idUser)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    try {
        const profile = await Profile.find({_id: mongoose.Types.ObjectId(idUser)}).populate('_id')

        return res.status(StatusCode.SuccessStatus).json({profile: profile, mgs: ""});

    } catch (error) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
    
}
//#endregion

module.exports = {
    updateprofile,
    getProfile,
}