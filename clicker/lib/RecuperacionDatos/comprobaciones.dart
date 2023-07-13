// ignore_for_file: unused_local_variable, unnecessary_new, prefer_interpolation_to_compose_strings

import 'package:clicker/Constructores/Usuario.dart';
import 'package:clicker/Constructores/monstruo.dart';
import "package:mysql1/mysql1.dart";

import '../Constructores/jugador.dart';

class Comprobaciones {
//Ingreso de datos de Jugador en BBDD
  Future<bool> ingresarDatosJugador(
      int id_usuario,
      int mundo,
      int monstruo,
      int monedasJugador,
      int mejora1V1,
      int mejora1V2,
      int mejora1V3,
      int contador1) async {
//Establecemos la conexion
    final conexion = await MySqlConnection.connect(ConnectionSettings(
        host: "10.0.2.2", port: 3307, user: "root", db: "nelson"));

    bool finalizado = false;

    //Le pasamos la consulta que en este caso sera un insert en la tabla
    var result = await conexion.query(
        "UPDATE jugador SET Monstruo = ?, Mundo = ?, Monedas = ?, Mejora1V1 = ?, Mejora1V2 = ?, Mejora1V3 = ?, Contador1 = ? WHERE Id_Usuario = ?",
        [
          monstruo,
          mundo,
          monedasJugador,
          mejora1V1,
          mejora1V2,
          mejora1V3,
          contador1,
          id_usuario
        ]);

    //Una vez que se haya realizado el ingreso de datos seteamo a true el booleano
    finalizado = true;
    //Cerramos la conexion
    conexion.close();
    return finalizado;
  }

  //Retornar DatosJugador
  Future<bool> borrarUsaurio(Jugador jugador) async {
    final conexion = await MySqlConnection.connect(ConnectionSettings(
        host: "10.0.2.2", port: 3307, user: "root", db: "nelson"));

    Usuario usuario = new Usuario(id: 0, nombre: "", contrasena: "");

    String sql = "DELETE from jugador where Id_Usuario ='" +
        jugador.id.toString() +
        "'";
   
    var resultQuery = await conexion.query(sql);

    await conexion.close();
    return true;
  }


  //Retornar DatosJugador
  Future<Usuario> retornarIdUsuario(String nombre) async {
    final conexion = await MySqlConnection.connect(ConnectionSettings(
        host: "10.0.2.2", port: 3307, user: "root", db: "nelson"));

    Usuario usuario = new Usuario(id: 0, nombre: "", contrasena: "");

    String sql = "select id, nombre, password from usuarios where nombre ='" +
        nombre.toString() +
        "'";

    var resultQuery = await conexion.query(sql);

    if (resultQuery.isNotEmpty) {
      ResultRow row = resultQuery.first;

      usuario = Usuario(id: row[0], nombre: row[1], contrasena: row[2]);
    }
    await conexion.close();
    return usuario;
  }

  //Retorna los datos de la partida del jugador
  Future<Jugador> retornarDatos(Usuario usuario) async {
    final conexion = await MySqlConnection.connect(ConnectionSettings(
        host: "10.0.2.2", port: 3307, user: "root", db: "nelson"));

    Usuario usuarioPrueba = Usuario(id: 0, nombre: "", contrasena: "");

    //Variable en la que guardaremos el id de cada usuario
    int idUsuario;
    //Retornamos el usuario
    usuarioPrueba = await retornarIdUsuario(usuario.getNombre());
    //Creamos objeto jugador vacio
    Jugador jugador = new Jugador(
        id: usuarioPrueba.id,
        monstruo: 0,
        mundo: 0,
        monedas: 0,
        mejora1V1: 0,
        mejora1V2: 0,
        mejora1V3: 0,
        contador1: 0);
    //A esta variable, que correspondera al id del usuario que se ha logeado, se le asignara el id del usuario
    idUsuario = usuarioPrueba.id;
    //Ahora  tenemos un usuario con solo el id
    String sql =
        "SELECT jugador.Id_Usuario, jugador.monstruo, jugador.mundo, jugador.monedas, jugador.mejora1V1, jugador.mejora1V2, jugador.mejora1V3, jugador.contador1  FROM Jugador WHERE jugador.Id_Usuario = '" +
            idUsuario.toString() +
            "'";

    //Realizamos la consulta
    var result = await conexion.query(sql);

    if (result.isNotEmpty) {
      ResultRow row = result.first;

      //Agregamos los datos al objeto Jugador
      jugador = Jugador(
          id: row[0],
          monstruo: row[1],
          mundo: row[2],
          monedas: row[3],
          mejora1V1: row[4],
          mejora1V2: row[5],
          mejora1V3: row[6],
          contador1: row[7]);
    }
    await conexion.close();
    //Cuando ya hayamos recogido todos los datos retornamos el jugador
    return jugador;
  }

  //Metodo para comprobar si es primera vez
  Future<bool> comprobacionPrimeraVez(int id) async {
    final conexion = await MySqlConnection.connect(ConnectionSettings(
        host: "10.0.2.2", port: 3307, user: "root", db: "nelson"));

    String sql =
        "SELECT * FROM Jugador WHERE id_Usuario = '" + id.toString() + "'";

    var result = await conexion.query(sql);

    if (result.isEmpty) {
      await conexion.close();
      return true;
    }
    await conexion.close();
    return false;
  }

  //Metodo para ingresar juagor
  Future<bool> ingresarJugador(int id) async {
    final conexion = await MySqlConnection.connect(ConnectionSettings(
        host: "10.0.2.2", port: 3307, user: "root", db: "nelson"));

    var result = await conexion.query(
        "INSERT INTO Jugador (Id_Usuario, Monstruo, Mundo, Monedas, Mejora1V1, Mejora1V2, Mejora1V3, Contador1) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
        [id, 0, 0, 0, 0, 0, 0, 0]);

    await conexion.close();
    return true;
  }
}
