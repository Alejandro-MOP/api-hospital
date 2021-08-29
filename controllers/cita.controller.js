const { QueryTypes } = require('sequelize');

const db = require('../config/db.config');

const { request, response } = require('express');

const {
	crearCita,
	crearDetalleCita,
	consultarCita,
	crearExpediente,
	eliminarCita,
} = require('../sql/queries.sql');

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

		id_cita = resultadoCita[0];
		const queryDetalleCita =
			crearDetalleCita +
			' VALUES(default, :id_cita, :consultorio, :medico)';
		const resultadoDetalleCita = await db.query(queryDetalleCita, {
			replacements: {
				id_cita,
				consultorio,
				medico,
			},
			type: db.QueryTypes.INSERT,
		});
		let id_dcita = resultadoDetalleCita[0];

		const queryCrearExpediente =
			crearExpediente + ' VALUES(:mnss, :id_dcita)';
		await db.query(queryCrearExpediente, {
			replacements: {
				mnss,
				id_dcita,
			},
		});
		res.status(200).json({
			msg: 'cita creada exitosamente',
			estatus: true,
		});
	} catch (error) {
		console.log(error);
	}
};

//consultar cita
exports.consultarCitaPaciente = async (req = request, res = response) => {
	const { user } = req.body;

	try {
		const queryConsultarCita = consultarCita + ' WHERE f.user = :user;';
		const resultadoConsulta = await db.query(queryConsultarCita, {
			replacements: {
				user,
			},
			type: db.QueryTypes.SELECT,
		});

		res.status(200).json(resultadoConsulta);
	} catch (error) {
		console.log(error);
	}
};

exports.eliminarCita = async (req = request, res = response) => {
	const { id_cita } = req.body;

	try {
		const queryeliminarCita = eliminarCita + ' WHERE id_dcita = :id_cita;';
		await db.query(queryeliminarCita, {
			replacements: { id_cita },
			type: db.QueryTypes.DELETE,
		});
		res.status(200).json({
			msg: 'Se elimino la cita correctamente',
			status: true,
		});
	} catch (error) {
		console.log(error);
	}
};

exports.actualizarCita = async (req = request, res = response) => {
	const { id_cita, fechacita, horacita } = req.body;

	try {
		const query =
			' update gestion_citas.mcita ' +
			' set hora_cita = :horacita, ' +
			' fecha_cita = :fechacita ' +
			' where id_cita = :id_cita ';

		await db.query(query, {
			replacements: {
				id_cita,
				fechacita,
				horacita,
			},
			type: db.QueryTypes.UPDATE,
		});
		res.status(200).json({
			message: 'Actualizacion correcta',
			status: true,
		});
	} catch (error) {
		console.log(error);
	}
};
