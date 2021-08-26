const { QueryTypes } = require('sequelize');

const db = require('../config/db.config');

const { request, response } = require('express');

const { crearCita, crearDetalleCita, consultarCita } = require('../sql/queries.sql');


//crear cita
exports.crearCita = async(req = request, res = response) => {
    const { fechacita, horacita, consultorio, medico } = req.body;

    let id_cita;

    try {
        const queryCita = crearCita + ' VALUES(default, :fechacita, :horacita)';
        const resultadoCita = await db.query(queryCita, {
            replacements: {
                fechacita,
                horacita,
            },
            type: db.QueryTypes.INSERT,
        });


        id_cita = resultadoCita[0]
        const queryDetalleCita = crearDetalleCita + ' VALUES(:id_cita, :consultorio, :medico)';
        await db.query(queryDetalleCita, {
            replacements: {
                id_cita,
                consultorio,
                medico,
            },
            type: db.QueryTypes.INSERT,
        })

        res.status(200).json({ msg: "cita creada exitosamente" })

    } catch (error) {
        console.log(error);
    }
};




//consultar cita
exports.consultarCitaPaciente = async(req = request, res = response) => {
    const { user } = req.body;

    try {
        const queryConsultarCita = consultarCita + ' WHERE f.user = :user;'
        const resultadoConsulta = await db.query(queryConsultarCita, {
            replacements: {
                user
            },
            type: db.QueryTypes.SELECT,
        })


        res.status(200).json(resultadoConsulta[0]);



    } catch (error) {
        console.log(error);
    }
};