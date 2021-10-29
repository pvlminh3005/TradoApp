const {createProduct, getProductUser} = require('../controller/product')
const authcrud = require('../middleware/authcrud')
const express = require('express')

const router = express.Router();

router.post('/', authcrud, createProduct);
router.get('/user', getProductUser);

module.exports = router;