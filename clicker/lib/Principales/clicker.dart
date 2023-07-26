//ignore_for_file: unnecessary_import, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print, unnecessary_new

import 'package:clicker/Complementos/NivelesDeMejoras.dart';
import 'package:clicker/Complementos/snackBars.dart';
import 'package:clicker/Improves/improves.dart';
import 'package:clicker/Principales/login.dart';
import 'package:clicker/RecuperacionDatos/comprobaciones.dart';
import 'package:clicker/playerActions.dart/actions.dart';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constructores/Usuario.dart';
import "package:clicker/main.dart";
import 'package:async/async.dart';
import '../Constructores/jugador.dart';
import '../Constructores/monstruo.dart';
import 'dart:math';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

class Principal extends StatelessWidget {
  @override
  Widget build(Object context) {
    return Scaffold(
      body: Container(child: StatesApp()),
    );
  }
}

Improves improve = new Improves();

List<monstruo> listaMonstruos = [
  monstruo(
      nombre: "Morgoth",
      vida: 3000.00,
      imagenRuta: "assets/caballeroAnimado.gif",
      identificador: 1),
  monstruo(
    nombre: "Atreus",
    vida: 6000.00,
    imagenRuta: "assets/caballeroBebiendo.gif",
    identificador: 2,
  ),
  monstruo(
    nombre: "Inivir",
    vida: 8000.00,
    imagenRuta: "assets/caballeroAnimado2.gif",
    identificador: 3,
  ),
  monstruo(
    nombre: "Bailongo",
    vida: 24000.00,
    imagenRuta: "assets/dinosaurioBailando.gif",
    identificador: 4,
  ),
  monstruo(
    nombre: "Draconiano",
    vida: 300000.00,
    imagenRuta: "assets/dragon3.gif",
    identificador: 5,
  ),
  monstruo(
    nombre: "Balrock",
    vida: 50000.00,
    imagenRuta: "assets/dragonNegro.gif",
    identificador: 6,
  ),
  monstruo(
    nombre: "Oscar",
    vida: 750000.00,
    imagenRuta: "assets/animado3Mundo1.gif",
    identificador: 7,
  ),
  monstruo(
    nombre: "Alfonso",
    vida: 800000.00,
    imagenRuta: "assets/bichoraro.gif",
    identificador: 8,
  ),
  monstruo(
    nombre: "Suso",
    vida: 900000.00,
    imagenRuta: "assets/animado2.gif",
    identificador: 9,
  ),
  monstruo(
    nombre: "Oscar",
    vida: 1000000.00,
    imagenRuta: "assets/kakashi.gif",
    identificador: 10,
  ),
  monstruo(
    nombre: "Alfonso",
    vida: 1200000.00,
    imagenRuta: "assets/itachi.gif",
    identificador: 11,
  ),
  monstruo(
    nombre: "Suso",
    vida: 200000.00,
    imagenRuta: "assets/naruto.gif",
    identificador: 12,
  ),
];

List<String> listaMundos = [
  "assets/Mundo1.jpg",
  "assets/Mundo2.jpg",
  "assets/Mundo3.jpg",
  "assets/Mundo5.jpg"
];

// Ruta de imagen inicial
// String rutaMonstruo = listaMonstruos[contador].imagenRuta;
// Index para identificarlo
int indexImagen = 0;
// Vida inicial
double vida = listaMonstruos[contador].vida;
// Timers para variables por dps
Color colorLetras = Color(0xff660000);

//Timers

Timer? timer2;
Timer? timer1;
Timer? timer3;
Timer? timer4;
Timer? timerAtaqueMonstruo;
// Variables para dps
double danoDps1 = 5;

// Variables de tiempo para controlar los timers
int segundos1 = 0;
int segundos2 = 0;

//Variables para mostrar dps
double danoDpsTotal = 0;
double mostrarDanoDps = 0;

// Contador para cambiar de monstruo
int contador = 0;
int monedasJugador = 0;
int monedasRecibidas = 5;
double golpeSencillo = 100;
double golpeGlobal = golpeGlobal + golpeSencillo;



//Precios y variables para controlar la posicion aleaotoria de las imagenes de la mejora5

// Variable para comparar con la vidaMax de un monstruo e
// ir actualizando la barra de vida
double v = 1;

//Variable para ir controlando la vida del monstruo
double valorMejora = 0;
// Casos de vidaMax para comparacion
double vidaMax100 = vida;
double vidaMax90 = (vida * 0.9);
double vidaMax80 = (vida * 0.8);
double vidaMax70 = (vida * 0.7);
double vidaMax60 = (vida * 0.6);
double vidaMax50 = (vida * 0.5);
double vidaMax40 = (vida * 0.4);
double vidaMax30 = (vida * 0.3);
double vidaMax20 = (vida * 0.2);
double vidaMax10 = (vida * 0.1);

