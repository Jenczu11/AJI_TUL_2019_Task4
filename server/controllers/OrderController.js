const Order = require('../models/order.js');
const _ = require('underscore');

exports.getAll = (req,res) => {
    Order.getAll().then(
        function(allOrders) {
            res.json(allOrders);
        }
    )  
};
exports.addOrder = (req,res) => {
    console.log("OrderController -> addOrder");
    try {
        const newOrder = Order.create({
            data_zatwierdzenia: req.body.data_zatwierdzenia,
            stan_zamowienia: req.body.stan_zamowienia,
            nazwa_uzytkownika: req.body.nazwa_uzytkownika,
            email: req.body.email,
            numer_telefonu: req.body.email
          })
            .then(() => {
              res.json({
                status: "saved!",
                order: newOrder
              });
            }).catch((err) => {
                res.status(500).json({error: err.message})
            })
    }
    catch (error) {
        res.status(500).json({error: error})
    }
}