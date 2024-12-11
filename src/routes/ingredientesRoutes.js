const express = require('express');
const router = express.Router();
const mysql = require('mysql2');

// Configurar la conexión a la base de datos
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'llluuuhhh', // Asegúrate de que la contraseña sea correcta
  database: 'recetas' // Asegúrate de que el nombre de la base de datos sea correcto
});

// Ruta para obtener ingredientes por nombre
router.get('/', (req, res) => {
  const nombre = req.query.nombre; // Obtener el término de búsqueda
  let query = 'SELECT nombre FROM Ingredientes';

  // Si hay un nombre en la consulta, añadir filtro
  if (nombre) {
    query += ' WHERE nombre LIKE ?';
  }

  db.query(query, [`%${nombre}%`], (err, results) => {
    if (err) {
      console.error('Error al obtener ingredientes:', err);
      res.status(500).send('Error al obtener ingredientes');
      return;
    }

    res.json(results); // Responder con los ingredientes en formato JSON
  });
});

module.exports = router;
