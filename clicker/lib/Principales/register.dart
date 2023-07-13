// ignore_for_file: prefer_const_constructors, unused_import, unnecessary_new, unnecessary_cast, use_build_context_synchronously

import 'package:audioplayers/audioplayers.dart';
import 'package:clicker/Principales/login.dart';
import 'package:flutter/material.dart';
import '../Complementos/snackBars.dart';
import '../ConexionBBDD/conexion.dart';
import 'clicker.dart';
import "package:clicker/main.dart";
import '../Constructores/Usuario.dart';

class Register extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Container(child: StatesApp()),
    );
  }
}

final player = AudioPlayer();

void playFile(String url) {
  player.play(AssetSource(url));
}

class StatesApp extends StatefulWidget {
  @override
  clase2 createState() => clase2();
}

class clase2 extends State<StatesApp> {
  String nombre = '';
  String contrasena = "";

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/Register.gif"), fit: BoxFit.cover)),
          child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          margin:
                              EdgeInsets.only(top: 250, left: 80, right: 80),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
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
                            color: Colors.white,
                          ),
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
                        OutlinedButton(
                            onPressed: () {
                              register(context);
                            },
                            child:
                                Text("Login", style: TextStyle(fontSize: 20))),
                        Container(
                          margin: EdgeInsets.only(top: 195, left: 140),
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

  register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      //Llamamos a la BBDD
      Usuario usuario =
          new Usuario(id: 0, nombre: nombre, contrasena: contrasena);
      //Creamos un objeto conexion
      ConnectionUser conexion = new ConnectionUser();

      bool registro = await conexion.register(usuario) as bool;

      //Si devuelve un true quiere decir que la operacion se ha realizado con exito
      if (registro) {
        snackBars.usuarioCreado(context);
        Navigator.of(context).pushNamed("/Login",
            arguments: Usuario(id: 0, nombre: nombre, contrasena: contrasena));
      } else {
        //Esto es provisional
        SnackBars snackBar = new SnackBars();
        snackBar.FalloInsertUsuario(context);
      }
    }
  }
}
