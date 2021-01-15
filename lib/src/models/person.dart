class Person {
  final int id_usuario;
  final String nombres;
  final String apellidos;
  final String sexo;
  final DateTime fecha_nacimiento;

  Person(this.id_usuario, this.nombres, this.apellidos, this.sexo,
      this.fecha_nacimiento);
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(json['id_usuario'], json['nombres'], json['apellidos'],
        json['sexo'], DateTime.parse(json['fecha_nacimiento']));
  }
}
