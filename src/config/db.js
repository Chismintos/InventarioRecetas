const mysql = require('mysql2');

// Configuración de la conexión a la base de datos
const db = mysql.createConnection({
  host: 'localhost', // O la IP/host de tu servidor de base de datos
  user: 'root', // Tu nombre de usuario de base de datos
  password: 'llluuuhhh', // Tu contraseña de base de datos
  database: 'recetas' // El nombre de tu base de datos
});
// Probar la conexión
db.connect(err => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err);
    return;
  }
  console.log('Conexión exitosa a la base de datos');
});

module.exports = db;
