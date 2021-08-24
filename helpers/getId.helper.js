exports.get_id_genero = (genero = '') => {
	let id_genero = 0;
	genero.toLowerCase().trim() === 'f' ? (id_genero = 1) : (id_genero = 2);
	return id_genero;
};

exports.get_id_tipo_sangre = (tipoSangre = '') => {
	let id = 0;
	switch (tipoSangre.toLowerCase().trim()) {
		case 'o negativo':
			return (id = 1);
		case 'o positivo':
			return (id = 2);
		case 'a negativo':
			return (id = 3);
		case 'a positivo':
			return (id = 4);
		case 'b negativo':
			return (id = 5);
		case 'b positivo':
			return (id = 6);
		case 'ab positivo':
			return (id = 7);
		case 'ab negativo':
			return (id = 8);
		default:
			break;
	}
	return id;
};

exports.get_id_ocupacion = (ocupacion = '') => {
	let id = 0;
	switch (ocupacion.toLowerCase().trim()) {
		case 'trabajador':
			return (id = 1);
		case 'estudiante':
			return (id = 2);
		case 'ama de casa':
			return (id = 3);
		case 'nini':
			return (id = 4);
		default:
			break;
	}
	return id;
};

exports.get_id_estado_civil = (estadoCivil = '') => {
	let id = 0;
	switch (estadoCivil.toLowerCase().trim()) {
		case 'soltero':
			return (id = 1);
		case 'casado':
			return (id = 2);
		case 'viudo':
			return (id = 3);
		case 'divorciado':
			return (id = 4);
		default:
			break;
	}
	return id;
};

exports.get_id_alergia = alergia => {
	let id = 0;
	switch (alergia) {
		case 'anticonvulsivos':
			return (id = 1);
		case 'insulina':
			return (id = 2);
		case 'penicilina':
			return (id = 3);
		case 'sulfamidas':
			return (id = 4);
		case 'antibioticos':
			return (id = 5);
		case 'ninguna':
			return (id = 6);
		default:
			break;
	}
	return id;
};