//Variables para ir controlando la vida del jugador
double vidaJugador = 1000;
double retornadorDeValorVida = 1;

double vidaMax = vidaJugador;
double vidaJugador90 = (vidaJugador * 0.9);
double vidaJugador80 = (vidaJugador * 0.8);
double vidaJugador70 = (vidaJugador * 0.7);
double vidaJugador60 = (vidaJugador * 0.6);
double vidaJugador50 = (vidaJugador * 0.5);
double vidaJugador40 = (vidaJugador * 0.4);
double vidaJugador30 = (vidaJugador * 0.3);
double vidaJugador20 = (vidaJugador * 0.2);
double vidaJugador10 = (vidaJugador * 0.1);

//Boleanos para controlar los turnos de ataque de cada parte
bool turnoJugador = true;
bool turnoMonstruo = false;
int duracionTurnoAtaqueMonstruo = 0;

// Booleans to control the improve's visibility
bool missing = true;

//Ataque del monstruo (provisional)
double golpeMonstruo = 100;
// En el caso 0 no necesito esta variable
Color verde = Color(0xff00FF00);
// Variable Color para la barra de vida
Color ColorValue = Colors.greenAccent;
Color transparent = Color.fromARGB(0, 255, 255, 128);

//Mensaje snackbar
String mensajeMaximaMejora = "Nivel Máximo de Mejora Alcanzado";

// Varible para música
final player = AudioPlayer();
final player2 = AudioPlayer();

//Variable para controlar el numero de monstruo de cada mundo,
int numeroMonstruo = 0;

// Variables para ancho y alto de pantalla para ventana emergente
var anchoPantalla, alturaPantalla, size;

//Instacia de la clase NivelesDeMejora
NivelesDeMejoras incrementoMejoras = NivelesDeMejoras();
ActionsPlayer playerAction = new ActionsPlayer();

//Instancia de la clase SnackBars

SnackBars snackBars = new SnackBars();

class StatesApp extends StatefulWidget {
  @override
  StatesAppState createState() => StatesAppState();
}

