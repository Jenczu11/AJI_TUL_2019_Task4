const OrderStatus = require('../models/orderstatus');
const _ = require('underscore');

exports.getAll = (req,res) => {
    OrderStatus.getAll().then(
        function(allOrderStatus) {
            res.json(allOrderStatus);
        }
    )  
};