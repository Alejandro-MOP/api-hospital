const { request, response } = require('express');
const { QueryTypes } = require('sequelize');

const db = require('../config/db.config');
const {
	insertDomicilio,
	insertUsuario,
	getPassword,
	getPaciente,
} = require('../sql/queries.sql');
const {
	get_id_alergia,
	get_id_estado_civil,
	get_id_genero,
	get_id_ocupacion,
	get_id_tipo_sangre,
} = require('../helpers/getId.helper');

exports.registrarUsuario = async (req = request, res = response) => {
	//Desestructuramos las variables que vienen en el Body
	const {
		alcaldia,
		calle,
		colonia,
		curp,
		fecha_alta,
		fecha_nacimiento,
		id_alergia,
		id_estadoCivil,
		id_genero,
		id_ocupacion,
		id_tipo_sangre,
		nombre,
		nss,
		numero_ext,
		numero_int,
		password,
		primer_apellido,
		segundo_apellido,
		user,
	} = req.body;

	let idGenero,
		idTipoSangre,
		idOcupacion,
		idEstadoCivil,
		idAlergia,
		idDireccion;

	try {
		//prettier-ignore
		const queryDomicilio = insertDomicilio +
            ` VALUES (:alcaldia,:calle,:colonia,:numero_ext,:numero_int)`;

		//prettier-ignore
		const queryUsuario = insertUsuario +
            ` VALUES (:nss,:curp,:fecha_alta,:fecha_nacimiento,:nombre,:primer_apellido,:segundo_apellido,:user,:password,:id_alergia,:id_direccion,:id_estado_civil,:id_genero,:id_ocupacion,:id_tipo_sangre)`;

		//Creamos el Domicilio del usuario
		const resultadoDomicilio = await db.query(queryDomicilio, {
			replacements: {
				alcaldia,
				calle,
				colonia,
				numero_ext,
				numero_int,
			},
			type: db.QueryTypes.INSERT,
		});

		//Recuperamos las llaves foraneas de acuerdo a la info que recibimos en el body
		idGenero = get_id_genero(id_genero);
		idTipoSangre = get_id_tipo_sangre(id_tipo_sangre);
		idOcupacion = get_id_ocupacion(id_ocupacion);
		idEstadoCivil = get_id_estado_civil(id_estadoCivil);
		idAlergia = get_id_alergia(id_alergia);
		idDireccion = resultadoDomicilio[0];

		//Creamos el usuario
		await db.query(queryUsuario, {
			replacements: {
				nss,
				curp,
				fecha_alta,
				fecha_nacimiento,
				nombre,
				primer_apellido,
				segundo_apellido,
				user,
				password,
				id_alergia: idAlergia,
				id_direccion: idDireccion,
				id_estado_civil: idEstadoCivil,
				id_genero: idGenero,
				id_ocupacion: idOcupacion,
				id_tipo_sangre: idTipoSangre,
			},
			type: db.QueryTypes.INSERT,
		});

		res.status(200).json({ msg: true });
	} catch (error) {
		console.log(error);
	}
};

exports.iniciarSesion = async (req = request, res = response) => {
	//Desestructuramos las variables que vienen en el Body
	const { user, password } = req.body;

	try {
		//Query para obtener el usuario
		const query = getPassword + ':user';

		//Ejecutamos el query y recuperamos el resultado en "resultado"
		const resultado = await db.query(query, {
			replacements: { user },
			type: db.QueryTypes.SELECT,
		});

		//Si el usuario existe retornamos al cliente un true, de lo contrario un false

		const validacionPassword =
			password === resultado[0].password
				? { validacion: true, mnss: resultado[0].mnss_paciente }
				: false;

		res.status(200).json(validacionPassword);
	} catch (error) {
		console.log(error);
	}
};

exports.consultarPerfil = async (req = request, res = response) => {
	const { user } = req.body;

	try {
		//Query para obtener el usuario
		const query = getPaciente + ':user';

		//Ejecutamos el query y recuperamos el resultado en "resultado"
		const resultado = await db.query(query, {
			replacements: { user },
			type: db.QueryTypes.SELECT,
		});

		res.status(200).json(resultado[0]);
		//prettier-ignore
	} catch (error) {
		console.log(error);
	}
};
