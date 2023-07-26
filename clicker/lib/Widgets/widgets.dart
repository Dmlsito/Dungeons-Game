import 'package:flutter/material.dart';

class Widgets {

  Widget improve1Structure(context, alturaPantalla, anchoPantalla, listaMundos, indexImagen, incrementoMejoras, datosJugador, improve) {
    return Container(
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
                    builder: (BuildContext context) {
                      return AlertDialog(
                        contentPadding: EdgeInsets.zero,
                        content: Row(
                          children: [
                            Container(
                              height: alturaPantalla * 0.6,
                              width: anchoPantalla * 0.79,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  fit: BoxFit.fill, image: AssetImage(listaMundos[indexImagen]))),
                                // Container para el texto de explicación sobre el item
                                child: Stack(children: [
                                  Center(child: Container(decoration: BoxDecoration(),
                                    padding:EdgeInsets.all(5),
                                    margin: EdgeInsets.only(top: 10, bottom: 40,),
                                    width: 300,
                                    height: 700,
                                    child: Image.asset("assets/Pergamino.png", fit: BoxFit.cover),),),
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.only(bottom:290),
                                        width:180,
                                        child: Text("Ganas más daño por cada golpe que efectuas contra el enemigo.\nExisten 3 niveles de mejora que se pueden comprar.",
                                        style: TextStyle(fontSize: 18, color: Colors.white, fontFamily: "caps"))),
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
                                      margin: EdgeInsets.only(top: 400, left: 30),
                                      child: Text("Espada", style: TextStyle( fontSize: 40, color: Colors.white,fontFamily: "caps")))
                                      ]),
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                child: Image.asset("assets/iconoAyuda.png", color: Colors.yellowAccent))),
                  Transform(
                    transform: Matrix4.rotationZ(1.56), alignment: Alignment.topCenter,
                    child: Container(color: incrementoMejoras.incremento1Mejora1(datosJugador.mejora1V1),
                            width: 30,
                            height: 10,
                          ),
                                    ),
                  Transform(
                    transform: Matrix4.rotationZ(1.56),
                    alignment: Alignment.topCenter,
                    child: Container(color: incrementoMejoras.incremento2Mejora1(datosJugador.mejora1V2),
                            width: 30,
                            height: 10,
                          ),
                  ),
                  
                  Transform(
                    transform: Matrix4.rotationZ(1.56),
                    alignment: Alignment.topCenter,
                    child: Container(
                      color: incrementoMejoras.incremento3Mejora1(datosJugador.mejora1V3),
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
        child: InkWell(onTap: () {
          improve.mejora1(datosJugador, context);
          },
          ),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/espada1.png"),
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
                    child: Text(improve.precioMejoraGlobal1.toString(),style: TextStyle(color: Colors.white,fontSize: 14))),
                    //Container para mostrar la imagen
                    Container(width: 60, height: 100,
                    child: Image.asset("assets/MonedasPrueba.png"))
                    ]))
    ]));
  }
}