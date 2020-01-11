//product.js
const bookshelf = require('../config/bookshelf');

const OrderStatus = bookshelf.Model.extend({
   tableName: 'stan_zamowienia'
})

module.exports.getAll = () => {
    return OrderStatus.fetchAll();
 }