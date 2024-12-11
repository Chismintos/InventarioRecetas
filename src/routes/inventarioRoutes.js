const express = require('express');
const router = express.Router();
const mysql = require('mysql2');

// Configurar la conexión a la base de datos
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'llluuuhhh', // Ajusta la contraseña según tu configuración
  database: 'recetas' // Asegúrate de usar el nombre correcto de tu base de datos
});

// Ruta para buscar recetas por ingredientes seleccionados
router.get('/buscar', (req, res) => {
  const { ingredientes } = req.query; // Obtener los ingredientes seleccionados
  if (!ingredientes) {
    return res.status(400).json({ error: 'Por favor, proporciona ingredientes para buscar recetas.' });
  }

  // Convertir la lista de ingredientes en un arreglo
  const ingredientesArray = ingredientes.split(',');

  // Construir la consulta SQL para buscar recetas
  const placeholders = ingredientesArray.map(() => '?').join(',');
  const query = `
    SELECT DISTINCT r.id_receta, r.nombre, r.descripcion
    FROM Recetas r
    JOIN Recetas_Ingredientes ri ON r.id_receta = ri.id_receta
    JOIN Ingredientes i ON ri.id_ingrediente = i.id_ingrediente
    WHERE i.nombre IN (${placeholders})
  `;

  // Ejecutar la consulta
  db.query(query, ingredientesArray, (err, results) => {
    if (err) {
      console.error('Error al buscar recetas:', err);
      res.status(500).json({ error: 'Error al buscar recetas. Por favor, intenta más tarde.' });
      return;
    }

    // Responder con las recetas encontradas
    res.json(results);
  });
});

module.exports = router;