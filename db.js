import mysql from 'mysql2';

// Configura la conexión a la base de datos
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',  // Cambia esto si tienes un usuario diferente
  password: '',  // Cambia esto si tienes una contraseña para tu base de datos
  database: 'gestion_proyectos'  // Nombre de tu base de datos
});

// Conectar a la base de datos
connection.connect((err) => {
  if (err) {
    console.error('Error al conectar a la base de datos: ' + err.stack);
    return;
  }
  console.log('Conectado a la base de datos como id ' + connection.threadId);
});

export default connection;

