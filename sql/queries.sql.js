exports.insertDomicilio =
	'INSERT INTO gestion_citas.direccion ( alcaldia, calle, colonia, num_ext, num_int )';

exports.insertUsuario =
	'INSERT INTO gestion_citas.paciente (nss,curp,fecha_alta,fecha_nacimiento,nombre,primer_apellido,segundo_apellido,user,password,id_alergia,id_direccion, id_estado_civil, id_genero, id_ocupacion,id_tipo_sangre)';

exports.getPassword =
	'SELECT password from gestion_citas.paciente WHERE user =';
