//product.js
const bookshelf = require('../config/bookshelf');

const OrderStates = bookshelf.Model.extend({
   tableName: 'stan_zamowienia'
})

module.exports.getAll = () => {
    return OrderStates.fetchAll();
 }