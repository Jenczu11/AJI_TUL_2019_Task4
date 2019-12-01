// const products = require('../data/ProductData');
const Product = require("../models/product");
const _ = require("underscore");

exports.getAll = (req, res) => {
    console.log("Products getAll");
  Product.getAll()
    .then(function(allProducts) {
      res.json(allProducts);
    })
    .catch(err => {
      res.status(500).json({ error: err.message });
    });
};
exports.getById = (req, res) => {
    console.log("Products getById");
  Product.getById(req.params.id)
    .then(product => {
      res.json(product);
    })
    .catch(err => {
      res.status(404).json({ error: "Product not found" });
    });
};

exports.store = (req, res) => {
    console.log("Products store");
    try {
        checkRequest(req,0)
        let newProduct = Product.create({
            nazwa: req.body.nazwa,
            opis: req.body.opis,
            cena_jednostkowa: req.body.cena_jednostkowa,
            waga_jednostkowa: req.body.waga_jednostkowa,
            kategoria_towaru: req.body.kategoria_towaru
          })
            .then(() => {
                console.log();
              res.json({
                status: "saved!",
                product: (JSON.parse(JSON.stringify(newProduct._boundTo.attributes)))
              });
            }).catch((err) => {
                res.status(500).json({error: err.message})
            })
    }
    catch (error) {
        res.status(500).json({error: error})
    }
    
   
};
exports.updateById = (req, res) => {
    console.log("Products updateById");
  try {
      checkRequest(req,1)
    Product.update(req.body.product)
      .then(function(product) {
        res.json(product);
      })
      .catch(err => {
        res.status(500).json({ error: err.message });
      });
  } catch (error) {
    res.status(500).json({ error: error });
  }
};

function checkRequest(req,call) {
    let input = req.body;
    if(call==1) input = req.body.product
    if (input.nazwa == "" ||
    input.opis == "" ||
    input.cena_jednostkowa == "" ||
    input.waga_jednostkowa == "" ||
    input.kategoria == "")
{
    throw "Kazde z pul musi miec jakas wartosc";
}

if (isNaN(parseFloat(input.cena_jednostkowa)) || isNaN(parseFloat(input.waga_jednostkowa))) {
    throw "Cena i waga musza byc liczba";
}
if ((input.cena_jednostkowa<=0)||(input.waga_jednostkowa<=0))
throw "Cena i waga nie moga byc ujemne"
}
