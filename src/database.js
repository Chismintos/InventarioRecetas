const mysql = require('mysql2');

// Crear la conexión a la base de datos
const db = mysql.createConnection({
  host: 'localhost',        // Cambia si usas otro host
  user: 'root',             // Cambia si usas otro usuario
  password: 'llluuuhhh',    // Cambia por tu contraseña
  database: 'recetas'       // Asegúrate de usar el nombre correcto de tu base de datos
});

// Conectar a la base de datos
db.connect((err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err);
    process.exit(1); // Detener la aplicación si no se puede conectar
  }
  console.log('Conexión a la base de datos establecida');
});

module.exports = db;
