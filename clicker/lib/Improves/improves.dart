
import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import '../Principales/clicker.dart';

class Improves {

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

  //Variables para controlar las mejoras
  bool bolaFuegoActivada = false;
  bool poderUsarBolaFuego = true;

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

 //Lista de mejoras:
 //Todas las mejoras tienen el mismo funcionamiento

   void mejora1(datosJugador, context) {
      if (datosJugador.contador1 == 0 &&
          datosJugador.monedas >= precio1Mejora1) {
          //Seteamos el precio de la mejora
          precioMejoraGlobal1 = precio2Mejora1;
          //Actualizamos las monedas del jugador al realizar la compra
          datosJugador.monedas = datosJugador.monedas - precio1Mejora1;
          //Sonido de la mejora
          player.play(AssetSource("SonidoEspada.mp3"));
        
        datosJugador.mejora1V1 = 1;

        snackBars.mostrarMejoraComprada(context);
        golpeSencillo = golpeSencillo * 2;
        datosJugador.contador1++;
      }
      if (datosJugador.contador1 == 1 &&
          datosJugador.monedas >= precio2Mejora1) {
     
          datosJugador.monedas = datosJugador.monedas - precio2Mejora1;
          precioMejoraGlobal1 = precio3Mejora1;
          player.play(AssetSource("SonidoEspada.mp3"));
        
        datosJugador.mejora1V2 = 1;

        snackBars.mostrarMejoraComprada(context);
        golpeSencillo = golpeSencillo * 3;
        datosJugador.contador1++;
      }
      if (datosJugador.contador1 == 2 && datosJugador.monedas >= precio3Mejora1) {
       
        datosJugador.monedas = datosJugador.monedas - precio3Mejora1;
        player.play(AssetSource("SonidoEspada.mp3"));
        
        datosJugador.mejora1V3 = 1;
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        golpeSencillo = golpeSencillo * 4;
        datosJugador.contador1++;
      }
      //Bufo extra
      if (datosJugador.contador1 > 2 && mejora8Utilizada == false) {
      
        player.play(AssetSource("SonidoBufo.mp3"));
        snackBars.bufoEspada(context);
        //Aplicamos la mejora del bufo al daño del click
        golpeSencillo = golpeSencillo * 8;
      }
    }

       //Mejora2
    void mejora2(datosJugador, context) {
      if (contadorMejora2 == 0 && datosJugador.monedas >= precio1Mejora2) {
        mejora2V1 = true;
        precioMejoraGlobal2 = precio2Mejora2;
        player.play(AssetSource("SonidoFlecha.mp3"));
        datosJugador.monedas = datosJugador.monedas - precio1Mejora2;
        snackBars.mostrarMejoraComprada(context);
        monedasRecibidas = 10;
        contadorMejora2++;
      }
      if (contadorMejora2 == 1 && datosJugador.monedas >= precio2Mejora2) {
        mejora2V2 = true;
        precioMejoraGlobal2 = precio3Mejora2;
        player.play(AssetSource("SonidoFlecha.mp3"));
        datosJugador.monedas = datosJugador.monedas - precio2Mejora2;
        snackBars.mostrarMejoraComprada(context);
        monedasRecibidas = 20;
        contadorMejora2++;
      }
      if (contadorMejora2 == 2 && datosJugador.monedas >= precio3Mejora2) {
        player.play(AssetSource("SonidoFlecha.mp3"));
        datosJugador.monedas = datosJugador.monedas - precio3Mejora2;
        mejora2V3 = true;
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        monedasRecibidas = 30;
        contadorMejora2++;
      }
      if (contadorMejora2 > 2 && mejora8Utilizada == false) {
        print("se ha utilizado el bufo");
        player.play(AssetSource("SonidoBufo.mp3"));
        snackBars.bufoArco(context);
        monedasRecibidas = 60;
      }
    }


