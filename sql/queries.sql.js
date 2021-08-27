exports.insertDomicilio =
    'INSERT INTO gestion_citas.direccion ( alcaldia, calle, colonia, num_ext, num_int )';

exports.insertUsuario =
    'INSERT INTO gestion_citas.paciente (nss,curp,fecha_alta,fecha_nacimiento,nombre,primer_apellido,segundo_apellido,user,password,id_alergia,id_direccion, id_estado_civil, id_genero, id_ocupacion,id_tipo_sangre)';

exports.getPassword =
    'SELECT password, mnss_paciente from gestion_citas.paciente WHERE user =';

exports.crearCita =
    'INSERT INTO gestion_citas.mcita ( id_cita, fecha_cita, hora_cita )';

exports.crearDetalleCita =
    ' INSERT INTO gestion_citas.dcita(id_dcita,id_cita,id_consultorio,id_medico)';
exports.crearExpediente =
    ' INSERT INTO gestion_citas.eexpediente_clinico(mnss_paciente,id_dcita)';

exports.getPaciente =
    ' SELECT a.nss,a.curp,a.fecha_alta,a.fecha_nacimiento,a.nombre,a.password,a.primer_apellido,a.segundo_apellido,a.user,b.tipo_alergia,c.alcaldia,c.calle,c.colonia,c.num_ext,c.num_int,d.estado_civil,e.genero,f.ocupacion,g.tipo_sangre,h.id_dcita' +
    ' FROM gestion_citas.paciente As a' +
    ' INNER JOIN gestion_citas.alergia As b ON a.id_alergia = b.id_alergia' +
    ' INNER JOIN gestion_citas.direccion As c ON a.id_direccion = c.id_direccion' +
    ' INNER JOIN gestion_citas.estado_civil As d ON a.id_estado_civil = d.id_estado_civil' +
    ' INNER JOIN gestion_citas.genero As e ON a.id_genero = e.id_genero' +
    ' INNER JOIN gestion_citas.ocupacion As f ON a.id_ocupacion = f.id_ocupacion' +
    ' INNER JOIN gestion_citas.tipo_sangre As g ON a.id_tipo_sangre = g.id_tiposangre' +
    ' INNER JOIN gestion_citas.eexpediente_clinico As h ON a.mnss_paciente = h.mnss_paciente' +
    ' WHERE a.user =';

exports.consultarCita =
    ' SELECT a.id_dcita, b.fecha_cita, b.hora_cita, c.num_consultorio, d.medico ' +
    ' FROM gestion_citas.dcita As a ' +
    ' INNER JOIN gestion_citas.mcita As b ON a.id_cita = b.id_cita ' +
    ' INNER JOIN gestion_citas.consultorio As c ON a.id_consultorio = c.id_consultorio ' +
    ' INNER JOIN gestion_citas.medico As d ON a.id_medico = d.id_medico ' +
    ' INNER JOIN gestion_citas.eexpediente_clinico As e ON a.id_dcita = e.id_dcita ' +
    ' INNER JOIN gestion_citas.paciente As f ON e.mnss_paciente = f.mnss_paciente ';

exports.eliminarCita =
    ' DELETE FROM gestion_citas.dcita WHERE id_dcita= ';


