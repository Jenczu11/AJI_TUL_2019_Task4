//routes/index.js

const express = require('express');
const router = express.Router();
const IndexController = require('../controllers/IndexController')
const ProductsController = require('../controllers/ProductsController');
const CategoriesController = require('../controllers/CategoriesController');
const OrderStatesController = require('../controllers/OrderStatusController');
// zdefiniowanie odpowiedzi dla "strony głównej"

router.get('/', IndexController.home);
router.get('/products',ProductsController.getAll);
router.get('/products/:id',ProductsController.getById);
router.post('/products',ProductsController.store);
router.put('/products',ProductsController.updateById);

router.get('/categories',CategoriesController.getAll);

router.get('/status',OrderStatesController.getAll);
module.exports = router;