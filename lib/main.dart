import 'package:flutter/material.dart';
import 'package:practica_2/src/screens/agregar_nota_screen.dart';
import 'package:practica_2/src/screens/intenciones_screen.dart';
import 'package:practica_2/src/screens/notas_screen.dart';
import 'package:practica_2/src/screens/opcion1_screen.dart';
import 'package:practica_2/src/screens/profile_screen.dart';
import 'package:practica_2/src/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/calPro': (BuildContext context) => CalculadoraPropina(),
        '/intenciones': (BuildContext context) => IntencionesScreen(),
        '/notas': (BuildContext context) => NotasScreen(),
        '/agregarNota': (BuildContext context) => AgregarNotasScreen(),
        '/settProf': (BuildContext context) => ProfileScreenSet()
      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
