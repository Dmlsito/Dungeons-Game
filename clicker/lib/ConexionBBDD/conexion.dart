//Clase de la conexion a la BBDD
// ignore_for_file: empty_statements, unused_local_variable, unnecessary_new, dead_code, prefer_interpolation_to_compose_strings

import 'package:clicker/Constructores/Usuario.dart';
import "package:mysql1/mysql1.dart";

class ConnectionUser {
  Future<bool> register(Usuario usuario) async {
    //Primero de todo establecemos la conexion
    final conexion = await MySqlConnection.connect(ConnectionSettings(
        host: "10.0.2.2", port: 3307, user: "root", db: "nelson"));

    bool comprobar = false;
    //Query para insertar los datos del jugador
    var result = await conexion.query(
        "insert into usuarios (nombre, password) value (?, ?)",
        [usuario.nombre, usuario.contrasena]);

    //Como ya se ha realizado la operacion se setea el booleano a true y se cierra la conexion
    comprobar = true;
    //Cerramos conexion
    await conexion.close();
    return comprobar;
  }

  Future<bool> login(String nombre, String contrasena) async {
    //A este usuario le daremos los valores que nos devolvera el SELECT para poder devolverlo y poder comprobar si esta vacio o no
    Usuario usuarioComprobacion = Usuario(id: 0, nombre: "", contrasena: "");

    //Establecemos la conexion
    final conexion = await MySqlConnection.connect(ConnectionSettings(
        host: "10.0.2.2", port: 3307, user: "root", db: "nelson"));

    //Consulta SQL
    String sql = "select * from usuarios where Nombre = '" +
        nombre +
        "' and Password = '" +
        contrasena +
        "'";

    //Almacenamos lo que nos devolvera la consulta en una variable
    var comprobarUsuario = await conexion.query(sql);

    //Comprobamos que el usuario no esta vacio, si no lo esta al usuario le damos los valores que hemos guardado
    //en filas con ResultRow
    if (comprobarUsuario.isNotEmpty) {
      ResultRow row = comprobarUsuario.first;
      usuarioComprobacion = new Usuario(
        id: row[0],
        nombre: row[1],
        contrasena: row[2],
      );

      return true;
    }
    return false;
  }
}
