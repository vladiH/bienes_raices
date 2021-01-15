import 'person.dart';
import 'roles.dart';

class User {
  // ignore: non_constant_identifier_names
  final int id_usuario;
  // ignore: non_constant_identifier_names
  final int id_rol;
  final String password;
  final String email;
  final bool estado;
  // ignore: non_constant_identifier_names
  final DateTime fecha_creacion;
  // ignore: non_constant_identifier_names
  final DateTime fecha_actualizacion;
  // ignore: non_constant_identifier_names
  final String email_token;
  final Roles role;
  final Person persona;
  User(
      this.id_usuario,
      this.id_rol,
      this.password,
      this.email,
      this.estado,
      this.fecha_creacion,
      this.fecha_actualizacion,
      this.email_token,
      this.role,
      this.persona);
  String get getPassword => password;
  String get getEmail => email;
  Map<dynamic, dynamic> get usuarios {
    return {};
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        int.parse(json['id_usuario']),
        json['id_rol'],
        json['password'],
        json['email'],
        json['estado'],
        DateTime.parse(json['fecha_creacion']),
        DateTime.parse(json['fecha_actualizacion']),
        json['email_token'],
        json['role'] != null ? Roles.fromJson(json['role']) : null,
        json['persona'] != null ? Person.fromJson(json['persona']) : null);
  }
}
