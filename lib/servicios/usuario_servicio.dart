import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UsuarioServicio {
  final String urlBase = "http://10.0.2.2:8080/api/usuarios/";
  final variablesApp = FlutterSecureStorage();

  Future<bool> login(String usuario, String clave) async {
    final url = Uri.parse("$urlBase/validar/$usuario/$clave");
    final servicioUsuario = UsuarioServicio();

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      await variablesApp.write(key: "token", value: data["token"]);
      await variablesApp.write(
        key: "usuario",
        value: jsonDecode(data["usuario"]),
      );

      return true;
    }

    return false;
  }

  Future<String?> getToken() async {
    return await variablesApp.read(key: "token");
  }

  Future<void> logout() async {
    await variablesApp.deleteAll();
  }
}
