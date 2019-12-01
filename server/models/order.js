//product.js
const bookshelf = require('../config/bookshelf');


const Order = bookshelf.Model.extend({
   tableName: 'zamowienie',
   orderedProducts() {
      return this.hasMany('OrderedProducts', 'id_zamowienia', 'id');
  },
  orderStatus() {
      return this.belongsTo('OrderStatus', 'stan_zamowienia', 'id');
  },
  
})

module.exports = bookshelf.model('Order', Order);
module.exports.getAll = () => {
   return Order.fetchAll();
}

// module.exports.getById = (id) => {
//    return new Product({'id':id}).fetch();
// }

module.exports.create = (order) => {
   return new Order( {
    data_zatwierdzenia: order.data_zatwierdzenia,
    stan_zamowienia: order.stan_zamowienia,
    nazwa_uzytkownika: order.nazwa_uzytkownika,
    email: order.email,
    numer_telefonu: order.email
}).save();
};

module.exports.getById = (id) => {
   return new Order({'id':id}).fetch({withRelated: ['orderedProducts']});
}
module.exports.update = (order) => {
   return new Order( {
       id: order.id
   }).save( {
      data_zatwierdzenia: order.data_zatwierdzenia,
      stan_zamowienia: order.stan_zamowienia,
      nazwa_uzytkownika: order.nazwa_uzytkownika,
      email: order.email,
      numer_telefonu: order.email
       }, 
       {patch: true}
   );
}
