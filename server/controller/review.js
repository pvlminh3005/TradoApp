const mongoose = require("mongoose")
const Profile = require('../schema/Profile')
const Product = require('../schema/Product')
const Review = require('../schema/Review')
const jwt = require('jsonwebtoken');
const StatusCode = require('../common/StatusCode');
const bcrypt = require("bcryptjs");

//#region Create review
const postReview = async (req, res) => {

    const {idProduct, idUser, comment, stars} = req.body

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    if(stars>5 || stars<0)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Cant rate stars" });
    }

    try{
        const product = await Product.findOne({_id:idProduct});
        if (!product) 
            throw new Error("Product doesn't exist")
        
        const newReview = new Review({
            idProduct:idProduct,
            idUser:idUser,
            comment:comment,
            stars:stars
        })

        const review = await newReview.save().catch(err=>{
            throw new Error("Cant create review")
        })

        return res.status(StatusCode.SuccessStatus).json({
            review: review,
            msg: "Post review success"
        })
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
    
}
//#endregion

//#region Get review user
const getReviewUser = async (req, res) => {

    const {idUser} = req.query

    try{
        const review = await Review.find({idUser:idUser}).populate('idProduct').populate('idUser').catch(err=>{throw err})
        return res.status(StatusCode.SuccessStatus).json({review:review})
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
    
}
//#endregion

//#region Get review product
const getReviewProduct = async (req, res) => {

    const {idProduct} = req.query

    try{
        const review = await Review.find({idProduct:idProduct}).populate('idProduct').populate('idUser').catch(err=>{throw err})
        return res.status(StatusCode.SuccessStatus).json({review:review})
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
    
}
//#endregion

module.exports = {
    postReview,
    getReviewUser,
    getReviewProduct,
}