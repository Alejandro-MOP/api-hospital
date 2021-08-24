const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
require('dotenv').config({ path: '.env' });

const db = require('./config/db.config');
const routes = require('./routes/index.routes');
const app = express();
const port = process.env.PORT || 5000;

app.use(morgan('dev')); //mostrar en consola las peticiones y codigos de respuesta HTTP

app.use(cors()); //permite tener comunicacion con cualquier otro server

app.use(express.json()); //leer solicitudes en formato JSON

app.use('/', routes()); //utilizar nuestrar rutas

//inicializa el web-server y dentro tambien inicializa la conexión a la BD
app.listen(port, () => {
	console.log('El servidor esta corriendo por el puerto: ', port);
});
