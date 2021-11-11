const mongoose = require("mongoose")
const Product = require('../schema/Product')
const StatusCode = require('../common/StatusCode');
const Cart = require("../schema/Cart");

//#region Add cart
const addCart = async (req, res) => {
    const {idUser, idProduct, amount} = req.body

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }
    
    try{
        const product = await Product.findOne({_id:idProduct}).catch((err)=>{throw err})
        if(!product)
            return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Cant find product" });
        if(product.quantity<amount)
            return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Not enough products" });
        const newCart = new Cart({
            idUser:idUser,
            idProduct:idProduct,
            amount:amount
        })
        const cart = await newCart.save().catch(err=>{
            throw new Error("Cant add cart")
        })
        return res.status(StatusCode.SuccessStatus).json({ cart: cart, msg: "Add to cart success"});
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region Delete cart
const deleteCart = async (req, res) => {
    const {idCart, idUser} = req.body

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }
    
    try{
        const deleteCart = await Cart.deleteOne({_id:idCart}).catch(err=>{throw err})
        if(!deleteCart.deletedCount)
            return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Dont delete product from cart" });
        return res.status(StatusCode.SuccessStatus).json({msg: "Delete product from cart success"});
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region Get cart
const getCart = async (req, res) => {
    if(!req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }
    
    try{
        const cart = await Cart.find({idUser:mongoose.Types.ObjectId(req.TradoUser.id)}).populate('idProduct').populate('idUser').sort({registration_data:-1}).catch(err=>{throw err})
        return res.status(StatusCode.SuccessStatus).json({cart:cart})
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

module.exports = {
    addCart,
    deleteCart,
    getCart,
}