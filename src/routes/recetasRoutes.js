const express = require('express');
const router = express.Router();
const mysql = require('mysql2');

// Configuración de la conexión a la base de datos
const db = mysql.createConnection({
  host: 'localhost', // O la IP/host de tu servidor de base de datos
  user: 'root', // Tu nombre de usuario de base de datos
  password: 'llluuuhhh', // Tu contraseña de base de datos
  database: 'recetas' // El nombre de tu base de datos
});

router.get('/', (req, res) => {
  const nombre = req.query.nombre; // Obtener el término de búsqueda
  let query = `
    SELECT r.id_receta AS id, r.nombre, r.descripcion, r.instrucciones,
           GROUP_CONCAT(i.nombre SEPARATOR ', ') AS ingredientes
    FROM Recetas r
    LEFT JOIN Recetas_Ingredientes ri ON r.id_receta = ri.id_receta
    LEFT JOIN Ingredientes i ON ri.id_ingrediente = i.id_ingrediente
  `;

  const params = [];

  // Filtro por nombre si se proporciona
  if (nombre) {
    query += ` WHERE r.nombre LIKE ?`;
    params.push(`%${nombre}%`);
  }

  query += ` GROUP BY r.id_receta`; // Agrupar por receta para usar GROUP_CONCAT

  db.query(query, params, (err, results) => {
    if (err) {
      console.error('Error al obtener las recetas:', err);
      res.status(500).send('Error al obtener las recetas');
      return;
    }
    res.json(results); // Enviar los resultados en formato JSON
  });
});



module.exports = router;
