class Usuario {
  final int id;
  final String nombre;
  final String usuario;
  final String clave;
  final String roles;

  Usuario({
    required this.id,
    required this.usuario,
    required this.nombre,
    required this.clave,
    required this.roles,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json["id"],
      usuario: json["usuario"],
      nombre: json["nombre"],
      clave: json["clave"],
      roles: json["roles"],
    );
  }
}
