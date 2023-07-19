import 'package:audioplayers/audioplayers.dart';
import 'package:clicker/Principales/clicker.dart';

class ActionsPlayer {

  void usarBomba(vida) {
      if (improve.bombas > 0) {
          //Al usar la bomba se le quitara vida al monstruo
          vida = vida - improve.danoBomba;
          improve.bombas = improve.bombas - 1;
          player.play(AssetSource("SonidoUsoBomba.mp3"));
      }
    }

}
