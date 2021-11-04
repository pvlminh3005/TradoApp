const {addCart, deleteCart, getCart} = require('../controller/cart')
const authcrud = require('../middleware/authcrud')
const express = require('express')

const router = express.Router();

router.post('/', authcrud, addCart);
router.delete('/', authcrud, deleteCart);
router.get('/', authcrud, getCart);

module.exports = router;