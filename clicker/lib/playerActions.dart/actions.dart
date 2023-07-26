import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:clicker/Principales/clicker.dart';
class ActionsPlayer {

  double golpeCritico = 1000;
  bool probabilidadCritico = true;
  int temporizadorDeCritico = 0;

  void usarBomba(vida) {
      if (improve.bombas > 0) {
          //Al usar la bomba se le quitara vida al monstruo
          vida = vida - improve.danoBomba;
          improve.bombas = improve.bombas - 1;
          player.play(AssetSource("SonidoUsoBomba.mp3"));
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

    //Fucion vidaResta
    void vidaResta(datosJugador, rutaMonstruo, listaMonstruos) {
      
      playerAction.temporizadorDeCritico++;
      vida = vida - golpeGlobal;
      datosJugador.monedas = datosJugador.monedas + monedasRecibidas;

      if (vida < 0) {
        player.play(AssetSource("SonidoMuerteMonstruo.mp3"));
        datosJugador.monstruo++;
        contador = datosJugador.monstruo;
        vida = listaMonstruos[datosJugador.monstruo].vida;
        rutaMonstruo = listaMonstruos[datosJugador.monstruo].imagenRuta;
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
      
    }


}
