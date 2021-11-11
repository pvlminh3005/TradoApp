const jwt=require('jsonwebtoken')
const dotenv=require("dotenv")
const StatusCode = require('../common/StatusCode');

const authcrud = (req,res,next)=>{
    dotenv.config({path:"../config.env"})

    const token=req.header("trado-token")

    req.TradoUser = null

    if(!token){
        return res.status(StatusCode.NotAuthentication).json({msg:"No token found"})
    }

    try{
        const decoded=jwt.verify(token,process.env.secret)
        Profile.findById(decoded.id)
        .then((profile) => {
            if(!profile)
            {
                req.TradoUser = null
                return res.status(StatusCode.NotAuthentication).json({msg:"Dont have profile"})
            }    
            req.TradoUser = decoded
            next()
        })
        .catch(err=>{
            throw new Error()
        })
    } catch(err){
        res.status(StatusCode.PayloadIsInvalid).json({msg:"Token is invalid"})
    }
}

module.exports=authcrud