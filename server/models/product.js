//product.js
const bookshelf = require('../config/bookshelf');

const Product = bookshelf.Model.extend({
   tableName: 'produkty',
   category: function() {
       return this.belongsTo("Categories", "kategoria_towaru", "id")
   },
   orderedProducts() {
       return this.hasMany('orderedproducts', 'produkt_id', 'id');
   }
})

module.exports.getAll = () => {
   return Product.fetchAll();
}

module.exports.getById = (id) => {
   return new Product({'id':id}).fetch({withRelated: ['category']});
}

module.exports.create = (product) => {
   return new Product({
       nazwa: product.nazwa,
       opis: product.opis,
       cena_jednostkowa: product.cena_jednostkowa,
       waga_jednostkowa: product.waga_jednostkowa,
       kategoria_towaru: product.kategoria_towaru
   }).save();
};

module.exports.update = (product) => {
   return new Product({
       id: product.id
   }).save( {
      nazwa: product.nazwa,
      opis: product.opis,
      cena_jednostkowa: product.cena_jednostkowa,
      waga_jednostkowa: product.waga_jednostkowa,
      kategoria_towaru: product.kategoria_towaru
       }, 
       {patch: true}
   );
}