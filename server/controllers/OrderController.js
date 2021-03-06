const Order = require("../models/order.js");
const _ = require("underscore");
const OrderedProducts = require("../models/orderedproducts.js");

exports.getAll = (req, res) => {
  // console.log(typeof(req.query))
  if(Object.keys(req.query).length == 0){
    // Your code here if x has some properties  
    console.log("OrderController -> getAll");
  Order.getAll().then(function(allOrders) {
    res.json(allOrders);
  });
   }
   else {
    getAllOrdersByUser(req,res);
   }
  
  
};
exports.getOrderById = (req, res) => {
  console.log("OrderController -> getOrderById");
  console.log(req.params.id);
  Order.getById(req.params.id)
    .then(order => {
      res.json(order);
    })
    .catch(err => {
      res.status(404).json({ message: "Order not found"
      ,error: err.message });
    });
};
function getAllOrdersByUser (req, res) {
  console.log(req.query.user)
  Order.getAll()
    .then(orders => {
      res.json(
        _.filter(JSON.parse(JSON.stringify(orders)), e => {
          return e.nazwa_uzytkownika == req.query.user;
        })
      );
    })
    .catch(err => {
      res.status(404).json({ error: err.message });
    });
};
exports.getAllOrdersByUser = getAllOrdersByUser

exports.getAllOrdersByStatus = (req, res) => {
  console.log("OrderController -> getAllOrdersByStatus");
  console.log(req.params.status);
  Order.getAll()
    .then(orders => {
      res.json(
        _.filter(JSON.parse(JSON.stringify(orders)), e => {
          return e.stan_zamowienia == req.params.status;
        })
      );
    })
    .catch(err => {
      res.status(404).json({ error: err.message });
    });
};

exports.addOrder = (req, res) => {
  console.log("OrderController -> addOrder");
  // save
  try {
    if (req.body.nazwa_uzytkownika.search(/^[\w ]+$/) === -1) {
      throw "Nazwa użytkownika jest błędna.";
    }
    if (req.body.email.search(/^.+@.+\..+$/) === -1) {
      throw "Email jest błędny.";
    }
    
    if (req.body.numer_telefonu.search(/^\+?[0-9]+$/) === -1) {
      throw "Numer telefonu jest błędny.";
    }
    Order.create({
      data_zatwierdzenia: req.body.data_zatwierdzenia,
      stan_zamowienia: req.body.stan_zamowienia,
      nazwa_uzytkownika: req.body.nazwa_uzytkownika,
      email: req.body.email,
      numer_telefonu: req.body.numer_telefonu
    })
      .then(passedOrder => {
        console.log("Po create")
        passedOrder.attributes.zamowione_produkty = [];

        for (i in req.body.zamowione_produkty) {
          let zamowione_produkty = new OrderedProducts({
            id_zamowienia: passedOrder.id,
            id_produktu: req.body.zamowione_produkty[i].id_produktu,
            ilosc: req.body.zamowione_produkty[i].ilosc
          });
          console.log(zamowione_produkty);
          passedOrder.attributes.zamowione_produkty.push(zamowione_produkty);
         console.log("przed save")
          zamowione_produkty.save();
          console.log("posave")
        }
        return res.status(201).json(passedOrder);
      })

      .catch(err => {
        res.status(500).json({ error: err.message });
      });
  } catch (error) {
    res.status(500).json({ error: error });
  }
};

exports.updateById = (req, res) => {
  console.log(`OrderController -> updateById ${req.body.id}`);
    Order.update(req.body)
      .then(function(order) {
        res.json({
          status: `updated order ${req.body.id}`,
          updatedOrder: order
        });
      })
      .catch(err => {
        res.status(404).json({ message: "Order to update not found"
        ,error: err.message });
      });
};
exports.modifyOrderStatus = (req, res) => {
  console.log("OrderController -> modifyOrderStatus");
  Order.getById(req.params.id)
    .then(order => {
      if (order.get("stan_zamowienia") > parseInt(req.params.status)) {
        res
          .status(500)
          .json({ error: "Nie mozesz zmienic statusu na poprzedni." });
        return;
      }
      if (order.get("stan_zamowienia") == parseInt(3)) {
        res.status(500).json({
          error: "Nie mozesz zmienic statusu zamowienia anulowanego."
        });
        return;
      }
      if (order.get("stan_zamowienia") == parseInt(4)) {
        res.status(500).json({
          error:
            "Nie mozesz zmienic statusu zamowienia ktore zostalo zrealizowane."
        });
        return;
      }
      let oldStatus = order.get("stan_zamowienia");
      order.set("stan_zamowienia", parseInt(req.params.status));
      order.save();
      console.log(
        `Changed orderID ${req.params.id} : status ${oldStatus} to status ${req.params.status}`
      );
      res.json(order);
    })
    .catch(err => {
      res.status(404).json({ error: "Order not found" });
    });
};
