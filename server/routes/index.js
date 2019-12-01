//routes/index.js

const express = require('express');
const router = express.Router();
const IndexController = require('../controllers/IndexController')
const ProductsController = require('../controllers/ProductsController');
const CategoriesController = require('../controllers/CategoriesController');
const OrderStatesController = require('../controllers/OrderStatusController');
const OrderController = require('../controllers/OrderController');

// zdefiniowanie odpowiedzi dla "strony głównej"

router.get('/', IndexController.home);
router.get('/products',ProductsController.getAll);
router.get('/products/:id',ProductsController.getById);
router.post('/products',ProductsController.store);
router.put('/products',ProductsController.updateById);

router.get('/categories',CategoriesController.getAll);

router.get('/status',OrderStatesController.getAll);

router.get('/orders',OrderController.getAll)
router.get('/orders/id/:id',OrderController.getOrderById);
router.post('/orders',OrderController.addOrder);
router.put('/orders/',OrderController.updateById);
router.get('/orders/user/', OrderController.getAllOrdersByUser);
router.get('/orders/status/:status', OrderController.getAllOrdersByStatus);
router.put('/orders/:id/', OrderController.modifyOrderStatus);
module.exports = router;