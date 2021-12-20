const mongoose = require("mongoose")
const StatusCode = require('../common/StatusCode');
const Order = require("../schema/Order");
const Cart = require("../schema/Cart");
const TagShipping = require("../schema/TagShipping");

//#region creat order
const createOrder = async (req, res)=>{

    const {idUser, name, totalPrice, methodPayment, address, cart} = req.body

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    const session = await Order.startSession()
    session.startTransaction()

    try{

        const opts = {session}

        const checkAddress = await TagShipping.findOne({_id: address}).catch((err)=>{throw err})
        if(!checkAddress)
            return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Cant find address" });

        const timePayment = methodPayment!=0 ? new Date().toLocaleString() : null

        for(let i=0; i<cart.length; i++)
        {
            const checkCart = await Cart.findOne({_id:cart[i], idUser: idUser}).catch((err)=>{throw err})
            if(!checkCart)
                throw new Error("Cart dont exist")

            const newOrder = new Order({
                idUser:idUser,
                name: name,
                statusOrder: 0,
                totalPrice: totalPrice,
                methodPayment: methodPayment,
                address: address,
                cart: cart[i],
                timeOrder: new Date().toLocaleString(),
                timePayment: timePayment
            })
    
            const order = await newOrder.save(opts).catch(err=>{
                throw new Error("Cant create order")
            })
        }

        await session.commitTransaction()
        session.endSession()

        return res.status(StatusCode.SuccessStatus).json({ order: cart, msg: "Create order success"});
    }
    catch(error){
        await session.abortTransaction()
        session.endSession()
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region set to ship
const setToShipOrder = async (req, res)=>{
    const {idUser, idOrder} = req.body

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    try{
        
        const shipOrder = await Order.find({_id: { $in: idOrder }}).populate('cart')

        for(let i=0; i<shipOrder.length; i++)
        {
            if(shipOrder[i].cart.idUser != idUser || shipOrder[i].statusOrder != 0)
                continue
            shipOrder[i].statusOrder = 1
            shipOrder[i].timeDelivery = new Date().toLocaleString()
            await shipOrder[i].save()
        }

        return res.status(StatusCode.SuccessStatus).json({ shipOrder: "", msg: "Set to ship order success"});
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region set to complete
const setToCompleteOrder = async (req, res)=>{
    const {idUser, idOrder} = req.body

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    try{
        
        const shipOrder = await Order.find({_id: { $in: idOrder }}).populate('cart')

        for(let i=0; i<shipOrder.length; i++)
        {
            if(( shipOrder[i].idUser != idUser && shipOrder[i].cart.idUser!= idUser ) || shipOrder[i].statusOrder != 1)
                continue
            shipOrder[i].statusOrder = 2
            shipOrder[i].timeFinish = new Date().toLocaleString()
            await shipOrder[i].save()
        }

        return res.status(StatusCode.SuccessStatus).json({ completeOrder: "", msg: "Set to complete order success"});
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region set to cancel
const setToCancelOrder = async (req, res)=>{
    const {idUser, idOrder} = req.body

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    try{
        
        const shipOrder = await Order.find({_id: { $in: idOrder }}).populate('cart')

        for(let i=0; i<shipOrder.length; i++)
        {
            if(( shipOrder[i].idUser != idUser && shipOrder[i].cart.idUser!= idUser ) || shipOrder[i].statusOrder != 0)
                continue
            shipOrder[i].statusOrder = 3
            shipOrder[i].timeCancel = new Date().toLocaleString()
            await shipOrder[i].save()
        }

        return res.status(StatusCode.SuccessStatus).json({ cancelOrder: "", msg: "Set to cancel order success"});
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region set to order
const setToOrder = async (req, res)=>{
    const {idUser, idOrder} = req.body

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    try{
        
        const shipOrder = await Order.find({_id: { $in: idOrder }}).populate('cart')

        for(let i=0; i<shipOrder.length; i++)
        {
            if(shipOrder[i].cart.idUser != idUser || shipOrder[i].statusOrder != 1)
                continue
            shipOrder[i].statusOrder = 0
            await shipOrder[i].save()
        }

        return res.status(StatusCode.SuccessStatus).json({ toOrder: "", msg: "Set to order success"});
    }
    catch(error){
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region get order by id order
const getOrderId = async (req, res)=>{
    const {idOrder} = req.query

    try {
        const orders = await Order.findOne({_id: idOrder}).populate('cart')
        if(orders.idUser!= req.TradoUser.id && orders.cart.idUser!= req.TradoUser.id)
            throw new Error("Don't have access")
        return res.status(StatusCode.SuccessStatus).json({ Order: orders, msg: "Get order id"});
    } catch (error) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region get order buyer by id user 
const getOrderBuyer = async(req, res)=>{
    const {idUser} = req.query

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    try {
        const orders = await Order.find({idUser: idUser}).populate('cart')
        return res.status(StatusCode.SuccessStatus).json({ Order: orders, msg: "Get order buyer"});
    } catch (error) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region get order seller by id user 
const getOrderSeller = async (req, res)=>{
    const {idUser} = req.query

    if(req.TradoUser.id != idUser || !req.TradoUser.id)
    {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: "Invalid user" });
    }

    try {
        const cart = await Cart.find({idUser: idUser},{_id:1})
        const orders = await Order.find({cart:  { $in: cart}}).populate('cart')
        return res.status(StatusCode.SuccessStatus).json({ Order: orders, msg: "Get order seller"});
    } catch (error) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

module.exports = {
    createOrder,
    setToShipOrder,
    setToCompleteOrder,
    setToCancelOrder,
    getOrderId,
    getOrderBuyer,
    getOrderSeller,
    setToOrder,
}