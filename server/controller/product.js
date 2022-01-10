const mongoose = require("mongoose")
const Product = require("../schema/Product")
const Profile = require("../schema/Profile")
const StatusCode = require('../common/StatusCode');

//#region Create product
const createProduct = async (req, res) => {
    const { idUserSell, tag, imageUrl, title, description, quantity, price, priceSale, amountView, status } = req.body

    if (req.TradoUser.id != idUserSell || !req.TradoUser.id) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    if (!idUserSell || !title)
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Dont have title or id user" });

    if (!new RegExp("^[0-9a-fA-F]{24}$").test(idUserSell))
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Id user incorrect" });

    try {

        await Profile.findOne({ _id: mongoose.Types.ObjectId(idUserSell) }).then((profile) => {
            if (!profile)
                throw new Error("Dont find user")
        }).catch((err) => {
            throw new Error("Dont find user")
        })

        const newProduct = new Product({
            idUserSell: idUserSell,
            tag: tag,
            imageUrl: imageUrl,
            title: title,
            description: description,
            quantity: quantity,
            price: price,
            priceSale: priceSale,
            status: status,
            amountView: amountView,
        })

        const product = await newProduct.save().catch(() => {
            throw new Error("Cant create product")
        })

        return res.status(StatusCode.SuccessStatus).json({
            product: product,
            msg: "Create product success"
        })
    }
    catch (error) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region Get product user
const getProductUser = async (req, res) => {

    const { idUser } = req.query;

    if (!idUser) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Dont have id user" });
    }

    try {
        const product = await Product.find({ idUserSell: mongoose.Types.ObjectId(idUser) })

        return res.status(StatusCode.SuccessStatus).json({ product: product });

    } catch (error) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region update product
const updateProduct = async (req, res) => {

    const { id, idUserSell, tag, imageUrl, title, description, quantity, price, priceSale, status, amountView } = req.body

    if (req.TradoUser.id != idUserSell || !req.TradoUser.id) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    try {
        const product = await Product.findOne({ _id: id, idUserSell: idUserSell });
        if (!product)
            throw new Error("Product doesn't exist")

        if (tag)
            product.tag = tag
        if (imageUrl) {
            if (imageUrl.length != 0)
                product.imageUrl = imageUrl
        }
        if (title)
            product.title = title
        if (description)
            product.description = description
        if (quantity)
            product.quantity = quantity
        if (price)
            product.price = price
        if (priceSale)
            product.priceSale = priceSale
        if (status)
            product.status = status
        if (amountView)
            product.amountView = amountView


        const result = await product.save().catch(err => {
            throw new Error("Cant update product")
        })

        return res.status(StatusCode.SuccessStatus).json({
            product: result,
            msg: "Update product success"
        })
    }
    catch (error) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }

}
//#endregion

//#region Get product home
const getProductHome = async (req, res) => {

    const { page } = req.query

    const pagecv = page - 1

    try {
        const product = await Product.find().limit(10).skip(pagecv * 10)

        return res.status(StatusCode.SuccessStatus).json({ product: product });

    } catch (error) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }

}
//#endregion
module.exports = {
    createProduct,
    getProductUser,
    updateProduct,
    getProductHome,
}