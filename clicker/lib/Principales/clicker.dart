//ignore_for_file: unnecessary_import, use_key_in_widget_constructors, override_on_non_overriding_member, avoid_unnecessary_containers, prefer_const_constructors, prefer_interpolation_to_compose_strings, duplicate_ignore, prefer_const_literals_to_create_immutables, sort_child_properties_last, avoid_print

import 'package:clicker/Complementos/NivelesDeMejoras.dart';
import 'package:clicker/Complementos/snackBars.dart';
import 'package:clicker/RecuperacionDatos/comprobaciones.dart';

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
String colorPrueba = "0xffF856DF";
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
double golpeCritico = 1000;
bool probabilidadCritico = true;
int temporizadorDeCritico = 0;

//Variables para controlar las mejoras
bool bolaFuegoActivada = false;
bool poderUsarBolaFuego = true;

//Precios globales de mejoras para imprimnir por pantalla

// Precios de mejora1
int precio1Mejora1 = 100;
int precio2Mejora1 = 400;
int precio3Mejora1 = 800;
int precioMejoraGlobal1 = 100;
int contadorMejora1 = 0;
int mostrarMejora1Maxima = 0;
bool mejora1V1 = false;
bool mejora1V2 = false;
bool mejora1V3 = false;

//Precios de mejora2
int precio1Mejora2 = 200;
int precio2Mejora2 = 600;
int precio3Mejora2 = 1200;
int precioMejoraGlobal2 = 200;
int contadorMejora2 = 0;
int mostrarMejora2Maxima = 0;
bool mejora2V1 = false;
bool mejora2V2 = false;
bool mejora2V3 = false;

//Precios de mejora3
int precio1Mejora3 = 100;
int precio2Mejora3 = 500;
int precio3Mejora3 = 1000;
int precioMejoraGlobal3 = 100;
int contadorMejora3 = 0;
int mostrarMejora3Maxima = 0;
bool mejora3V1 = false;
bool mejora3V2 = false;
bool mejora3V3 = false;
bool controladorContador1 = false;
bool controladorContador2 = false;
bool controladorContador3 = false;

//Precios de mejora 4
double danoFuego = 0;
int precio1Mejora4 = 50;
int precio2Mejora4 = 100;
int precio3Mejora4 = 300;
int precio4Mejora4 = 900;
int precioMejoraGlobal4 = 50;
int contadorMejora4 = 0;
int mostrarMejora4Maxima = 0;
bool mejora4V1 = false;
bool mejora4V2 = false;
bool mejora4V3 = false;

//Ataque de bola de fuego Lvl 1
double bolaFuegoV1 = 1000;
//Ataque de bola de fuego Lvl 2
double bolaFuegoV2 = 2000;
//Ataque de bola de fuego Lvl 3
double bolaFuegoV3 = 3000;
//Ataque bola de fuego lvl final
double bolaFuegoVFinal = 10000;

//Precios y variables para controlar la posicion aleaotoria de las imagenes de la mejora5
double rngLeft = 0;
double rngTop = 0;
int contadorMejora5 = 0;
int precioMejoraGlobal5 = 100;
int precio1Mejora5 = 100;
int precio2Mejora5 = 400;
int precio3Mejora5 = 900;
String imagenAleatoria = "assets/ImagenAleatoria.png";
int monedasGanadasPorImagen = 0;
int mostrarMejora5Maxima = 0;
bool mejora5V1 = false;
bool mejora5V2 = false;
bool mejora5V3 = false;

//Variables de mejora6
int contadorMejora6 = 0;
int precioMejoraGlobal6 = 50;
int precio1Mejora6 = 50;
int precio2Mejora6 = 300;
int precio3Mejora6 = 600;
bool mejora6V1 = false;
bool mejora6V2 = false;
bool mejora6V3 = false;

//Variables de mejora7
int contadorMejora7 = 0;
int precioMejoraGlobal7 = 50;
int precio1Mejora7 = 50;
int precio2Mejora7 = 300;
int precio3Mejora7 = 500;
bool mejora7V1 = false;
bool mejora7V2 = false;
bool mejora7V3 = false;
int bombas = 0;
int cantidadBombasV1 = 3;
int cantidadBombasV2 = 6;
int cantidadBombasV3 = 9;
int danoBomba = 400;

//Variables de mejora 8
int contadorMejora8 = 0;

int precio1Mejora8 = 100;
int precio2Mejora8 = 200;
int precio3Mejora8 = 300;
int precioMejoraGlobal8 = 100;
bool mejora8Utilizada = true;

//Variables de mejora9

