const bookshelf = require('../config/bookshelf.js');

const OrderedProducts = bookshelf.Model.extend({
    tableName: 'zamowienie_produkty',
    idAttribute: 'id',
    product() {
        return this.belongsTo('Product', 'produkt_id', 'id');
    },
    order() {
        return this.belongsTo('Order', 'zamowienie_id', 'id');
    }
});

module.exports = bookshelf.model('OrderedProducts', OrderedProducts);