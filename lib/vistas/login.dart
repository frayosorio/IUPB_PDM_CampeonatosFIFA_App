import 'package:flutter/material.dart';
import 'package:app_campeonatos_fifa/servicios/usuario_servicio.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuarioController = TextEditingController();
  final claveController = TextEditingController();

  final servicioUsuario = UsuarioServicio();

  Future<void> _login() async {
    final logueado = await servicioUsuario.login(
      usuarioController.text,
      claveController.text,
    );
    if (logueado && context.mounted) {
      Navigator.pushReplacementNamed(context, "/inicio");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario o clave no válidos")),
      );
    }
  }

  @override
  Widget build(BuildContext contexto) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: usuarioController,
              decoration: const InputDecoration(labelText: "Usuario:"),
            ),
            TextField(
              controller: claveController,
              decoration: const InputDecoration(labelText: "Clave:"),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _login,
              child: const Text("Iniciar sesión"),
            ),
          ],
        ),
      ),
    );
  }
}
