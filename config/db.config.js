const Sequelize = require('sequelize');
require('dotenv').config({ path: '.env' });

const { BD_NOMBRE, BD_USER, BD_PASS, BD_HOST, BD_PORT, BD_DIALECT } =
	process.env;

const db = new Sequelize(BD_NOMBRE, BD_USER, BD_PASS, {
	host: BD_HOST,
	dialect: BD_DIALECT,
	port: BD_PORT,
	define: { timestamps: false },
	pool: {
		max: 5,
		min: 0,
		acquire: 30000,
		idle: 10000,
	},
	logging: console.log,
});

db.authenticate()
	.then(() => {
		console.log('Se ha conectado a la base de manera correcta');
	})
	.catch(err => {
		console.log('Ha ocurrido un error a conectar con la base de datos');
		console.log(err);
	});
module.exports = db;
