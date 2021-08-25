const { QueryTypes } = require('sequelize');

const db = require('../config/db.config');

const { request, response } = require('express');

const { crearCita, crearDetalleCita } = require('../sql/queries.sql');

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
        const resultadoDetalleCita = await db.query(queryDetalleCita, {
            replacements: {
                id_cita,
                consultorio,
                medico,
            },
            type: db.QueryTypes.INSERT,
        })

        console.log(resultadoDetalleCita);

    } catch (error) {
        console.log(error);
    }
};