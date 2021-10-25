const mongoose = require("mongoose")
const Account = require('../schema/Account')
const Profile = require('../schema/Profile')
const jwt = require('jsonwebtoken');
const StatusCode = require('../common/StatusCode');
const bcrypt = require("bcryptjs");

//#region Create account trado dont gmail
const createAccount = async (req, res) => {

    const { username, password} = req.body;

    if (!username || !password ) {
        return res.status(400).json({ msg: 'Please enter all fields' })
    }
    
    const session = await Account.startSession()
    session.startTransaction()

    try {
        const opts = {session}

        const check = await Account.findOne({username:username})

        if(check)
        {
            throw new Error("User exist")
        }

        const hashedPassword = await bcrypt.hash(password, 12);

        const newAccount = new Account({
            username: username,
            password: hashedPassword,
        })

        const account = await newAccount.save(opts).catch(err=>{
            throw new Error("Cant create account")
        })

        const newProfile = new Profile({
            _id: account._id,
            name:account.username,
        })

        const profile = await newProfile.save().catch(err=>{
            throw new Error("Cant create profile")
        })

        const token = jwt.sign({ id: account._id }, process.env.secret, { expiresIn: 3600 })
        
        await session.commitTransaction()
        session.endSession()

        return res.status(StatusCode.SuccessStatus).json({
            token,
            account: {
                id: account._id,
                name: account.username,
                email: account.email,
            },
            profile: profile,
        })
    } catch (error) {
        await session.abortTransaction()
        session.endSession()

        return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
    }
}
//#endregion

//#region Create or login account trado gmail
const loginAccountGmail = async (req, res) => {

    const { image, email, name} = req.body;

    if (!email || !name) {
        return res.status(StatusCode.PayloadIsInvalid).json({ msg: 'Dont have gmail info' })
    }
    
    const Email = await Account.findOne({email:email})

    if(!Email)
    {
        const session = await Account.startSession()
        session.startTransaction()
        try {
            const opts = {session}

            const newAccount = new Account({
                email:email
            })

            const account = await newAccount.save(opts).catch(err=>{
                throw new Error("Cant create account")
            })

            const newProfile = new Profile({
                _id: account._id,
                name:name,
                image:image,
            })

            const profile = await newProfile.save().catch(err=>{
                throw new Error("Cant create profile")
            })

            const token = jwt.sign({ id: account._id }, process.env.secret, { expiresIn: 3600 })
            
            await session.commitTransaction()
            session.endSession()

            return res.status(StatusCode.SuccessStatus).json({
                accessToken:token,
                account: {
                    id: account._id,
                    name: account.username,
                    email: account.email,
                },
                profile: profile,
            })
        
        } catch (error) {
            await session.abortTransaction()
            session.endSession()

            return res.status(StatusCode.PayloadIsInvalid).json({ msg: error.message });
        }
    }
    else
    {
        const token = jwt.sign({ id: Email._id }, process.env.secret, { expiresIn: 3600 })

        return res.status(StatusCode.SuccessStatus).json({
            accessToken: token,
        });
    }
}
//#endregion

//#region Log in
const logIn =async (req,res)=>{
    const { username, password } = req.body;

    try {
        const user = await Account.findOne({username});

        if (!user) 
            throw new Error("User doesn't exist")

        const isPasswordCorrect = await bcrypt.compare(password, user.password);
        if (!isPasswordCorrect) 
            throw new Error("Invalid credentials")

        const token = jwt.sign({ id: user._id }, process.env.secret, { expiresIn: 3600 })

        return res.status(StatusCode.SuccessStatus).json({
            accessToken: token,
        });
    } catch (error) {
        return res.status(StatusCode.PayloadIsInvalid).json({
            msg: error.message
        });
    }
}
//#endregion

//#region CheckToken
const checkToken = (req,res) =>{
    Profile.findById(req.TradoUser.id)
        .populate('_id','-password')
        .then((profile) => {
            if(!profile)
                return res.status(StatusCode.NotAuthentication).json({msg:"Dont have profile"})
            return res.status(StatusCode.SuccessStatus).json(profile)
        })
        .catch(err=>{
            return res.status(StatusCode.NotAuthentication).json({msg:err.message})
        })
}
//#endregion 
module.exports = {
    createAccount,
    loginAccountGmail,
    logIn,
    checkToken,
}