const Order = require('../models/order.js');
const _ = require('underscore');

exports.getAll = (req,res) => {
    console.log("OrderController -> getAll");
    Order.getAll().then(
        function(allOrders) {
            res.json(allOrders);
        }
    )  
};
exports.getOrderById = (req, res) => {
    console.log("OrderController -> getOrderById");
    console.log(req.params.id);
  Order.getById(req.params.id)
    .then(order => {
      res.json(order);
    })
    .catch(err => {
      res.status(404).json({ error: "Order not found" });
    });
};

exports.getAllOrdersByUser = (req,res) => {
    Order.getAll().then((orders) => {
        res.json(_.filter(JSON.parse(JSON.stringify(orders)), (e) => {return e.nazwa_uzytkownika==req.query.user}));

    })
    .catch((err) => {
        res.status(404).json({error: err.message});
    });
    
};
exports.getAllOrdersByStatus = (req,res) => {
    console.log("OrderController -> getAllOrdersByStatus")
    console.log(req.params.status)
     Order.getAll().then((orders) => {
        let out = [];
        for(let i = 1; i <= orders.length; i++){
          console.log(orders.get(i).attributes.stan_zamowienia==req.params.status)
            if(orders.get(i).attributes.stan_zamowienia == req.params.status){
              // console.log("if")
                out.push(orders.get(i));
            }
        }
        res.json(out);
    })
    .catch((err) => {
        res.status(404).json({error: err.message});
    });

}

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
                order: (JSON.parse(JSON.stringify(newOrder._boundTo.attributes)))
              });
            }).catch((err) => {
                res.status(500).json({error: err.message})
            })
    }
    catch (error) {
        res.status(500).json({error: error})
    }
}

exports.updateById = (req, res) => {
    console.log("OrderController -> updateById");
  try {
    Order.update(req.body.order)
      .then(function(order) {
        res.json({
            status: `updated order ${req.body.order.id}`,
            updatedOrder: order
        });
      })
      .catch(err => {
        res.status(500).json({ error: err.message });
      });
  } catch (error) {
    res.status(500).json({ error: error });
  }
};
exports.modifyOrderStatus = (req,res) => {
    console.log("OrderController -> modifyOrderStatus");
    Order.getById(req.params.id)
    .then(order => {
        if (order.get('stan_zamowienia') > parseInt(req.params.status)) {
            res.status(500).json({error: "Nie mozesz zmienic statusu na poprzedni."})
            return;
        }
        order.set('stan_zamowienia', parseInt(req.params.status));
        order.save();
      res.json(order);
    })
    .catch(err => {
      res.status(404).json({ error: "Order not found" });
    });
};

