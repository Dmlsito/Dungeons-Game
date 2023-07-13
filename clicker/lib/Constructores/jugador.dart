// ignore_for_file: unnecessary_this

class Jugador {
  int id;
  int monedas;
  int monstruo;
  int mundo;
  int mejora1V1;
  int mejora1V2;
  int mejora1V3;
  int contador1;

  Jugador(
      {required this.id,
      required this.monstruo,
      required this.mundo,
      required this.monedas,
      required this.mejora1V1,
      required this.mejora1V2,
      required this.mejora1V3,
      required this.contador1});

  int getId() {
    return this.id;
  }

  int getContador1() {
    return this.contador1;
  }

  int getMonedas() {
    return this.monedas;
  }

  int getMonstruo() {
    return this.monstruo;
  }

  int getMundo() {
    return this.mundo;
  }

  int getMejora1V1() {
    return this.mejora1V1;
  }

  int getMejora1V2() {
    return this.mejora1V2;
  }

  int getMejora1V3() {
    return this.mejora1V3;
  }
}
