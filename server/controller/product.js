const mongoose = require("mongoose")
const Product = require("../schema/Product")
const Profile = require("../schema/Profile")
const StatusCode = require('../common/StatusCode');

//#region Create product
const createProduct = async (req, res) => {
    const {idUserSell, tag, imageUrl, title, description, quantity, price, priceSale, amountView} = req.body

    if(req.TradoUser.id != idUserSell || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    if(!idUserSell || !title)
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Dont have title or id user" });

    if(!new RegExp("^[0-9a-fA-F]{24}$").test(idUserSell))
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Id user incorrect" });

    try{
        
        await Profile.findOne({_id:mongoose.Types.ObjectId(idUserSell)}).then((profile)=>{
            if(!profile)
                throw new Error("Dont find user")
        }).catch((err)=>{
            throw new Error("Dont find user")
        })

        const newProduct = new Product({
            idUserSell:idUserSell,
            tag:tag,
            imageUrl:imageUrl,
            title:title,
            description:description,
            quantity:quantity,
            price:price,
            priceSale:priceSale,
            amountView:amountView,
        })

        const product = await newProduct.save().catch(()=>{
            throw new Error("Cant create product")
        })

        return res.status(StatusCode.SuccessStatus).json({
            product:product,
            msg: "Create product success"
        })
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region Get product user
const getProductUser = async (req, res) => {

    const {idUser} = req.query;

    if(!idUser)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Dont have id user" });
    }

    try {
        const product = await Product.find({idUserSell: mongoose.Types.ObjectId(idUser)})

        return res.status(StatusCode.SuccessStatus).json({product: product});

    } catch (error) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

module.exports = {
    createProduct,
    getProductUser,
}