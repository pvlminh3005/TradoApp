const {createOrder, setToShipOrder, setToCompleteOrder, setToCancelOrder, setToOrder, getOrderId, getOrderBuyer, getOrderSeller} = require('../controller/order')
const authcrud = require('../middleware/authcrud')
const auth = require('../middleware/auth')
const express = require('express')

const router = express.Router();

router.post('/create',authcrud, createOrder);
router.put('/toshiporder',authcrud, setToShipOrder);
router.put('/tocompleteorder',authcrud, setToCompleteOrder);
router.put('/tocancelorder',authcrud, setToCancelOrder);
router.put('/toorder',authcrud, setToOrder);
router.get('/orderid',auth, getOrderId);
router.get('/orderbuyer',authcrud, getOrderBuyer);
router.get('/orderseller',authcrud, getOrderSeller);

module.exports = router;