int contadorMejora9 = 0;
bool mejora9V1 = false;
bool mejora9V2 = false;
bool mejora9V3 = false;
int precio1Mejora9 = 50;
int precio2Mejora9 = 100;
int precio3Mejora9 = 150;
int precioMejoraGlobal9 = 50;
int danoHielo = 100;
bool lluviaHeladaV1 = true;
bool lluviaHeladaV2 = true;
bool lluviaHeladaV3 = true;
int duracionTormenta = 0;
int tiempoTormenta = 30;
int tiempoAmostrar = 0;

//Variables de mejora10
int contadorMejora10 = 0;
bool mejora10V1 = false;
bool mejora10V2 = false;
bool mejora10V3 = false;
int precio1Mejora10 = 50;
int precio2Mejora10 = 100;
int precio3Mejora10 = 150;
int precioMejoraGlobal10 = 50;
int contadorTiempoVeneno = 0;
int veneno = 0;

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

    //Fucion vidaResta
    void vidaResta() {
      /*Cuando ya se haya gastado el turno del jugador seteamos al false y setemaos el turno del monstruo a true
      turnoJugador = false;
      turnoMonstruo = true;
*/

      // Resto uno de vida y sumo 5 monedas
      setState(() {
        print("Las monedas son: " + monedasJugador.toString());
        temporizadorDeCritico++;
        vida = vida - golpeGlobal;
        // print("Vida: " + vida.toString());
        datosJugador.monedas = datosJugador.monedas + monedasRecibidas;

        //Este print es de prueba
        print(
            "Las monedas del jugador son: " + datosJugador.monedas.toString());
        // monedasJugador = monedasJugador + monedasRecibidas;
        // print("Monedas: " + monedasJugador.toString());
        if (vida < 0) {
          //Cuando el monstruo muere sonara esto
          player.play(AssetSource("SonidoMuerteMonstruo.mp3"));

          // contador++;
          // numeroMonstruo = contador;
          // datosJugador.monstruo = numeroMonstruo;
          datosJugador.monstruo++;
          contador = datosJugador.monstruo;
          //datosJugador.monstruo = numeroMonstruo;
          // Cambiamos de monstruo en función al contador por lo que asignamos a las variables su vida y su ruta de imagen
          vida = listaMonstruos[datosJugador.monstruo].vida;
          rutaMonstruo = listaMonstruos[datosJugador.monstruo].imagenRuta;
          // Actualizo las variables para barra de vida
          vidaMax90 = (vida * 0.9);
          vidaMax80 = (vida * 0.8);
          vidaMax70 = (vida * 0.7);
          vidaMax60 = (vida * 0.6);
          vidaMax50 = (vida * 0.5);
          vidaMax40 = (vida * 0.4);
          vidaMax30 = (vida * 0.3);
          vidaMax20 = (vida * 0.2);
          vidaMax10 = (vida * 0.1);
          v = 1;

          //Controlamos que si ha matado mas de 3 mundos pero menos de 6 el mundo se actualizara
          if (datosJugador.monstruo >= 3 && datosJugador.monstruo <= 6) {
            datosJugador.mundo = 1;
          }
          if (datosJugador.monstruo >= 6 && datosJugador.monstruo <= 9) {
            datosJugador.mundo = 2;
          }
          if (datosJugador.monstruo >= 9 && datosJugador.monstruo <= 13) {
            datosJugador.mundo = 3;
          }
        }
      });
    }

    //Funcion para la musica
    void playFile(String url) {
      player.play(AssetSource(url));
    }

    //Lista de mejoras:
    //Todas las mejoras tienen el mismo funcionamiento

    //Mejora1
    void mejora1() {
      if (datosJugador.contador1 == 0 &&
          datosJugador.monedas >= precio1Mejora1) {
        setState(() {
          //Seteamos el precio de la mejora
          precioMejoraGlobal1 = precio2Mejora1;
          //Actualizamos las monedas del jugador al realizar la compra
          datosJugador.monedas = datosJugador.monedas - precio1Mejora1;
          //Sonido de la mejora
          player.play(AssetSource("SonidoEspada.mp3"));
        });
        datosJugador.mejora1V1 = 1;

        snackBars.mostrarMejoraComprada(context);
        golpeSencillo = golpeSencillo * 2;
        datosJugador.contador1++;
      }
      if (datosJugador.contador1 == 1 &&
          datosJugador.monedas >= precio2Mejora1) {
        setState(() {
          datosJugador.monedas = datosJugador.monedas - precio2Mejora1;
          precioMejoraGlobal1 = precio3Mejora1;
          player.play(AssetSource("SonidoEspada.mp3"));
        });
        datosJugador.mejora1V2 = 1;

        snackBars.mostrarMejoraComprada(context);
        golpeSencillo = golpeSencillo * 3;
        datosJugador.contador1++;
      }
      if (datosJugador.contador1 == 2 &&
          datosJugador.monedas >= precio3Mejora1) {
        setState(() {
          datosJugador.monedas = datosJugador.monedas - precio3Mejora1;
          player.play(AssetSource("SonidoEspada.mp3"));
        });
        datosJugador.mejora1V3 = 1;
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        golpeSencillo = golpeSencillo * 4;
        datosJugador.contador1++;
      }
      //Bufo extra
      if (datosJugador.contador1 > 2 && mejora8Utilizada == false) {
        setState(() {
          player.play(AssetSource("SonidoBufo.mp3"));
        });
        //Indicamos que el bufo ya se ha utilizado

        snackBars.bufoEspada(context);
        //Aplicamos la mejora del bufo al daño del click
        golpeSencillo = golpeSencillo * 8;
      }
    }

    //Mejora2
    void mejora2() {
      if (contadorMejora2 == 0 && datosJugador.monedas >= precio1Mejora2) {
        mejora2V1 = true;
        setState(() {
          precioMejoraGlobal2 = precio2Mejora2;
          player.play(AssetSource("SonidoFlecha.mp3"));
          datosJugador.monedas = datosJugador.monedas - precio1Mejora2;
        });
        snackBars.mostrarMejoraComprada(context);
        monedasRecibidas = 10;
        contadorMejora2++;
      }
      if (contadorMejora2 == 1 && datosJugador.monedas >= precio2Mejora2) {
        mejora2V2 = true;
        setState(() {
          precioMejoraGlobal2 = precio3Mejora2;
          player.play(AssetSource("SonidoFlecha.mp3"));
          datosJugador.monedas = datosJugador.monedas - precio2Mejora2;
        });
        snackBars.mostrarMejoraComprada(context);
        monedasRecibidas = 20;
        contadorMejora2++;
      }
      if (contadorMejora2 == 2 && datosJugador.monedas >= precio3Mejora2) {
        setState(() {
          player.play(AssetSource("SonidoFlecha.mp3"));
          datosJugador.monedas = datosJugador.monedas - precio3Mejora2;
        });
        mejora2V3 = true;
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        monedasRecibidas = 30;
        contadorMejora2++;
      }
      if (contadorMejora2 > 2 && mejora8Utilizada == false) {
        setState(() {
          player.play(AssetSource("SonidoBufo.mp3"));
        });

        snackBars.bufoArco(context);
        monedasRecibidas = 60;
      }
    }

    //Mejora 3
    void dps1(contadorMejora3) {
      timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
        segundos1 += 1;

        setState(() {
          if (contadorMejora3 == 1 && controladorContador1 == true) {
            double danoV1 = 5;
            vida = vida - danoDps1;
            datosJugador.monedas = datosJugador.monedas + 5;
            // danoDpsTotal = 5;
            mostrarDanoDps = danoV1;
          }
          if (contadorMejora3 == 2 && controladorContador2 == true) {
            double danoV2 = 20;
            vida = vida - (danoDps1 * 2);
            datosJugador.monedas = datosJugador.monedas + 10;
            // danoDpsTotal = 10;
            mostrarDanoDps = danoV2;
          }
          if (contadorMejora3 == 3 && controladorContador3 == true) {
            double danoV3 = 30;
            vida = vida - (danoDps1 * 3);
            datosJugador.monedas = datosJugador.monedas + 15;
            // danoDpsTotal = 15;
            mostrarDanoDps = danoV3;
          }
        });
      });
    }

    //Mejora 4
    void mejora4() {

      if (contadorMejora4 == 0 && datosJugador.monedas >= precio1Mejora4) {
        print("la mejora 4 ha sido comprada");
        mejora4V1 = true;
        //Seteamos el daño de la bola de fuego
        danoFuego = bolaFuegoV1;

        //Actualizamos el precio
        precioMejoraGlobal4 = precio2Mejora4;

        setState(() {
          vida = vida - danoFuego;
          player.play(AssetSource("SonidoBolaFuego.mp3"));
          //Restamos monedas jugador
          datosJugador.monedas = datosJugador.monedas - precio1Mejora4;
        });
        contadorMejora4++;

        snackBars.mostrarMejoraComprada(context);
      }
      if (contadorMejora4 == 1 && datosJugador.monedas >= precio2Mejora4) {
        mejora4V2 = true;
        danoFuego = bolaFuegoV2;

        precioMejoraGlobal4 = precio3Mejora4;

        setState(() {
          vida = vida - danoFuego;
          player.play(AssetSource("SonidoBolaFuego.mp3"));
          datosJugador.monedas = datosJugador.monedas - precio2Mejora4;
        });
        contadorMejora4++;
        snackBars.mostrarMejoraComprada(context);
      }
      if (contadorMejora4 == 2 && datosJugador.monedas >= precio3Mejora4) {
        danoFuego = bolaFuegoV3;
        mejora4V3 = true;

        precioMejoraGlobal4 = precio4Mejora4;
        setState(() {
          vida = vida - danoFuego;
          player.play(AssetSource("SonidoBolaFuego.mp3"));
          datosJugador.monedas = datosJugador.monedas - precio3Mejora4;
        });
        contadorMejora4++;

        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
      }
      if (contadorMejora4 > 2 && bolaFuegoActivada == false) {
        timer2 = Timer.periodic(Duration(seconds: 1), (timer) {
          //Solo empezara la cuenta atras cuando la variable que controla si ya hemos utilizado o no la habilidad se ponga a true
          //sino la cuenta no empezara, con lo cual aunque pase un minuto no podremos usar la habilidad
          if (poderUsarBolaFuego == true) {
            segundos2++;
          }

          if (segundos2 == 60) {
            snackBars.bolaDeFuegoActivada(context);
            //Cuando hayan pasado los veinte segundos podremos utilizar la habilidad
            bolaFuegoActivada = true;
            //Seteamos la variable a false, para que el temporizador no se vuelva a incrementar
            poderUsarBolaFuego = false;
            segundos2 = 0;
          }
        });
      }
      if (bolaFuegoActivada == true && datosJugador.monedas > precio4Mejora4) {
        snackBars.mostrarMejoraComprada(context);
        danoFuego = bolaFuegoVFinal;
        setState(() {
          vida = vida - danoFuego;
          datosJugador.monedas = datosJugador.monedas - precio4Mejora4;
          player.play(AssetSource("SonidoBolaFuego.mp3"));
        });

        //Al usar la bola de fuego la seteamos a false
        bolaFuegoActivada = false;
        //Una vez de que se utilice seteamos esta variable para indicar que se podra utilizar de nuevo la habilidad
        poderUsarBolaFuego = true;
      }
    }

    //Mejora5
    String mejora5() {
      //Variable random que se asignara al valor de separacion con el borde izquierdo
      Random randomLeft = Random();
      Random randomTop = Random();

      //Valores de entre 1.00 y 99.00
      rngLeft = randomLeft.nextDouble() * 200;
      rngTop = randomTop.nextDouble() * 300;

      if (contadorMejora5 == 0 && datosJugador.monedas >= precio1Mejora5) {
        setState(() {
          datosJugador.monedas = datosJugador.monedas - precio1Mejora5;
          precioMejoraGlobal5 = precio2Mejora5;
          player.play(AssetSource("SonidoSuerte.mp3"));
        });
        mejora5V1 = true;
        snackBars.mostrarMejoraComprada(context);
        monedasGanadasPorImagen = 500;
        contadorMejora5++;

        imagenAleatoria = "assets/ImagenAleatoria.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 == 1 && datosJugador.monedas >= precio2Mejora5) {
        setState(() {
          datosJugador.monedas = datosJugador.monedas - precio2Mejora5;
          precioMejoraGlobal5 = precio3Mejora5;
          player.play(AssetSource("SonidoSuerte.mp3"));
        });
        mejora5V2 = true;
        snackBars.mostrarMejoraComprada(context);
        monedasGanadasPorImagen = 750;
        contadorMejora5++;

        imagenAleatoria = "assets/.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 == 2 && datosJugador.monedas >= precio3Mejora5) {
        setState(() {
          datosJugador.monedas = datosJugador.monedas - precio3Mejora5;
          player.play(AssetSource("SonidoSuerte.mp3"));
        });
        mejora5V3 = true;
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        monedasGanadasPorImagen = 1000;
        contadorMejora5++;
        imagenAleatoria = "assets/ImagenAleatoria.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 > 2 && datosJugador.monedas >= precio3Mejora5) {
        setState(() {
          datosJugador.monedas = datosJugador.monedas - precio3Mejora5;
          player.play(AssetSource("SonidoSuerte.mp3"));
        });
        monedasGanadasPorImagen = 1000;

        imagenAleatoria = "assets/ImagenAleatoria.png";
        return imagenAleatoria;
      }
      return "";
    }

    void mejora6() {
      if (contadorMejora6 == 0 && datosJugador.monedas > precio1Mejora6) {
        snackBars.mostrarMejoraComprada(context);
        //En este primer nivel de mejora el jugador tendra un 20% de probabilidad de q la bomba explote
        Random bombaVersion1 = Random();
        int rngBomba = bombaVersion1.nextInt(4);
        setState(() {
          if (rngBomba == 2) {
            vida = vida - vida;
          }
          datosJugador.monedas = datosJugador.monedas - precio1Mejora6;
          //Actualizamos el precio de la mejora
          precioMejoraGlobal6 = precio2Mejora6;
          player.play(AssetSource("SonidoMuerteCalavera.mp3"));
        });

        //Seteamos a true la variable que controla la aparicion de el indicador de mejora
        mejora6V1 = true;
        //Actualizamos las monedas del jugador
        contadorMejora6++;
      }
      if (contadorMejora6 == 1 && datosJugador.monedas > precio2Mejora6) {
        snackBars.mostrarMejoraComprada(context);
        //En este primer nivel de mejora el jugador tendra un 37.5% de probabilidad de q la bomba explote
        Random bombaVersion2 = Random();
        int rngBomba = bombaVersion2.nextInt(3);
        setState(() {
          if (rngBomba == 2) {
            vida = vida - vida;
          }
          datosJugador.monedas = datosJugador.monedas - precio2Mejora6;
          precioMejoraGlobal6 = precio3Mejora6;
          player.play(AssetSource("SonidoMuerteCalavera.mp3"));
        });

        mejora6V2 = true;
        contadorMejora6++;
      }

      if (contadorMejora6 == 2 && datosJugador.monedas > precio3Mejora6) {
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        //En este primer nivel de mejora el jugador tendra un 37.5% de probabilidad de q la bomba explote
        Random bombaVersion2 = Random();
        int rngBomba = bombaVersion2.nextInt(1);
        setState(() {
          if (rngBomba == 0) {
            vida = vida - vida;
          }
          datosJugador.monedas = datosJugador.monedas - precio3Mejora6;
          player.play(AssetSource("SonidoMuerteCalavera.mp3"));
        });

        mejora6V3 = true;
        contadorMejora6++;
      }
      if (contadorMejora6 > 2 && datosJugador.monedas > precio3Mejora6) {
        snackBars.mostrarMejoraComprada(context);

        Random bombaVersion2 = Random();
        int rngBomba = bombaVersion2.nextInt(1);
        setState(() {
          if (rngBomba == 0) {
            vida = vida - vida;
          }
          player.play(AssetSource("SonidoMuerteCalavera.mp3"));
         datosJugador.monedas = datosJugador.monedas - precio3Mejora6;
        });
      }
    }

    //Mejora7

    void mejora7() {
      if (contadorMejora7 == 0 && datosJugador.monedas > precio1Mejora7) {
        snackBars.mostrarMejoraComprada(context);
        setState(() {
          //Actualizamos el numero de bombas que tenemos
          bombas = bombas + cantidadBombasV1;
          //Actualizamos el precio del jugador
          datosJugador.monedas = datosJugador.monedas - precio1Mejora7;
          player.play(AssetSource("SonidoBombasActivadas.mp3"));
        });
        //Actualizamos el precio de la mejora
        precioMejoraGlobal7 = precio2Mejora7;
        mejora7V1 = true;
        //Incrementamos el contador
        contadorMejora7++;
      }
      if (contadorMejora7 == 1 && datosJugador.monedas > precio2Mejora7) {
        snackBars.mostrarMejoraComprada(context);
        setState(() {
          bombas = bombas + cantidadBombasV2;
          datosJugador.monedas = datosJugador.monedas - precio2Mejora7;
          precioMejoraGlobal7 = precio3Mejora7;
          player.play(AssetSource("SonidoBombasActivadas.mp3"));
        });
        mejora7V2 = true;
        contadorMejora7++;
      }
      if (contadorMejora7 == 2 && datosJugador.monedas > precio3Mejora7) {
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        setState(() {
          bombas = bombas + cantidadBombasV3;
          datosJugador.monedas = datosJugador.monedas - precio3Mejora7;
          player.play(AssetSource("SonidoBombasActivadas.mp3"));
        });

        mejora7V3 = true;
        //Incrementamos el contador
        contadorMejora7++;
      }
      if (contadorMejora7 > 2 && datosJugador.monedas > precio3Mejora7) {
        setState(() {
          bombas = bombas + cantidadBombasV3;
          datosJugador.monedas = datosJugador.monedas - precio3Mejora7;
          player.play(AssetSource("SonidoBombasActivadas.mp3"));
        });
      }
    }

    //Mejora 8
    void mejora8() {
      if (contadorMejora8 == 0 && datosJugador.monedas > precio1Mejora8) {
        setState(() {
          datosJugador.monedas = datosJugador.monedas - precio1Mejora8;
          precioMejoraGlobal8 = precio2Mejora8;
          player.play(AssetSource("SonidoActivacionBufo.mp3"));
        });
        snackBars.mostrarMejoraComprada(context);

        contadorMejora8++;

        mejora8Utilizada = false;
      }
    }

    //Mejora 9
    void mejora9() {
      if (contadorMejora9 == 0 && datosJugador.monedas > precio1Mejora9) {
        duracionTormenta = 30;
        mejora9V1 = true;

        setState(() {
          //Actualizamos el precio de la mejora
          precioMejoraGlobal9 = precio2Mejora9;
          datosJugador.monedas = datosJugador.monedas - precio1Mejora9;
          player.play(AssetSource("RuidoTormenta.mp3"));
        });
        contadorMejora9++;
        snackBars.mostrarMejoraComprada(context);
        snackBars.escarchaON(context);
        timer3 = Timer.periodic(Duration(seconds: 1), (timer) {
          if (lluviaHeladaV1 == true) {
            setState(() {
              //Empiza la tormenta
              duracionTormenta = duracionTormenta - 1;
              //Le restamos el daño que hara por segundo la lluvia helada
              vida = vida - danoHielo;
            });
            //El tiempo de duracion de la tormenta sera de treinte segundos
            if (duracionTormenta == 0) {
              //Indicamos que el contador de la tormenta se reinicie
              duracionTormenta = 30;
              //Indicamos que la lluvia helada ha parado
              lluviaHeladaV1 = false;
              snackBars.escarchaOF(context);
            }
          }
        });
      }
      if (contadorMejora9 == 1 && datosJugador.monedas > precio2Mejora9) {
        duracionTormenta = 60;
        mejora9V2 = true;
        snackBars.mostrarMejoraComprada(context);
        setState(() {
          player.play(AssetSource("RuidoTormenta.mp3"));
          precioMejoraGlobal9 = precio3Mejora9;
          datosJugador.monedas = datosJugador.monedas - precio2Mejora9;
        });
        contadorMejora9++;
        snackBars.escarchaON(context);
        timer3 = Timer.periodic(Duration(seconds: 1), (timer) {
          if (lluviaHeladaV2 == true) {
            setState(() {
              duracionTormenta--;
              vida = vida - danoHielo;
            });
            //La duracion de la tormenta sera de sesenta segundos
            if (duracionTormenta == 0) {
              duracionTormenta = 60;
              lluviaHeladaV2 = false;
              snackBars.escarchaOF(context);
            }
          }
        });
      }
      if (contadorMejora9 == 2 && datosJugador.monedas > precio3Mejora9) {
        duracionTormenta = 90;
        mejora9V3 = true;
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        setState(() {
          player.play(AssetSource("RuidoTormenta.mp3"));
          datosJugador.monedas = datosJugador.monedas - precio3Mejora9;
        });
        contadorMejora9++;
        snackBars.escarchaON(context);
        timer3 = Timer.periodic(Duration(seconds: 1), (timer) {
          if (lluviaHeladaV3 == true) {
            duracionTormenta--;

            setState(() {
              duracionTormenta--;
              vida = vida - danoHielo;
            });
            // La duracion de la tormenta sera de un minuto y medio
            if (duracionTormenta == 0) {
              lluviaHeladaV3 = false;

              duracionTormenta = 90;
              snackBars.escarchaOF(context);
            }
          }
        });
      }
      if (contadorMejora9 > 2 && datosJugador.monedas > precio3Mejora9) {
        snackBars.mostrarMejoraComprada(context);
        setState(() {
          player.play(AssetSource("RuidoTormenta.mp3"));
          datosJugador.monedas = datosJugador.monedas - precio3Mejora9;
        });
        contadorMejora9++;
        snackBars.escarchaON(context);
        timer3 = Timer.periodic(Duration(seconds: 1), (timer) {
          if (lluviaHeladaV3 == true) {
            duracionTormenta--;

            setState(() {
              duracionTormenta--;
              vida = vida - danoHielo;
            });
            //La duracion de la tormenta sera de 90 segundos
            if (duracionTormenta == 90) {
              duracionTormenta = 0;
              lluviaHeladaV3 = false;
              snackBars.escarchaOF(context);
            }
          }
        });
      }
    }

    //Mejora 10

    void mejora10() {
      if (contadorMejora10 == 0 && datosJugador.monedas > precio1Mejora10) {
        veneno = 100;
        //Seteamos el indicador de mejora a true
        mejora10V1 = true;
        //Mostramos un snackBar que nos diga que la mejora esta comprada
        snackBars.mostrarMejoraComprada(context);
        //Mostramos un snackBar para indicar que el monstruo ha sido envenenado
        snackBars.venenoV1(context);
        //Incrementamos el contador de la mejora
        contadorMejora10++;
        setState(() {
          //Sonido de la habilidad
          player.play(AssetSource("Veneno.mp3"));
          //Actualizamos el precio una vez que compramos la mejora
          precioMejoraGlobal10 = precio2Mejora10;
          //Actualizamos la cantidad de monedas que tendra el jugador una vez ha comprado la mejora
         datosJugador.monedas = datosJugador.monedas - precio1Mejora10;
        });
 
        //Creamos un timer para controlar que hara esta mejora por segundo
        timer4 = Timer.periodic(Duration(seconds: 1), (timer) {
          //Incrementamos la duracion del veneno
          contadorTiempoVeneno++;
          setState(() {
            //El valor que le estamos restando a la vida sera el el daño veneno es decir el daño dps por segundo
            vida = vida - veneno;
          });
        });
      }
      if (contadorMejora10 == 1 && datosJugador.monedas > precio2Mejora10) {
        veneno = 200;
        mejora10V2 = true;
        snackBars.mostrarMejoraComprada(context);
        snackBars.venenoV2(context);
        contadorMejora10++;
        setState(() {
          player.play(AssetSource("Veneno.mp3"));
          precioMejoraGlobal10 = precio3Mejora10;
          datosJugador.monedas = datosJugador.monedas- precio2Mejora10;
        });

        timer4 = Timer.periodic(Duration(seconds: 1), (timer) {
          contadorTiempoVeneno++;
          setState(() {
            vida = vida - veneno;
          });
        });
      }
      if (contadorMejora10 == 2 && datosJugador.monedas > precio3Mejora10) {
        veneno = 300;
        mejora10V3 = true;
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        snackBars.venenoV3(context);
        contadorMejora10++;
        setState(() {
         datosJugador.monedas = datosJugador.monedas - precio3Mejora10;
        });

        timer4 = Timer.periodic(Duration(seconds: 1), (timer) {
          contadorTiempoVeneno++;
          setState(() {
            player.play(AssetSource("Veneno.mp3"));
            vida = vida - veneno;
          });
        });
      }

      if (contadorMejora10 > 2 && mejora8Utilizada == false) {
        veneno = 500;
        setState(() {
          player.play(AssetSource("SonidoBufo.mp3"));
          vida = vida - veneno;
        });
        snackBars.bufoVeneno(context);
      }
    }

    //Funcion de manejo de utilizacion bombas
    void usarBomba() {
      if (bombas > 0) {
        setState(() {
          //Al usar la bomba se le quitara vida al monstruo
          vida = vida - danoBomba;
          bombas = bombas - 1;
          player.play(AssetSource("SonidoUsoBomba.mp3"));
        });
      }
    }

    //Si el rng (numero aleatorio entre 0 y 9) es igual a 4 el golpe global sera un critico, sino sera un golpeSencillo
    void critico() {
      Random random = Random();
      int rng = random.nextInt(10);
      temporizadorDeCritico > 10 && rng == 4
          ? golpeGlobal = golpeCritico
          : golpeGlobal = golpeSencillo;
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
                            margin: EdgeInsets.only(top: rngTop, left: rngLeft),
                                child: InkWell(
                                  child: Image.asset(imagenAleatoria),
                                  onTap: () {
                                  setState(() {
                                    missing = false;
                                    player.play(AssetSource(
                                        "SonidoImagenEncontrada.mp3"));
                                    monedasJugador = monedasJugador +
                                        monedasGanadasPorImagen;
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
                            critico();
                            vidaResta();
                            setState(() {
                              // playFile("assets/Theme.mp3");
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
                                bombas.toString(),
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )),
                          Container(
                              height: 50,
                              margin: EdgeInsets.only(left: 5, top: 0),
                              child: InkWell(
                                child: Image.asset("assets/Bomba.png"),
                                onTap: () {
                                  usarBomba();
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
                                                        decoration:
                                                            BoxDecoration(),
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
                                                            decoration:
                                                                BoxDecoration(),
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
                                                        decoration:
                                                            BoxDecoration(),
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
                                                              danoFuego
                                                                  .toString() +
                                                              "\n \n"
                                                                  "Duracion tormenta: " +
                                                              duracionTormenta
                                                                  .toString() +
                                                              "s" +
                                                              "\n \n"
                                                                  "Daño veneno/s: " +
                                                              veneno.toString(),
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
                                                      decoration:
                                                          BoxDecoration(),
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
                                              setState(() {});
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
                                        mejora1();
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
                                              precioMejoraGlobal1.toString(),
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
                                            .incremento1Mejora2(mejora2V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora2(mejora2V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora2(mejora2V3),
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
                                        mejora2();
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
                                              precioMejoraGlobal2.toString(),
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
                                            .incremento1Mejora3(mejora3V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora3(mejora3V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora3(mejora3V3),
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
                                        if (contadorMejora3 == 0 &&
                                            datosJugador.monedas >= precio1Mejora3) {
                                          snackBars
                                              .mostrarMejoraComprada(context);
                                          controladorContador1 = true;
                                          mejora3V1 = true;
                                          setState(() {
                                            precioMejoraGlobal3 =
                                                precio2Mejora3;
                                            datosJugador.monedas =
                                                datosJugador.monedas - precio1Mejora3;
                                            player.play(AssetSource(
                                                "SonidoMuerte.mp3"));
                                          });
                                          contadorMejora3++;
                                          dps1(contadorMejora3);
                                        }
                                        if (contadorMejora3 == 1 &&
                                            datosJugador.monedas >= precio2Mejora3) {
                                          snackBars
                                              .mostrarMejoraComprada(context);
                                          controladorContador1 = false;
                                          controladorContador2 = true;

                                          mejora3V2 = true;
                                          contadorMejora3++;
                                          dps1(contadorMejora3);
                                          setState(() {
                                            precioMejoraGlobal3 =
                                                precio3Mejora3;
                                            datosJugador.monedas =
                                                datosJugador.monedas - precio2Mejora3;
                                            player.play(AssetSource(
                                                "SonidoMuerte.mp3"));
                                          });
                                        }

                                        if (contadorMejora3 == 2 &&
                                            datosJugador.monedas >= precio3Mejora3) {
                                          controladorContador2 = false;
                                          controladorContador3 = true;
                                          snackBars
                                              .mostrarMejoraComprada(context);
                                          snackBars
                                              .mostrarMaximaMejora(context);
                                          mejora3V3 = true;
                                          contadorMejora3++;
                                          dps1(contadorMejora3);
                                          setState(() {
                                            datosJugador.monedas =
                                                datosJugador.monedas - precio3Mejora3;

                                            player.play(AssetSource(
                                                "SonidoMuerte.mp3"));
                                          });
                                        }

                                        if (contadorMejora3 > 2 &&
                                            datosJugador.monedas > precio3Mejora3) {
                                          snackBars
                                              .mostrarMejoraComprada(context);
                                          dps1(contadorMejora3);
                                          setState(() {
                                            datosJugador.monedas =
                                               datosJugador.monedas - precio3Mejora3;

                                            player.play(AssetSource(
                                                "SonidoMuerte.mp3"));
                                          });
                                        }
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
                                              precioMejoraGlobal3.toString(),
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
                                            .incremento1Mejora4(mejora4V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora4(mejora4V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora4(mejora4V3),
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
                                        print(contadorMejora4.toString() + monedasJugador.toString());
                                        mejora4();
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
                                              precioMejoraGlobal4.toString(),
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
                                            .incremento1Mejora5(mejora5V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora5(mejora5V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora5(mejora5V3),
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
                                        mejora5();
                                        print(rngLeft);
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
                                              precioMejoraGlobal5.toString(),
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
                                            .incremento1Mejora6(mejora6V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora6(mejora6V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora6(mejora6V3),
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
                                        mejora6();
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
                                              precioMejoraGlobal6.toString(),
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
                                            .incremento1Mejora7(mejora7V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora7(mejora7V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora7(mejora7V3),
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
                                        mejora7();
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
                                              precioMejoraGlobal7.toString(),
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
                                        mejora8();
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
                                              precioMejoraGlobal8.toString(),
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
                                            .incremento1Mejora9(mejora9V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora9(mejora9V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora9(mejora9V3),
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
                                        mejora9();
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
                                              precioMejoraGlobal9.toString(),
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
                                            .incremento1Mejora10(mejora10V1),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento2Mejora10(mejora10V2),
                                        width: 30,
                                        height: 10,
                                      ),
                                    ),
                                    Transform(
                                      transform: Matrix4.rotationZ(1.56),
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        color: incrementoMejoras
                                            .incremento3Mejora10(mejora10V3),
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
                                        mejora10();
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
                                              precioMejoraGlobal10.toString(),
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
