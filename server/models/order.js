//product.js
const bookshelf = require('../config/bookshelf');

const Order = bookshelf.Model.extend({
   tableName: 'zamowienie'
})

module.exports.getAll = () => {
   return Order.fetchAll();
}

// module.exports.getById = (id) => {
//    return new Product({'id':id}).fetch();
// }

// module.exports.create = (product) => {
//    return new Product({
//        nazwa: product.nazwa,
//        opis: product.opis,
//        cena_jednostkowa: product.cena_jednostkowa,
//        waga_jednostkowa: product.waga_jednostkowa,
//        kategoria_towaru: product.kategoria_towaru
//    }).save();
// };

// module.exports.update = (product) => {
//    return new Product({
//        id: product.id
//    }).save( {
//       nazwa: product.nazwa,
//       opis: product.opis,
//       cena_jednostkowa: product.cena_jednostkowa,
//       waga_jednostkowa: product.waga_jednostkowa,
//       kategoria_towaru: product.kategoria_towaru
//        }, 
//        {patch: true}
//    );
// }