    void mejora3(datosJugador, context) {

      if (contadorMejora3 == 0 && datosJugador.monedas >= precio1Mejora3) {
         snackBars.mostrarMejoraComprada(context);
         controladorContador1 = true;
         mejora3V1 = true;
         precioMejoraGlobal3 =precio2Mejora3;
         datosJugador.monedas = datosJugador.monedas - precio1Mejora3;
         player.play(AssetSource("SonidoMuerte.mp3"));
         contadorMejora3++;

         timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
          segundos1 += 1;
          if (contadorMejora3 == 1 && controladorContador1 == true) {
            double danoV1 = 5;
            vida = vida - danoDps1;
            datosJugador.monedas = datosJugador.monedas + 5;
            mostrarDanoDps = danoV1;
          }
          if (contadorMejora3 == 2 && controladorContador2 == true) {
            double danoV2 = 20;
            vida = vida - (danoDps1 * 2);
            datosJugador.monedas = datosJugador.monedas + 10;
            mostrarDanoDps = danoV2;
          }
          if (contadorMejora3 == 3 && controladorContador3 == true) {
            double danoV3 = 30;
            vida = vida - (danoDps1 * 3);
            datosJugador.monedas = datosJugador.monedas + 15;
            mostrarDanoDps = danoV3;
          }
        });
      }

       if (contadorMejora3 == 1 && datosJugador.monedas >= precio2Mejora3) {
         snackBars.mostrarMejoraComprada(context);
         controladorContador1 = true;
         mejora3V2 = true;
         precioMejoraGlobal3 =precio3Mejora3;
         datosJugador.monedas = datosJugador.monedas - precio2Mejora3;
         player.play(AssetSource("SonidoMuerte.mp3"));
         contadorMejora3++;

         timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
          segundos1 += 1;
          if (contadorMejora3 == 1 && controladorContador1 == true) {
            double danoV1 = 5;
            vida = vida - danoDps1;
            datosJugador.monedas = datosJugador.monedas + 5;
            mostrarDanoDps = danoV1;
          }
          if (contadorMejora3 == 2 && controladorContador2 == true) {
            double danoV2 = 20;
            vida = vida - (danoDps1 * 2);
            datosJugador.monedas = datosJugador.monedas + 10;
            mostrarDanoDps = danoV2;
          }
          if (contadorMejora3 == 3 && controladorContador3 == true) {
            double danoV3 = 30;
            vida = vida - (danoDps1 * 3);
            datosJugador.monedas = datosJugador.monedas + 15;
            mostrarDanoDps = danoV3;
          }
        });
      }

       if (contadorMejora3 == 2 && datosJugador.monedas >= precio3Mejora3) {
         snackBars.mostrarMejoraComprada(context);
         controladorContador1 = true;
         mejora3V3 = true;
         datosJugador.monedas = datosJugador.monedas - precio3Mejora3;
         player.play(AssetSource("SonidoMuerte.mp3"));
         contadorMejora3++;
         
         timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
          segundos1 += 1;
          if (contadorMejora3 == 1 && controladorContador1 == true) {
            double danoV1 = 5;
            vida = vida - danoDps1;
            datosJugador.monedas = datosJugador.monedas + 5;
            mostrarDanoDps = danoV1;
          }
          if (contadorMejora3 == 2 && controladorContador2 == true) {
            double danoV2 = 20;
            vida = vida - (danoDps1 * 2);
            datosJugador.monedas = datosJugador.monedas + 10;
            mostrarDanoDps = danoV2;
          }
          if (contadorMejora3 == 3 && controladorContador3 == true) {
            double danoV3 = 30;
            vida = vida - (danoDps1 * 3);
            datosJugador.monedas = datosJugador.monedas + 15;
            mostrarDanoDps = danoV3;
          }
        });
      }


      if (contadorMejora3 > 2 && datosJugador.monedas > precio3Mejora3) {
         snackBars.mostrarMejoraComprada(context);
         datosJugador.monedas = datosJugador.monedas - precio3Mejora3;
         player.play(AssetSource("SonidoMuerte.mp3"));

         timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
          segundos1 += 1;
          if (contadorMejora3 == 1 && controladorContador1 == true) {
            double danoV1 = 5;
            vida = vida - danoDps1;
            datosJugador.monedas = datosJugador.monedas + 5;
            mostrarDanoDps = danoV1;
          }
          if (contadorMejora3 == 2 && controladorContador2 == true) {
            double danoV2 = 20;
            vida = vida - (danoDps1 * 2);
            datosJugador.monedas = datosJugador.monedas + 10;
            mostrarDanoDps = danoV2;
          }
          if (contadorMejora3 == 3 && controladorContador3 == true) {
            double danoV3 = 30;
            vida = vida - (danoDps1 * 3);
            datosJugador.monedas = datosJugador.monedas + 15;
            mostrarDanoDps = danoV3;
          }
        });

      }
    }


       //Mejora 4
     void mejora4(datosJugador, context) {

      if (contadorMejora4 == 0 && datosJugador.monedas >= precio1Mejora4) {
        mejora4V1 = true;
        //Seteamos el daño de la bola de fuego
        danoFuego = bolaFuegoV1;
        //Actualizamos el precio
        precioMejoraGlobal4 = precio2Mejora4;
        vida = vida - danoFuego;
        player.play(AssetSource("SonidoBolaFuego.mp3"));
        //Restamos monedas jugador
        datosJugador.monedas = datosJugador.monedas - precio1Mejora4;
        contadorMejora4++;
        snackBars.mostrarMejoraComprada(context);
      }
      if (contadorMejora4 == 1 && datosJugador.monedas >= precio2Mejora4) {
        mejora4V2 = true;
        danoFuego = bolaFuegoV2;
        precioMejoraGlobal4 = precio3Mejora4;
        vida = vida - danoFuego;
        player.play(AssetSource("SonidoBolaFuego.mp3"));
        datosJugador.monedas = datosJugador.monedas - precio2Mejora4;
        contadorMejora4++;
        snackBars.mostrarMejoraComprada(context);
      }
      if (contadorMejora4 == 2 && datosJugador.monedas >= precio3Mejora4) {
        danoFuego = bolaFuegoV3;
        mejora4V3 = true;
        precioMejoraGlobal4 = precio4Mejora4;
        vida = vida - danoFuego;
        player.play(AssetSource("SonidoBolaFuego.mp3"));
        datosJugador.monedas = datosJugador.monedas - precio3Mejora4;
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
        vida = vida - danoFuego;
        datosJugador.monedas = datosJugador.monedas - precio4Mejora4;
        player.play(AssetSource("SonidoBolaFuego.mp3"));
        //Al usar la bola de fuego la seteamos a false
        bolaFuegoActivada = false;
        //Una vez de que se utilice seteamos esta variable para indicar que se podra utilizar de nuevo la habilidad
        poderUsarBolaFuego = true;
      }
    }

    //Mejora5
    String mejora5(datosJugador, context) {
      //Variable random que se asignara al valor de separacion con el borde izquierdo
      Random randomLeft = Random();
      Random randomTop = Random();

      //Valores de entre 1.00 y 99.00
      rngLeft = randomLeft.nextDouble() * 200;
      rngTop = randomTop.nextDouble() * 300;

      if (contadorMejora5 == 0 && datosJugador.monedas >= precio1Mejora5) {
        missing = false;
        datosJugador.monedas = datosJugador.monedas - precio1Mejora5;
        precioMejoraGlobal5 = precio2Mejora5;
        player.play(AssetSource("SonidoSuerte.mp3"));
        mejora5V1 = true;
        snackBars.mostrarMejoraComprada(context);
        monedasGanadasPorImagen = 500;
        contadorMejora5++;
        imagenAleatoria = "assets/ImagenAleatoria.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 == 1 && datosJugador.monedas >= precio2Mejora5) {
        missing = false;
        datosJugador.monedas = datosJugador.monedas - precio2Mejora5;
        precioMejoraGlobal5 = precio3Mejora5;
        player.play(AssetSource("SonidoSuerte.mp3"));
        mejora5V2 = true;
        snackBars.mostrarMejoraComprada(context);
        monedasGanadasPorImagen = 750;
        contadorMejora5++;
        imagenAleatoria = "assets/.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 == 2 && datosJugador.monedas >= precio3Mejora5) {
        missing = false;
        datosJugador.monedas = datosJugador.monedas - precio3Mejora5;
        player.play(AssetSource("SonidoSuerte.mp3"));
        mejora5V3 = true;
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        monedasGanadasPorImagen = 1000;
        contadorMejora5++;
        imagenAleatoria = "assets/ImagenAleatoria.png";
        return imagenAleatoria;
      }
      if (contadorMejora5 > 2 && datosJugador.monedas >= precio3Mejora5) {
        datosJugador.monedas = datosJugador.monedas - precio3Mejora5;
        player.play(AssetSource("SonidoSuerte.mp3"));
        monedasGanadasPorImagen = 1000;
        imagenAleatoria = "assets/ImagenAleatoria.png";
        return imagenAleatoria;
      }
      return "";
    }

    void mejora6(datosJugador, context) {
      if (contadorMejora6 == 0 && datosJugador.monedas > precio1Mejora6) {
        snackBars.mostrarMejoraComprada(context);
        //En este primer nivel de mejora el jugador tendra un 20% de probabilidad de q la bomba explote
        Random bombaVersion1 = Random();
        int rngBomba = bombaVersion1.nextInt(4);
        if (rngBomba == 2) {
          vida = vida - vida;
          
        datosJugador.monedas = datosJugador.monedas - precio1Mejora6;
        //Actualizamos el precio de la mejora
        precioMejoraGlobal6 = precio2Mejora6;
        player.play(AssetSource("SonidoMuerteCalavera.mp3"));
        }
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
        if (rngBomba == 2) {
            vida = vida - vida;
          }
        datosJugador.monedas = datosJugador.monedas - precio2Mejora6;
        precioMejoraGlobal6 = precio3Mejora6;
        player.play(AssetSource("SonidoMuerteCalavera.mp3"));
       

        mejora6V2 = true;
        contadorMejora6++;
      }

      if (contadorMejora6 == 2 && datosJugador.monedas > precio3Mejora6) {
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        //En este primer nivel de mejora el jugador tendra un 37.5% de probabilidad de q la bomba explote
        Random bombaVersion2 = Random();
        int rngBomba = bombaVersion2.nextInt(1);
        if (rngBomba == 0) {
            vida = vida - vida;
          }
        datosJugador.monedas = datosJugador.monedas - precio3Mejora6;
        player.play(AssetSource("SonidoMuerteCalavera.mp3"));
     

        mejora6V3 = true;
        contadorMejora6++;
      }
      if(contadorMejora6 > 2 && datosJugador.monedas > precio3Mejora6) {
        snackBars.mostrarMejoraComprada(context);
        Random bombaVersion2 = Random();
        int rngBomba = bombaVersion2.nextInt(1);
        if (rngBomba == 0) {
            vida = vida - vida;
          }
        player.play(AssetSource("SonidoMuerteCalavera.mp3"));
        datosJugador.monedas = datosJugador.monedas - precio3Mejora6;
        
      }
    }

    //Mejora7
    void mejora7(datosJugador, context) {
      if (contadorMejora7 == 0 && datosJugador.monedas > precio1Mejora7) {
        snackBars.mostrarMejoraComprada(context);
        //Actualizamos el numero de bombas que tenemos
        bombas = bombas + cantidadBombasV1;
        //Actualizamos el precio del jugador
        datosJugador.monedas = datosJugador.monedas - precio1Mejora7;
        player.play(AssetSource("SonidoBombasActivadas.mp3"));
        //Actualizamos el precio de la mejora
        precioMejoraGlobal7 = precio2Mejora7;
        mejora7V1 = true;
        //Incrementamos el contador
        contadorMejora7++;
      }
      if (contadorMejora7 == 1 && datosJugador.monedas > precio2Mejora7) {
        snackBars.mostrarMejoraComprada(context);
        bombas = bombas + cantidadBombasV2;
        datosJugador.monedas = datosJugador.monedas - precio2Mejora7;
        precioMejoraGlobal7 = precio3Mejora7;
        player.play(AssetSource("SonidoBombasActivadas.mp3"));
        mejora7V2 = true;
        contadorMejora7++;
      }
      if (contadorMejora7 == 2 && datosJugador.monedas > precio3Mejora7) {
        snackBars.mostrarMejoraComprada(context);
        snackBars.mostrarMaximaMejora(context);
        bombas = bombas + cantidadBombasV3;
        datosJugador.monedas = datosJugador.monedas - precio3Mejora7;
        player.play(AssetSource("SonidoBombasActivadas.mp3"));
        mejora7V3 = true;
        //Incrementamos el contador
        contadorMejora7++;
      }
      if (contadorMejora7 > 2 && datosJugador.monedas > precio3Mejora7) {
        bombas = bombas + cantidadBombasV3;
        datosJugador.monedas = datosJugador.monedas - precio3Mejora7;
        player.play(AssetSource("SonidoBombasActivadas.mp3"));
      }
    }

        //Mejora 8
    void mejora8(datosJugador, context) {
      if (contadorMejora8 == 0 && datosJugador.monedas > precio1Mejora8) {
        datosJugador.monedas = datosJugador.monedas - precio1Mejora8;
        precioMejoraGlobal8 = precio2Mejora8;
        player.play(AssetSource("SonidoActivacionBufo.mp3"));
        snackBars.mostrarMejoraComprada(context);
        contadorMejora8++;
        mejora8Utilizada = false;
      }
    }

    }

    



  
 
  
//   @override
//   Improves createState() => Improves();       
// }

// class Improves extends State <ImprovesStructure> {



//  
  
//   @override
//   Widget build(BuildContext context) {

   
   
//     // TODO: implement build
//     throw UnimplementedError();
    
//   }


