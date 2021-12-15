const {createProduct, getProductUser, updateProduct} = require('../controller/product')
const authcrud = require('../middleware/authcrud')
const express = require('express')

const router = express.Router();

router.post('/', authcrud, createProduct);
router.put('/update', authcrud, updateProduct);
router.get('/user', getProductUser);

module.exports = router;