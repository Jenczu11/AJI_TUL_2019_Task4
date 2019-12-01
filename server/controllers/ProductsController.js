// const products = require('../data/ProductData');
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
    let inp = req.body;
    if(inp.cena_jednostkowa<0 || inp.waga_jednostkowa<0)
    {
        res.status(400).json({
            'error': 'ujemna cena/waga'
        })
    }
    else
    if(inp.cena_jednostkowa==0 || inp.waga_jednostkowa==0)
    {
        res.status(400).json({
            'error': 'zerowa cena/waga'
        })
    }else
    if(inp.opis === "" || inp.nazwa==="")
    {
        res.status(400).json({
            'error': 'pusty opis/nazwa'
        })
    }else
    {
    const newProduct = Product.create( {
        'nazwa': inp.nazwa,
        'opis': inp.opis,
        'cena_jednostkowa': inp.cena_jednostkowa,
        'waga_jednostkowa': inp.waga_jednostkowa,
        'kategoria_towaru': inp.kategoria_towaru
    }).then( () => {
        res.json({
            'status':'saved!',
            'product': newProduct,
        });
    })
}
    // products.push(newProduct);
    
};
exports.updateById = (req,res) => {
    let listProducts;
    Product.getAll().then(
        function(allProducts) {
            listProducts=allProducts;
        }
    ) 
    console.log(listProducts);

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