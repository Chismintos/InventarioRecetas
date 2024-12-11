const recetaModel = require('../models/recetaModel');

exports.obtenerRecetas = (req, res) => {
  recetaModel.getAllRecipes((err, recipes) => {
    if (err) return res.status(500).send('Error al obtener recetas');
    res.json(recipes);
  });
};

exports.obtenerRecetaPorId = (req, res) => {
  const { id } = req.params;
  recetaModel.getRecipeById(id, (err, recipe) => {
    if (err) return res.status(500).send('Error al obtener la receta');
    res.json(recipe);
  });
};
