//product.js
const bookshelf = require('../config/bookshelf');

const Categories = bookshelf.Model.extend({
   tableName: 'kategoria'
})
module.exports = bookshelf.model('Categories', Categories);
module.exports.getAll = () => {
    return Categories.fetchAll();
 }