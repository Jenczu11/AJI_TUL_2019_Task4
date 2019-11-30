const products = require('../data/ProductData');
const Product = require('../models/product');
const _ = require('underscore');

exports.getAll = (req,res) => {
    Product.getAll().then(
        function(allProducts) {
            res.json(allProducts);
        }
    )
    // res.json(products);
};
exports.getById = (req,res) => {
    Product.getById(req.params.id).then((product) =>{
        res.json(product);
    })
// res.json(_.find(products,function(product) {return product.id == req.params.id}));
};

exports.store = (req,res) =>
{
    let newProduct = {
        'id': products.length+1,
        'name': req.body.name,
        'description': req.body.description,
        'price': req.body.price,
        'amount': req.body.amount,
    }
    products.push(newProduct);
    res.json({
        'status':'saved!',
        'product': newProduct,
    });
};
exports.updateById = (req,res) => {
    const currentProduct = _.find(products, (product) => {return product.id == req.params.id});
    currentProduct.name = req.body.name;
    currentProduct.description = req.body.description;
    currentProduct.price = req.body.price;
    currentProduct.amount = req.body.amount;
    res.json({'updatedProduct': currentProduct});
}