class StatesAppState extends State<StatesApp> {
  @override
  Widget build(BuildContext context) {
    final datosJugador = ModalRoute.of(context)!.settings.arguments as Jugador;
    // Ruta de imagen inicial
    String rutaMonstruo = listaMonstruos[datosJugador.monstruo].imagenRuta;

    setState(() {
      size = MediaQuery.of(context).size;
      alturaPantalla = size.height;
      anchoPantalla = size.width;
    });


  

    //Funcion para la musica
    void playFile(String url) {
      player.play(AssetSource(url));
    }

   

    void salir(BuildContext context) {
      Navigator.of(context).pushNamed("/Login");
    }

    //Funcion para barra de vida mosntruo
    double controladorBarra(v) {
      setState(() {
        if (vida <= vidaMax100 && vida > vidaMax90) {
          v = v;
        }
        if (vida <= vidaMax90 && vida > vidaMax80) {
          v = v - 0.1;
        }
        if (vida <= vidaMax80 && vida > vidaMax70) {
          v = v - 0.2;
        }
        if (vida <= vidaMax70 && vida > vidaMax60) {
          v = v - 0.3;
        }
        if (vida <= vidaMax60 && vida > vidaMax50) {
          v = v - 0.4;
        }
        if (vida <= vidaMax50 && vida > vidaMax40) {
          v = v - 0.5;
        }
        if (vida <= vidaMax40 && vida > vidaMax30) {
          v = v - 0.6;
        }
        if (vida <= vidaMax30 && vida > vidaMax20) {
          v = v - 0.7;
        }
        if (vida <= vidaMax20 && vida > vidaMax10) {
          v = v - 0.8;
        }
        if (vida <= vidaMax10 && vida > 0) {
          v = v - 0.9;
        }
        if (vida == 0) {
          v = 0.0;
        }
      });

      return v;
    }

    return MaterialApp(
        home: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(listaMundos[datosJugador.mundo]),
                    fit: BoxFit.cover)),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Column(children: [
                Stack(
                  children: [
                    Container(
                        width: 45,
                        height: 30,
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.07,
                            left: anchoPantalla * 0.05),
                        decoration: BoxDecoration(color: Colors.white),
                        child: InkWell(
                          child: Image.asset("assets/menu1.png"),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Container(
                                      height: alturaPantalla * 0.3,
                                      width: anchoPantalla * 0.79,
                                      decoration:
                                          BoxDecoration(color: Colors.brown),
                                      child: Column(children: [
                                        Container(
                                            child: Center(
                                          child: Container(
                                              child: Row(children: [
                                            Container(
                                                child: IconButton(
                                                    onPressed: (() {
                                                      print(
                                                          "El numero del monstruo es de: " +
                                                              datosJugador
                                                                  .monstruo
                                                                  .toString());

                                                      Comprobaciones
                                                          comprobacion =
                                                          Comprobaciones(
                                                            
                                                          );
                                                      //Llamamos a la funcion para ingresar los da

                                                      comprobacion
                                                          .ingresarDatosJugador(
                                                              datosJugador.id,
                                                              datosJugador
                                                                  .mundo,
                                                              datosJugador
                                                                  .monstruo,
                                                              datosJugador
                                                                  .monedas,
                                                              datosJugador
                                                                  .mejora1V1,
                                                              datosJugador
                                                                  .mejora1V2,
                                                              datosJugador
                                                                  .mejora1V3,
                                                              datosJugador
                                                                  .contador1);

                                                      Navigator.of(context)
                                                          .pushNamed("/Login");
                                                    }),
                                                    icon: Icon(Icons.abc)),
                                                margin: EdgeInsets.only(
                                                    top: 60, bottom: 10)),
                                            Text(
                                              "Música",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ])),
                                        )),
                                        Container(
                                            child: Row(
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 40),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white)),
                                                child: IconButton(
                                                    onPressed: () =>
                                                        setState(() {
                                                          //Comienzo de la musica
                                                          player2.play(
                                                              AssetSource(
                                                                  "Theme.mp3"));
                                                        }),
                                                    icon: Icon(Icons.speaker),
                                                    color: Colors.white)),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "Play",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white)),
                                                child: IconButton(
                                                    onPressed:() {
                                                      Comprobaciones comprobaciones = Comprobaciones();
                                                      comprobaciones.borrarUsaurio(datosJugador);
                                                      snackBars.usuarioBorrado(context);
                                                      Navigator.of(context)
                                                          .pushNamed("/Login");

                                                    },
                                                        
                                                       
                                                    icon: Icon(Icons
                                                        .speaker_notes_off),
                                                    color: Colors.white)),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  "Borrar ",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                 )),
                                                //Container( child: IconButton(
                                                //     onPressed: (() {
                                                //       print(
                                                //           "El numero del monstruo es de: " +
                                                //               datosJugador
                                                //                   .monstruo
                                                //                   .toString());

                                                //       Comprobaciones
                                                //           comprobacion =
                                                //           Comprobaciones(
                                                            
                                                //           );
                                                //       //Llamamos a la funcion para ingresar los da

                                                //       comprobacion
                                                //           .borrarUsaurio(
                                                //               datosJugador);

                                                //       Navigator.of(context)
                                                //           .pushNamed("/Login");
                                                //     }),
                                                //     icon: Icon(Icons.ac_unit)),
                                                // margin: EdgeInsets.only(
                                                //     top: 60, bottom: 10, right: 18)),
                                          ],
                                        )),
                                      ]),
                                    ),
                                    // contentPadding: EdgeInsets.zero,
                                  );
                                });
                          },
                        )),

                    Container(
                      margin: EdgeInsets.only(
                          top: alturaPantalla * 0.1,
                          right: anchoPantalla * 0.05),
                      alignment: Alignment.topRight,
                      child: Text("Mundo " + contador.toString(),
                          style: TextStyle(
                              fontSize: 35,
                              color: colorLetras,
                              fontFamily: "caps")),
                    ),
                    //Container que contendra la imagen en posicion aleatoria
                    Container(
                      child: Row(children: [
                        Visibility(
                          visible: missing ? false : true,
                          child: Container(
                          
                           width: 50,
                           height: 32,
                            //Valores de margen aleatorios, MENOS EL TOP Y EL BOTTOM
                            margin: EdgeInsets.only(top: improve.rngTop, left: improve.rngLeft),
                                child: InkWell(
                                  child: Image.asset(improve.imagenAleatoria),
                                  onTap: () {
                                  setState(() {
                                    missing =  true;
                                    player.play(AssetSource(
                                        "SonidoImagenEncontrada.mp3"));
                                    datosJugador.monedas = datosJugador.monedas +
                                        improve.monedasGanadasPorImagen;
                                  });
                                  //Una vez se haya clickado en la imagen esta desaparecera
                                })),
                    )]),
                    ),

                    //Container with monster´s image
                    Container(
                      margin: EdgeInsets.only(
                          top: alturaPantalla * 0.25,
                          left: anchoPantalla * 0.03),
                      child: Column(children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                               playerAction.critico();
                               playerAction.vidaResta(datosJugador, rutaMonstruo, listaMonstruos);
                            });
                          },
                          // ignore: sized_box_for_whitespace
                          child: Container(
                            margin: EdgeInsets.only(left: 50),
                            // ignore: prefer_const_constructors
                            child: Image.asset(rutaMonstruo),
                            height: 300,
                            width: 300,
                            //
                          ),
                        ),
                      ]),
                    ),
                    //Container with life bar
                    Container(
                      margin: EdgeInsets.only(
                          top: alturaPantalla * 0.6,
                          left: anchoPantalla * 0.14),
                      width: 300,
                      height: 20,
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(ColorValue),
                        backgroundColor: Colors.redAccent,
                        value:
                            // Llamo a la función y como parámetro v
                            controladorBarra(v),
                      ),
                    ),

                    //Container with coins and amount
                    Container(
                        decoration: BoxDecoration(),
                        margin: EdgeInsets.only(
                            top: alturaPantalla * 0.65, left: 20),
                        child: Row(children: [
                          Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(datosJugador.monedas.toString(),
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white)),
                          ),
                          Container(
                              width: 70,
                              height: 50,
                              child: Image.asset("assets/MonedasPrueba.png")),
                          Container(
                              margin: EdgeInsets.only(left: 40, top: 0),
                              child: Text(
                                improve.bombas.toString(),
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 5, top: 0),
                              child: InkWell(
                                child: Image.asset("assets/Bomba.png"),
                                onTap: () {
                                  setState(() {
                                    playerAction.usarBomba(vida);
                                  });
                                 
                                },
                              )),
                          Container(
                            width: 80,
                            height: 30,
                            margin: EdgeInsets.only(left: 30),
                            child: InkWell(
                              onTap: (() {
                                setState(() {
                                  player.play(
                                      AssetSource("assets/PasoPagina.mp3"));
                                });
                              }),
                              child: OutlinedButton(
                                child: Text("STATS"),
                                onPressed: (() {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          contentPadding: EdgeInsets.zero,
                                          content: Row(
                                            children: [
                                              Container(
                                                height: alturaPantalla * 0.6,
                                                width: anchoPantalla * 0.79,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: AssetImage(
                                                            listaMundos[
                                                                indexImagen]))),
                                                child: Stack(
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.all(5),
                                                        margin: EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 40,
                                                        ),
                                                        width: 300,
                                                        height: 700,
                                                        child: Image.asset(
                                                            "assets/Pergamino.png",
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    Center(
                                                        child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        370),
                                                            child: Text(
                                                                "ESTADISTICAS",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        35,
                                                                    color: Colors
                                                                        .white,
                                                                    fontFamily:
                                                                        "caps")))),
                                                    Center(
                                                      child: Container(
                                                        width: 200,
                                                        margin: EdgeInsets.only(
                                                            bottom: 170),
                                                        child: Text(
                                                          "Daño golpeSencillo: " +
                                                              golpeSencillo
                                                                  .toString() +
                                                              "\n \n"
                                                                  "Daño sangrado: " +
                                                              mostrarDanoDps
                                                                  .toString() +
                                                              "\n \n"
                                                                  "Daño de katon: " +
                                                              improve.danoFuego
                                                                  .toString() +
                                                              "\n \n"
                                                                  "Duracion tormenta: " +
                                                              improve.duracionTormenta
                                                                  .toString() +
                                                              "s" +
                                                              "\n \n"
                                                                  "Daño veneno/s: " +
                                                              improve.veneno.toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontFamily:
                                                                  "caps"),
                                                        ),
                                                      ),
                                                    ),
                                                    Center(
                                                        child: Container(
                                                      margin: EdgeInsets.only(
                                                          top: 200),
                                                      height: 200,
                                                      child: Image.asset(
                                                          "assets/Casco.png"),
                                                    )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                }),
                              ),
                            ),
                          )
                        ])),

                    // Container del scroll()
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage("assets/fondoScroll.jpg"),
                              fit: BoxFit.cover),
                          border: Border.all(color: Colors.yellowAccent)),
                      margin: EdgeInsets.only(top: alturaPantalla * 0.72),
                      height: alturaPantalla * 0.28,
                      child: ListView(
                        // This next line does the trick.
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          //Container con el primer item
                          // ignore: todo
                          //Este container contendra TODO
                          Container(
                              width: 160,
                              //Columna que contendra la imagen y la fila con el precio de la mejora y la imagen de las monedas
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                            
                                                            height:
                                                                alturaPantalla *
                                                                    0.6,
                                                            width:
                                                                anchoPantalla *
                                                                    0.79,
                                                            decoration: BoxDecoration(
                                                              
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: AssetImage(
                                                                        listaMundos[
                                                                            indexImagen]))),

                                                            // Container para el texto de explicación sobre el item
                                                            child: Stack(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            40,
                                                                      ),
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          700,
                                                                      child: Image.asset(
                                                                          "assets/Pergamino.png",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                290),
                                                                        width:
                                                                            180,
                                                                        child: Text(
                                                                            "Ganas más daño por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.white,
                                                                                fontFamily: "caps"))),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(top: 140),
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              child: Image.asset("assets/espada1.png"),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              400,
                                                                          left:
                                                                              30),
                                                                      child: Text(
                                                                          "Espada",
                                                                          style: TextStyle(
                                                                              fontSize: 40,
                                                                              color: Colors.white,
                                                                              fontFamily: "caps")))
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento1Mejora1(
                                                datosJugador.mejora1V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora1(
                                                datosJugador.mejora1V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora1(
                                                datosJugador.mejora1V3),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),

                                //Container donde esta la imagen
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 160,
                                    height: 120,
                                    child: InkWell(
                                      onTap: () {
                                        
                                        setState(() {
                                          improve.mejora1(datosJugador, context);
                                        }); 
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/espada1.png"),
                                            fit: BoxFit.cover))),
                                //Este container contendra la fila
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10, left: 5),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Text("Espada",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              improve.precioMejoraGlobal1.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),

                          SizedBox(
                            width: 30,
                          ),
                          //Container del segundo item
                          Container(
                              width: 160.0,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                            height:
                                                                alturaPantalla *
                                                                    0.6,
                                                            width:
                                                                anchoPantalla *
                                                                    0.79,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: AssetImage(
                                                                        listaMundos[
                                                                            indexImagen]))),

                                                            // Container para el texto de explicación sobre el item
                                                            child: Stack(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            40,
                                                                      ),
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          700,
                                                                      child: Image.asset(
                                                                          "assets/Pergamino.png",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                290),
                                                                        width:
                                                                            180,
                                                                        child: Text(
                                                                            "Ganas más monedas por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.white,
                                                                                fontFamily: "caps"))),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(top: 180),
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 220,
                                                                              child: Image.asset("assets/arco.png"),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              400,
                                                                          left:
                                                                              30),
                                                                      child: Text(
                                                                          "Arco",
                                                                          style: TextStyle(
                                                                              fontSize: 40,
                                                                              color: Colors.white,
                                                                              fontFamily: "caps")))
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento1Mejora2(improve.mejora2V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora2(improve.mejora2V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora2(improve.mejora2V3),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0, top: 10),
                                    width: 140,
                                    height: 110,
                                    child: InkWell(
                                      onTap: () {
                                       setState(() {
                                         improve.mejora2(datosJugador, context);
                                       });
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/arco.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10, left: 5),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Text("Arco",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              improve.precioMejoraGlobal2.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),

                          SizedBox(
                            width: 50,
                          ),
                          //Container del tercer item
                          Container(
                              width: 160.0,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                            height:
                                                                alturaPantalla *
                                                                    0.6,
                                                            width:
                                                                anchoPantalla *
                                                                    0.79,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: AssetImage(
                                                                        listaMundos[
                                                                            indexImagen]))),

                                                            // Container para el texto de explicación sobre el item
                                                            child: Stack(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            40,
                                                                      ),
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          700,
                                                                      child: Image.asset(
                                                                          "assets/Pergamino.png",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                290),
                                                                        width:
                                                                            180,
                                                                        child: Text(
                                                                            "Comienzas a hacer daño por segundo.\nExisten 3 niveles de mejora que se pueden comprar aumentando tu DPS.",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.white,
                                                                                fontFamily: "caps"))),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(top: 190),
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 220,
                                                                              child: Image.asset("assets/DañoPasiva.png"),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              400,
                                                                          left:
                                                                              30),
                                                                      child: Text(
                                                                          "Sangrado",
                                                                          style: TextStyle(
                                                                              fontSize: 40,
                                                                              color: Colors.white,
                                                                              fontFamily: "caps")))
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento1Mejora3(improve.mejora3V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora3(improve.mejora3V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora3(improve.mejora3V3),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0, top: 20),
                                    width: 140,
                                    height: 100,
                                    child: InkWell(
                                      onTap: () {
                                       setState(() {
                                         improve.mejora3(datosJugador, context);
                                       });
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/DañoPasiva.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Text("Sangrado",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              improve.precioMejoraGlobal3.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),

                          SizedBox(
                            width: 40,
                          ),
                          //Container del cuarto item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                            height:
                                                                alturaPantalla *
                                                                    0.6,
                                                            width:
                                                                anchoPantalla *
                                                                    0.79,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: AssetImage(
                                                                        listaMundos[
                                                                            indexImagen]))),

                                                            // Container para el texto de explicación sobre el item
                                                            child: Stack(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            40,
                                                                      ),
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          700,
                                                                      child: Image.asset(
                                                                          "assets/Pergamino.png",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                290),
                                                                        width:
                                                                            180,
                                                                        child: Text(
                                                                            "Realizas un daño directo contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar aumentando el daño realizado.",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.white,
                                                                                fontFamily: "caps"))),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(top: 130),
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              child: Image.asset("assets/BolaFuego.png"),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              400,
                                                                          left:
                                                                              30),
                                                                      child: Text(
                                                                          "Katon",
                                                                          style: TextStyle(
                                                                              fontSize: 40,
                                                                              color: Colors.white,
                                                                              fontFamily: "caps")))
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento1Mejora4(improve.mejora4V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora4(improve.mejora4V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora4(improve.mejora4V3),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 120,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          improve.mejora4(datosJugador, context);
                                        });
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/BolaFuego.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10, left: 5),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Katon",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              improve.precioMejoraGlobal4.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 40,
                          ),
                          //Container del quinto item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                            height:
                                                                alturaPantalla *
                                                                    0.6,
                                                            width:
                                                                anchoPantalla *
                                                                    0.79,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: AssetImage(
                                                                        listaMundos[
                                                                            indexImagen]))),

                                                            // Container para el texto de explicación sobre el item
                                                            child: Stack(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            40,
                                                                      ),
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          700,
                                                                      child: Image.asset(
                                                                          "assets/Pergamino.png",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                290),
                                                                        width:
                                                                            180,
                                                                        child: Text(
                                                                            "Surge una caja en una posición aleatoria, clickando ganas una cantidad directa de monedas.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.white,
                                                                                fontFamily: "caps"))),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(top: 160),
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 260,
                                                                              child: Image.asset("assets/ImagenAleatoria.png"),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              400,
                                                                          left:
                                                                              30),
                                                                      child: Text(
                                                                          "Random",
                                                                          style: TextStyle(
                                                                              fontSize: 40,
                                                                              color: Colors.white,
                                                                              fontFamily: "caps")))
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento1Mejora5(improve.mejora5V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora5(improve.mejora5V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora5(improve.mejora5V3),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0, top: 4),
                                    width: 120,
                                    height: 116,
                                    child: InkWell(
                                      onTap: () {
                                       setState(() {
                                         improve.mejora5(datosJugador, context);
                                       });
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/ImagenAleatoria.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10, left: 5),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Random",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent,
                                                  fontFamily: "caps"))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              improve.precioMejoraGlobal5.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 50,
                          ),
                          //Container del sexto item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 0),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                            height:
                                                                alturaPantalla *
                                                                    0.6,
                                                            width:
                                                                anchoPantalla *
                                                                    0.79,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: AssetImage(
                                                                        listaMundos[
                                                                            indexImagen]))),

                                                            // Container para el texto de explicación sobre el item
                                                            child: Stack(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            40,
                                                                      ),
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          700,
                                                                      child: Image.asset(
                                                                          "assets/Pergamino.png",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                290),
                                                                        width:
                                                                            180,
                                                                        child: Text(
                                                                            "Al comprarla tienes la posibilidad de matar directamente al enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.white,
                                                                                fontFamily: "caps"))),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(top: 140),
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              child: Image.asset("assets/Calavera1.png"),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              400,
                                                                          left:
                                                                              30),
                                                                      child: Text(
                                                                          "Parca",
                                                                          style: TextStyle(
                                                                              fontSize: 40,
                                                                              color: Colors.white,
                                                                              fontFamily: "caps")))
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento1Mejora6(improve.mejora6V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora6(improve.mejora6V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora6(improve.mejora6V3),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10, top: 4),
                                    width: 140,
                                    height: 116,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          improve.mejora6(datosJugador, context);
                                        });
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/Calavera1.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 10, left: 0),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Parca",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              improve.precioMejoraGlobal6.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 50,
                          ),
                          //Container del septimo item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 0),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                            height:
                                                                alturaPantalla *
                                                                    0.6,
                                                            width:
                                                                anchoPantalla *
                                                                    0.79,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: AssetImage(
                                                                        listaMundos[
                                                                            indexImagen]))),

                                                            // Container para el texto de explicación sobre el item
                                                            child: Stack(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            40,
                                                                      ),
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          700,
                                                                      child: Image.asset(
                                                                          "assets/Pergamino.png",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                290),
                                                                        width:
                                                                            180,
                                                                        child: Text(
                                                                            "Ganas 3 bombas que puedes lanzar haciendo daño directo al enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.white,
                                                                                fontFamily: "caps"))),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(top: 160),
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 220,
                                                                              child: Image.asset("assets/Bomba.png"),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              400,
                                                                          left:
                                                                              30),
                                                                      child: Text(
                                                                          "Bomba",
                                                                          style: TextStyle(
                                                                              fontSize: 40,
                                                                              color: Colors.white,
                                                                              fontFamily: "caps")))
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento1Mejora7(improve.mejora7V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora7(improve.mejora7V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora7(improve.mejora7V3),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0, top: 5),
                                    width: 110,
                                    height: 113,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          improve.mejora7(datosJugador, context);
                                        });
                                        
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/Bomba.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 11, left: 0),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Bomba",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              improve.precioMejoraGlobal7.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 50,
                          ),
                          //Container del octavo item
                          Container(
                              width: 140,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 0, top: 0),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                            height:
                                                                alturaPantalla *
                                                                    0.6,
                                                            width:
                                                                anchoPantalla *
                                                                    0.79,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: AssetImage(
                                                                        listaMundos[
                                                                            indexImagen]))),

                                                            // Container para el texto de explicación sobre el item
                                                            child: Stack(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            40,
                                                                      ),
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          700,
                                                                      child: Image.asset(
                                                                          "assets/Pergamino.png",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                290),
                                                                        width:
                                                                            180,
                                                                        child: Text(
                                                                            "Te da la posibilidad de superar el limite de mejora de la espada, el arco o el veneno.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.white,
                                                                                fontFamily: "caps"))),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(top: 170),
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 220,
                                                                              child: Image.asset("assets/Bufo.png"),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              400,
                                                                          left:
                                                                              30),
                                                                      child: Text(
                                                                          "Bufo",
                                                                          style: TextStyle(
                                                                              fontSize: 40,
                                                                              color: Colors.white,
                                                                              fontFamily: "caps")))
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0, top: 0),
                                    width: 140,
                                    height: 130,
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          improve.mejora8(datosJugador, context);
                                        });
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/Bufo.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 0, left: 0),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Bufo",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              improve.precioMejoraGlobal8.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 50,
                          ),
                          //Container del noveno item
                          Container(
                              width: 140,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 0),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                            height:
                                                                alturaPantalla *
                                                                    0.6,
                                                            width:
                                                                anchoPantalla *
                                                                    0.79,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: AssetImage(
                                                                        listaMundos[
                                                                            indexImagen]))),

                                                            // Container para el texto de explicación sobre el item
                                                            child: Stack(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            40,
                                                                      ),
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          700,
                                                                      child: Image.asset(
                                                                          "assets/Pergamino.png",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                290),
                                                                        width:
                                                                            180,
                                                                        child: Text(
                                                                            "Al comprarla, comienza una tormenta durante un tiempo que realiza daño al enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                fontFamily: "caps",
                                                                                color: Colors.white))),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(top: 130),
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              child: Image.asset("assets/TormentaHielo.png"),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              400,
                                                                          left:
                                                                              30),
                                                                      child: Text(
                                                                          "Tormenta",
                                                                          style: TextStyle(
                                                                              fontSize: 40,
                                                                              color: Colors.white,
                                                                              fontFamily: "caps")))
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento1Mejora9(improve.mejora9V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora9(improve.mejora9V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora9(improve.mejora9V3),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 160,
                                    height: 116,
                                    child: InkWell(
                                      onTap: () {
                                        improve.mejora9(datosJugador, context);
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "assets/TormentaHielo.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 11, left: 2),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Storm",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                              improve.precioMejoraGlobal9.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                          SizedBox(
                            width: 50,
                          ),
                          //Container del decimo item
                          Container(
                              width: 160,
                              child: Column(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 0),
                                  height: 20,
                                  child: Row(children: [
                                    Container(
                                        margin: EdgeInsets.only(right: 15),
                                        child: InkWell(
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      content: Row(
                                                        children: [
                                                          Container(
                                                            height:
                                                                alturaPantalla *
                                                                    0.6,
                                                            width:
                                                                anchoPantalla *
                                                                    0.79,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20),
                                                                image: DecorationImage(
                                                                    fit: BoxFit
                                                                        .fill,
                                                                    image: AssetImage(
                                                                        listaMundos[
                                                                            indexImagen]))),

                                                            // Container para el texto de explicación sobre el item
                                                            child: Stack(
                                                                children: [
                                                                  Center(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      margin: EdgeInsets
                                                                          .only(
                                                                        top: 10,
                                                                        bottom:
                                                                            40,
                                                                      ),
                                                                      width:
                                                                          300,
                                                                      height:
                                                                          700,
                                                                      child: Image.asset(
                                                                          "assets/Pergamino.png",
                                                                          fit: BoxFit
                                                                              .cover),
                                                                    ),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(
                                                                            bottom:
                                                                                290),
                                                                        width:
                                                                            180,
                                                                        child: Text(
                                                                            "Enveneas al enemigo, realizandole daño por segundo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                                                            style: TextStyle(
                                                                                fontSize: 18,
                                                                                color: Colors.white,
                                                                                fontFamily: "caps"))),
                                                                  ),
                                                                  Center(
                                                                    child: Container(
                                                                        margin: EdgeInsets.only(top: 160),
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                              height: 260,
                                                                              child: Image.asset("assets/Veneno.png"),
                                                                            ),
                                                                          ],
                                                                        )),
                                                                  ),
                                                                  Container(
                                                                      margin: EdgeInsets.only(
                                                                          top:
                                                                              400,
                                                                          left:
                                                                              30),
                                                                      child: Text(
                                                                          "Veneno",
                                                                          style: TextStyle(
                                                                              fontSize: 40,
                                                                              color: Colors.white,
                                                                              fontFamily: "caps")))
                                                                ]),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                                "assets/iconoAyuda.png",
                                                color: Colors.yellowAccent))),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento1Mejora10(improve.mejora10V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora10(improve.mejora10V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora10(improve.mejora10V3),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 0),
                                    width: 140,
                                    height: 116,
                                    child: InkWell(
                                      onTap: () {
                                        improve.mejora10(datosJugador, context);
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image:
                                                AssetImage("assets/Veneno.png"),
                                            fit: BoxFit.cover))),
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.yellowAccent)),
                                    height: 25,
                                    margin: EdgeInsets.only(top: 11, left: 0),
                                    //Creamos la fila
                                    child: Row(children: [
                                      Container(
                                          margin: EdgeInsets.only(left: 2),
                                          child: Text("Veneno",
                                              style: TextStyle(
                                                  color: Colors.yellowAccent))),
                                      //Container en el que aparecera el precio de la mejora
                                      Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                              improve.precioMejoraGlobal10.toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14))),
                                      //Container para mostrar la imagen
                                      Container(
                                          width: 60,
                                          height: 100,
                                          child: Image.asset(
                                              "assets/MonedasPrueba.png"))
                                    ]))
                              ])),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            )));
  }
  
  
}

