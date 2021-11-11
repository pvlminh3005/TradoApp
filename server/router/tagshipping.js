const { createTag, getAllTag, updateTag, deleteTag, getTag, selectTag } = require('../controller/tagshipping')
const auth = require('../middleware/auth')
const express = require('express')

const router = express.Router();

router.post('/',auth, createTag);
router.get('/alltag',auth, getAllTag);
router.get('/',auth, getTag);
router.delete('/',auth, deleteTag);
router.post('/updatetag',auth, updateTag);
router.post('/selecttag',auth, selectTag);

module.exports = router;