const express = require('express');
const router = express.Router();

const {
	registrarUsuario,
	iniciarSesion,
	consultarPerfil,
} = require('../controllers/user.controller');

const {
	crearCita,
	consultarCitaPaciente,
	eliminarCita,
	actualizarCita,
} = require('../controllers/cita.controller');

module.exports = function () {
	//Servicio para registro de nuevo usuario
	router.post('/registro', registrarUsuario);

	//Servicio para iniciar sesión
	router.post('/iniciar-sesion', iniciarSesion);

	//Servicio para crear cita
	router.post('/crear-cita', crearCita);

	//Servicio para consultar cita
	router.post('/consultar-cita', consultarCitaPaciente);

	//Servicio para eliminar cita
	router.delete('/eliminar-cita', eliminarCita);

	//Servicio para actualizar cita
	router.put('/actualizar-cita', actualizarCita);

	//Servicio para obtener datos del paciente
	router.post('/mi-perfil', consultarPerfil);

	return router;
};
