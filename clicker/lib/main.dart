import 'package:clicker/Principales/login.dart';
import 'package:flutter/material.dart';
import 'Principales/clicker.dart';
import 'Principales/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Clicker",
      initialRoute: "/Login",
      routes: {
        "/Clicker": (BuildContext context) => Principal(),
        "/Login": (BuildContext context) => MainPage(),
        "/Register": (BuildContext context) => Register()
      },
    );
  }
}
