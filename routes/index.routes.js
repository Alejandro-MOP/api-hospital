const express = require('express');
const router = express.Router();

const {
    registrarUsuario,
    iniciarSesion,
    consultarPerfil
} = require('../controllers/user.controller');

const { crearCita, consultarCitaPaciente, eliminarCita } = require('../controllers/cita.controller');


module.exports = function() {
    //Servicio para registro de nuevo usuario
    router.post('/registro', registrarUsuario);

    //Servicio para iniciar sesión
    router.get('/iniciar-sesion', iniciarSesion);

    //Servicio para crear cita
    router.post('/crear-cita', crearCita);

    //Servicio para consultar cita
    router.get('/consultar-cita', consultarCitaPaciente);

    //Servicio para eliminar cita
    router.delete('/eliminar-cita', eliminarCita);

    //Servicio para actualizar cita
    router.put('/actualizar-cita');

    //Servicio para obtener datos del paciente
    router.get('/mi-perfil', consultarPerfil);



    return router;
};