/*Funciones adicionales de ataque del monstruo
 //Funcion para controlar el ataque del monstruo
    void ataqueMonstruo() {
      
        timerAtaqueMonstruo = Timer.periodic(Duration(seconds: 1), (timer) {
          if(turnoMonstruo == true){
        duracionTurnoAtaqueMonstruo ++;
        }
        print("seconds: " + duracionTurnoAtaqueMonstruo.toString());
        //A los cinco segundos el monstruo atacara

        if(duracionTurnoAtaqueMonstruo == 5){ //Cuando se haya realizado el ataque del monstruo se seteara a false su turno y el turno del jugador se volvera a activar

            setState(() {
              //El monstruo realiza el ataque
              vidaJugador = vidaJugador - golpeMonstruo;
              
            });
            duracionTurnoAtaqueMonstruo = 0;
               turnoMonstruo = false;
               turnoJugador = true;
            timerAtaqueMonstruo?.cancel();
        }
});
        
      
      
    }


    //Funcion para barra de vida del jugador

    double barraDeVidaJugador(retornadorDeValorDeVida) {
      setState(() {
        if (vidaJugador <= vidaMax && vidaJugador > vidaJugador90) {
          retornadorDeValorVida = retornadorDeValorVida;
        }
        if (vidaJugador <= vidaJugador90 && vidaJugador > vidaJugador80) {
          retornadorDeValorVida = retornadorDeValorVida - 0.1;
        }
        if (vidaJugador <= vidaJugador80 && vidaJugador > vidaJugador70) {
          retornadorDeValorVida = retornadorDeValorVida - 0.2;
        }
        if (vidaJugador <= vidaJugador70 && vidaJugador > vidaJugador60) {
          retornadorDeValorVida = retornadorDeValorVida - 0.3;
        }
        if (vidaJugador <= vidaJugador60 && vidaJugador > vidaJugador50) {
          retornadorDeValorVida = retornadorDeValorVida - 0.4;
        }
        if (vidaJugador <= vidaJugador50 && vidaJugador > vidaJugador40) {
          retornadorDeValorVida = retornadorDeValorVida - 0.5;
        }
        if (vidaJugador <= vidaJugador40 && vidaJugador > vidaJugador30) {
          retornadorDeValorVida = retornadorDeValorVida - 0.6;
        }
        if (vidaJugador <= vidaJugador30 && vidaJugador > vidaJugador20) {
          retornadorDeValorVida = retornadorDeValorVida - 0.7;
        }
        if (vidaJugador <= vidaJugador20 && vidaJugador > vidaJugador10) {
          retornadorDeValorVida = retornadorDeValorVida - 0.8;
        }
        if (vidaJugador <= vidaJugador10 && vidaJugador > 0) {
          retornadorDeValorVida = retornadorDeValorVida - 0.9;
        }
        if (vidaJugador == 0) {
          retornadorDeValorVida = 0;
        }
      });
      return retornadorDeValorVida;
    }

    //Container con la barra de vida del jugador
                    Container(
                        margin: EdgeInsets.only(
                          top: alturaPantalla * 0.15,
                        ),
                        width: anchoPantalla,
                        height: 10,
                        child: LinearProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(ColorValue),
                            backgroundColor: Colors.redAccent,
                            value: barraDeVidaJugador(retornadorDeValorVida)
                            //Llamamos a la funcion que retorne
                            )),
    */
