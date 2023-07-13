// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SnackBars {
  //Listas de snackBars:

  //SnakBar para mostrar el maxima de mejora alcanzado
  void mostrarMaximaMejora(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("Maxima mejora alcnazada")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  //SnackBar para mostrar que se ha comprado una mejora
  void mostrarMejoraComprada(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("Mejora comprada")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  //SnackBar para mostrar que se ha comprado una mejora
  void bolaDeFuegoActivada(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("Bola de fuego activada")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  void bolaDeFuegoDesactivada(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("No se puede utilizar la bola de fuego")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  //SnackBars de bufos
  void bufoEspada(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("La espada ha sido bufada")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  void bufoVeneno(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("El veneno ha sido bufado")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  void bufoArco(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("El arco ha sido bufado")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  //SnackBars de mejoras de escarcha
  void escarchaON(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("Una tormenta ha comenzado")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  void escarchaOF(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("La tormenta ha finaizado")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  //SnackBar de mejora10:
  void venenoV1(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("Veneno de nivel bajo aplicado")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  void venenoV2(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("Veneno de nivel medio aplicado")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  void venenoV3(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("Veneno de nivel alto aplicado")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  void FalloInsertUsuario(BuildContext context) {
    final snb = SnackBar(
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("Error")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  void usuarioNoEncontrado(BuildContext context) {
    final snb = SnackBar(
      backgroundColor: Colors.red,
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("El usuairo no existe")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }

  void usuarioCreado(BuildContext context) {
    final snb = SnackBar(
      backgroundColor: Colors.green,
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("Usuario creado")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }
   void usuarioBorrado(BuildContext context) {
    final snb = SnackBar(
      backgroundColor: Colors.red,
      content: Row(
        children: [
          Icon(Icons.thumb_up),
          SizedBox(
            width: 20,
          ),
          Text("Usuario borrado ")
        ],
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snb);
  }
}
