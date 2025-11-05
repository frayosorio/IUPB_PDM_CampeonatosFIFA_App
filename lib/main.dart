import 'package:app_campeonatos_fifa/vistas/inicio.dart';
import 'package:app_campeonatos_fifa/vistas/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campeonatos FIFA App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: "/login",
      routes: {
        "/login": (contexto) => const Login(),
        "/inicio": (contexto) => const Inicio(),
      }
    );
  }
}

