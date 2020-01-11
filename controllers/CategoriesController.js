const Categories = require('../models/categories');
const _ = require('underscore');

exports.getAll = (req,res) => {
    Categories.getAll().then(
        function(allCategories) {
            res.json(allCategories);
        }
    )  
};