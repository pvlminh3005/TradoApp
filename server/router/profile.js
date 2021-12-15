const {updateprofile} = require('../controller/profile')
const authcrud = require('../middleware/authcrud')
const express = require('express')

const router = express.Router();

router.put('/update',authcrud, updateprofile);

module.exports = router;