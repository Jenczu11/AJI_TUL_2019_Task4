const OrderStates = require('../models/orderstates');
const _ = require('underscore');

exports.getAll = (req,res) => {
    OrderStates.getAll().then(
        function(allOrderStates) {
            res.json(allOrderStates);
        }
    )  
};