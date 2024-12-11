const express = require('express');
const path = require('path');
const recetasRoutes = require('./routes/recetasRoutes'); // Importar las rutas de recetas
const ingredientesRoutes = require('./routes/ingredientesRoutes');
const inventarioRoutes = require('./routes/inventarioRoutes');

const app = express();

// Configurar el puerto en el que va a escuchar el servidor
const PORT = process.env.PORT || 3000;

// Servir archivos estáticos (por ejemplo, HTML, CSS, JS) desde la carpeta 'public'
app.use(express.static(path.join(__dirname, 'public')));

// Usar las rutas de recetas
app.use('/recetas', recetasRoutes); // Cuando se accede a /recetas, usará las rutas definidas en recetasRoutes.js
app.use('/ingredientes', ingredientesRoutes); // Esta línea es crucial para que funcione
app.use('/inventario', inventarioRoutes); // Registrar las rutas de inventario
// Ruta principal que sirve el archivo index.html
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Iniciar el servidor y escuchar peticiones
app.listen(PORT, () => {
  console.log(`Servidor corriendo en http://localhost:${PORT}`);
});

// Manejo de errores en el servidor
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('Algo salió mal');
});
