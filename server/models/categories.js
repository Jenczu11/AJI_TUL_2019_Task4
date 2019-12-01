//product.js
const bookshelf = require('../config/bookshelf');

const Categories = bookshelf.Model.extend({
   tableName: 'kategoria'
})

module.exports.getAll = () => {
    return Categories.fetchAll();
 }