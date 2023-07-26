// ignore_for_file: prefer_const_constructors, unnecessary_new, unnecessary_cast, use_build_context_synchronously, unused_local_variable, use_key_in_widget_constructors

import 'package:clicker/Complementos/snackBars.dart';
import 'package:clicker/Constructores/jugador.dart';
import 'package:clicker/Principales/clicker.dart';
import 'package:clicker/RecuperacionDatos/comprobaciones.dart';
import 'package:flutter/material.dart';
import '../ConexionBBDD/conexion.dart';
import '../Constructores/Usuario.dart';
import 'package:audioplayers/audioplayers.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Container(child: StatesApp()),
    );
  }
}

//Objeto player para la musica
final player = AudioPlayer();
String nombre = '';
String contrasena = "";

void playFile(String url) {
  player.play(AssetSource(url));
}

class StatesApp extends StatefulWidget {
  @override
  clase1 createState() => clase1();
}

class clase1 extends State<StatesApp> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/posible3.gif"), fit: BoxFit.cover)),
          child: Scaffold(
              // Esto es para que el gif de fondo se vea y no este tapado por este background
              backgroundColor: Colors.transparent,
              body: Center(
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Text("Dungeon's game",
                              style: TextStyle(
                                fontSize: 33,
                                fontFamily: "caps",
                              )),
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 50, left: 80, right: 80),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Nombre",
                            ),
                            onSaved: (value) {
                              nombre = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo vacio';
                              }
                            },
                          ),
                        ),
                        Container(
                          height: 50,
                          margin: EdgeInsets.only(top: 20, left: 80, right: 80),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            obscureText: true,
                            decoration:
                                InputDecoration(labelText: "Contraseña"),
                            onSaved: (value) {
                              contrasena = value!;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Campo vacio';
                              }
                            },
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: OutlinedButton(
                                onPressed: () {
                                  login(context);
                                },
                                child: Text("Login",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey)))),
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(width: 2, color: Colors.grey)),
                            child: OutlinedButton(
                                onPressed: () {
                                  register(context);
                                },
                                child: Text("Register",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.grey)))),
                        Container(
                          margin: EdgeInsets.only(top: 200, left: 150),
                          decoration: BoxDecoration(),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: IconButton(
                                  onPressed: (() => setState(() {
                                        player.play(AssetSource("Theme.mp3"));
                                      })),
                                  icon: Icon(Icons.speaker),
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                  child: Text("Play",
                                      style: TextStyle(color: Colors.grey))),
                              Container(
                                margin: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)),
                                child: IconButton(
                                  onPressed: (() => setState(() {
                                        player.stop();
                                      })),
                                  icon: Icon(Icons.speaker),
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                  child: Text("Stop",
                                      style: TextStyle(color: Colors.grey)))
                            ],
                          ),
                        ),
                      ],
                    )),
              ))),
    );
  }

  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      //Llamamos a la BBDD

      //Creamos un objeto conexion
      ConnectionUser conexion = new ConnectionUser();

      bool existe = await conexion.login(nombre, contrasena);

      if (existe) {
        Usuario usuarioComparacion =
            new Usuario(id: 0, nombre: nombre, contrasena: contrasena);

        Comprobaciones retorno = new Comprobaciones();

        Jugador jugador =
            await retorno.retornarDatos(usuarioComparacion) as Jugador;

        bool comprobacionExistencia =
            await retorno.comprobacionPrimeraVez(jugador.id);
        if (comprobacionExistencia) {
          //Como es la primera vez insertamos en la tabla jugadores todos los campos a 0, es decir creamos un nuevo jugador
          bool paLante = await retorno.ingresarJugador(jugador.id);
          if (paLante) {
            Navigator.of(context).pushNamed("/Clicker",
                arguments: Jugador(
                    id: jugador.id,
                    monedas: 0,
                    monstruo: 0,
                    mundo: 0,
                    mejora1V1: 0,
                    mejora1V2: 0,
                    mejora1V3: 0,
                    contador1: 0));
          }
        } else {
          //Como no es la primera vez le pasamos los datos que habiamos recogido previamente
          Navigator.of(context).pushNamed("/Clicker",
              arguments: Jugador(
                  id: jugador.id,
                  monedas: jugador.monedas,
                  monstruo: jugador.monstruo,
                  mundo: jugador.mundo,
                  mejora1V1: jugador.mejora1V1,
                  mejora1V2: jugador.mejora1V2,
                  mejora1V3: jugador.mejora1V3,
                  contador1: jugador.contador1));
        }
      } else {
        SnackBars snackBar = new SnackBars();
        snackBar.usuarioNoEncontrado(context);
      }
    }
  }

  register(BuildContext context) {
    Navigator.of(context).pushNamed("/Register");
  }
  
  @override
  void initState() {
    super.initState();
    player2.play( AssetSource("Theme.mp3"));

  }
}
