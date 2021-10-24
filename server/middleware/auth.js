const jwt=require('jsonwebtoken')
const dotenv=require("dotenv")
const StatusCode = require('../common/StatusCode');

function auth(req,res,next){
    dotenv.config({path:"../config.env"})

    const token=req.header("trado-token")

    if(!token){
        return res.status(StatusCode.NotAuthentication).json({msg:"No token found"})
    }

    try{
        const decoded=jwt.verify(token,process.env.secret)
        req.TradoUser=decoded
        next()
    } catch(err){
        res.status(StatusCode.PayloadIsInvalid).json({msg:"Token is invalid"})
    }
}

module.exports=auth