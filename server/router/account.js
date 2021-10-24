const {createAccount,logIn,checkToken,loginAccountGmail} = require('../controller/account')
const auth = require('../middleware/auth')
const express = require('express')

const router = express.Router();

router.post('/', createAccount);
router.post('/login', logIn);
router.post('/logingmail', loginAccountGmail);
router.get('/login', auth, checkToken)

module.exports = router;