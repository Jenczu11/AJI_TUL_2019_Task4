//routes/index.js

const express = require('express');
const router = express.Router();
const IndexController = require('../controllers/IndexController')

// zdefiniowanie odpowiedzi dla "strony głównej"
router.get('/', IndexController.home);

module.exports = router;