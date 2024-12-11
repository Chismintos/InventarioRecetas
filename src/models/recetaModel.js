const db = require('../config/db');

exports.getAllRecipes = (callback) => {
  db.query('SELECT * FROM Recetas', callback);
};

exports.getRecipeById = (id, callback) => {
  db.query('SELECT * FROM Recetas WHERE id_receta = ?', [id], callback);
};
