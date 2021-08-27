const { QueryTypes } = require('sequelize');

const db = require('../config/db.config');

const { request, response } = require('express');

const { crearCita, crearDetalleCita, consultarCita, crearExpediente, eliminarCita } = require('../sql/queries.sql');


//crear cita
exports.crearCita = async (req = request, res = response) => {

    const { fechacita, horacita, consultorio, medico, mnss } = req.body;

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
        const queryDetalleCita = crearDetalleCita + ' VALUES(default, :id_cita, :consultorio, :medico)';
        const resultadoDetalleCita = await db.query(queryDetalleCita, {
            replacements: {
                id_cita,
                consultorio,
                medico,
            },
            type: db.QueryTypes.INSERT,
        })
        let id_dcita = resultadoDetalleCita[0]

        const queryCrearExpediente = crearExpediente + ' VALUES(:mnss, :id_dcita)';
        await db.query(queryCrearExpediente, {
            replacements: {
                mnss,
                id_dcita

            }
        })
        res.status(200).json({ msg: "cita creada exitosamente" })

    } catch (error) {
        console.log(error);
    }
};




//consultar cita
exports.consultarCitaPaciente = async (req = request, res = response) => {
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

exports.eliminarCita = async (req = request, res = response) => {
    const { user, id_cita } = req.body;

    try {
        const queryeliminarCita = eliminarCita + ' WHERE f.user = :user AND a.id_dcita = :id_cita;'
        const resultadoconsultar = await db.query(queryeliminarCita, {
            replacements: {
                user,
                id_cita
            },
            type: db.QueryTypes.DELETE,

        }

        )
        res.status(200).json({ msg: "Se elimino la cita correctamente" })
    } catch (error) {
        console.log(error);

    }


}