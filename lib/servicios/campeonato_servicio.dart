import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class CampeonatoServicio {
  final String urlBase = "http://10.0.2.2:8080/api/campeonatos";
  final variablesApp = FlutterSecureStorage();
  
  Future<String?> _getToken() async {
    return await variablesApp.read(key: "token");
  }

  Future<Map<String, String>> _getEncabezado() async {
    final token =await _getToken();
    return {
      "Content-Type": "application/json",
      "Authorization":"Bearer $token"
    };
  }

  Future<dynamic> obtenerCampeonatos() async {
    final url = Uri.parse("$urlBase/listar");

    final encabezado=await _getEncabezado();
    final response = await http.get(url, headers: encabezado);

    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Error al obtener campeonatos');
  }

}