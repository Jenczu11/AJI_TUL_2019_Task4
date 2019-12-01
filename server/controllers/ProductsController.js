const products = require('../data/ProductData');
const Product = require('../models/product');
const _ = require('underscore');

exports.getAll = (req,res) => {
    Product.getAll().then(
        function(allProducts) {
            res.json(allProducts);
        }
    )  
};
exports.getById = (req,res) => {
    Product.getById(req.params.id).then((product) =>{
        res.json(product);
    })

};

exports.store = (req,res) =>
{
    const newProduct =Product.create( {
        'id': products.length+1,
        'name': req.body.name,
        'description': req.body.description,
        'price': req.body.price,
        'amount': req.body.amount,
    }).then( () => {
        res.json({
            'status':'saved!',
            'product': newProduct,
        });
    })
    // products.push(newProduct);
    
};
exports.updateById = (req,res) => {
       // Please note the API change!
   Product.update(req.body.product).then(
    function(product) {
        res.json(product);
    }
)    
//     const currentProduct = _.find(products, (product) => {return product.id == req.params.id});
//     currentProduct.name = req.body.name;
//     currentProduct.description = req.body.description;
//     currentProduct.price = req.body.price;
//     currentProduct.amount = req.body.amount;
//     res.json({'updatedProduct': currentProduct});
}