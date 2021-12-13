const express = require('express')
const app = express();
const dotenv = require("dotenv")
const mongoose = require('mongoose')
dotenv.config({ path: "./config.env" })
const PORT = process.env.PORT || 3000

mongoose.connect(process.env.mongoUri, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})

mongoose.connection.on("connected", () => {
    console.log("Connected to DB")
})

mongoose.connection.on("error", (err) => {
    console.log("error", err)
})

app.use(express.json())
app.use(express.urlencoded({ extended: false }))

app.use('/api/account',require('./router/account'));
app.use('/api/product',require('./router/product'));
app.use('/api/review',require('./router/review'));
app.use('/api/cart',require('./router/cart'));
app.use('/api/tagshipping',require('./router/tagshipping'));
app.use('/api/profile',require('./router/profile'));

app.get('/', (req, res) => {
    res.send("Welcome to Trado App")
})

app.listen(PORT, () => {
    console.log(`Server running on PORT ${PORT}`)
})
