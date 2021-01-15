class Roles {
  final int id_rol;
  final String rol;
  Roles(this.id_rol, this.rol);
  factory Roles.fromJson(Map<String, dynamic> json) {
    return Roles(json['id_rol'], json['rol']);
  }
}
