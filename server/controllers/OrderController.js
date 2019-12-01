const Order = require('../models/order.js');
const _ = require('underscore');

exports.getAll = (req,res) => {
    Order.getAll().then(
        function(allOrders) {
            res.json(allOrders);
        }
    )  
};