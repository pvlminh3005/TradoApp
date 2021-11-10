const mongoose = require("mongoose")
const TagShipping = require('../schema/TagShipping')
const StatusCode = require('../common/StatusCode');

//#region Create tag
const createTag = async (req, res) => {
    const {idUser, name, phone, address, note} = req.body

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    try{
        if (!phone || !address) 
            throw new Error("Please complete all required fields")
        
        const newTag = new TagShipping({
            idUser:idUser,
            name:name,
            phone:phone,
            address:address,
            note:note,
        })

        const tag = await newTag.save().catch(err=>{
            throw new Error("Cant create tag shipping")
        })

        return res.status(StatusCode.SuccessStatus).json({
            tagshipping: tag,
            msg: "Post tag success"
        })
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region Get all tag
const getAllTag = async (req, res) => {
    const {idUser} = req.query

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    try{
        const tag = await TagShipping.find({idUser:idUser}).populate('idUser').catch(err=>{throw err})
        return res.status(StatusCode.SuccessStatus).json({tagshipping:tag})
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }

}
//#endregion

//#region Update tag
const updateTag = async (req, res) => {
    const {idTag, name, phone, address, note} = req.body

    try{
        if(!phone || !address)
            throw new Error("Dont have phone or address")
        const checktag = await TagShipping.findOne({_id:idTag, idUser:req.TradoUser.id}).catch(err=>{throw err})
        if(!checktag)
            throw new Error("Dont update")
        const editTag = await TagShipping.findOneAndUpdate({_id:idTag}, {
            name:name,
            phone:phone,
            address:address,
            note: note,
        },{new:true}).catch(err=>{throw err})
        return res.status(StatusCode.SuccessStatus).json({tagshipping:editTag,msg: "Update success"}) 
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region Delete tag
const deleteTag = async (req, res) => {
    const {idTag} = req.query

    try{
        const checktag = await TagShipping.findOne({_id:idTag, idUser:req.TradoUser.id}).catch(err=>{throw err})
        if(!checktag)
            throw new Error("Dont delete")
        const deleteTag = await TagShipping.findByIdAndRemove({_id:idTag})
        return res.status(StatusCode.SuccessStatus).json({tagshipping:deleteTag,msg:"Delete success"}) 
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region Get one tag
const getTag = async (req, res) => {
    const {idTag} = req.query

    try{
        const checktag = await TagShipping.findOne({_id:idTag, idUser:req.TradoUser.id}).catch(err=>{throw err})
        if(!checktag)
            throw new Error("Dont get tag")
        const tag = await TagShipping.find({_id:idTag}).populate('idUser').catch(err=>{throw err})
        return res.status(StatusCode.SuccessStatus).json({tagshipping:tag})
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region Select tag
const selectTag = async (req, res) => {
    const {idTag} = req.body

    const session = await TagShipping.startSession()
    session.startTransaction()

    try{
        const checktag = await TagShipping.findOne({_id:idTag, idUser:req.TradoUser.id}).catch(err=>{throw err})
        if(!checktag)
            throw new Error("Dont select tag")
        
        const removSelTag = await TagShipping.findOneAndUpdate({select:true},{select:false},{session:session}).catch(err=>{throw err})
        const selTag = await TagShipping.findOneAndUpdate({_id:idTag},{select:true},{session:session,new:true}).catch(err=>{throw err})

        if(!selTag)
            throw new Error("Dont update")

        await session.commitTransaction()
        session.endSession()
        return res.status(StatusCode.SuccessStatus).json({tagshipping:selTag})
    }
    catch(error){
        await session.abortTransaction()
        session.endSession()

        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

module.exports = {
    createTag,
    getAllTag,
    updateTag,
    deleteTag,
    getTag,
    selectTag,
}