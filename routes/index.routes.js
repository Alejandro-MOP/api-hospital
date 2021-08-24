const express = require('express');
const router = express.Router();

const {
	registrarUsuario,
	iniciarSesion,
} = require('../controllers/user.controller');

module.exports = function () {
	//Servicio para registro de nuevo usuario
	router.post('/registro', registrarUsuario);

	//Servicio para iniciar sesión
	router.get('/iniciar-sesion', iniciarSesion);

	//Servicio para crear cita
	router.post('/crear-cita');

	//Servicio para consultar cita
	router.get('/consultar-cita');

	//Servicio para eliminar cita
	router.delete('/eliminar-cita');

	//Servicio para actualizar cita
	router.put('/actualizar-cita');

	return router;
};
