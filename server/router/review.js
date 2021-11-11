const {postReview, getReviewUser, getReviewProduct} = require('../controller/review')
const authcrud = require('../middleware/authcrud')
const express = require('express')

const router = express.Router();

router.post('/',authcrud, postReview);
router.get('/user', getReviewUser);
router.get('/product', getReviewProduct);

module.exports = router;