import 'package:app_campeonatos_fifa/modelos/usuario.dart';

class UsuarioLoginDto {
  final Usuario usuario;
  final String token;

  UsuarioLoginDto({required this.usuario, required this.token});

  factory UsuarioLoginDto.fromJson(Map<String, dynamic> json) {
    return UsuarioLoginDto(usuario: json["usuario"], token: json["token"]);
  }
}
