const {updateprofile, getProfile} = require('../controller/profile')
const authcrud = require('../middleware/authcrud')
const express = require('express')

const router = express.Router();

router.put('/update',authcrud, updateprofile);
router.get('/', getProfile);

module.exports = router;