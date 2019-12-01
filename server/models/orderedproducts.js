const bookshelf = require('../config/bookshelf.js');

const OrderedProducts = bookshelf.Model.extend({
    tableName: 'zamowienie_produkty',
    idAttribute: 'id',
    product() {
        return this.belongsTo('Product', 'id_produktu', 'id');
    },
    order() {
        return this.belongsTo('Order', 'id_zamowienie', 'id');
    }
});

module.exports = bookshelf.model('OrderedProducts', OrderedProducts);