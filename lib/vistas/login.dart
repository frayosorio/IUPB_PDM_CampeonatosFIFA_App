import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuarioController = TextEditingController();
  final claveController = TextEditingController();

  Future<void> _login() async {}

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
