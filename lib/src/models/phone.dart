class Phone {
  final int id_telefono;
  final bool principal;
  final String numero;
  final int id_anuncio;
  Phone(this.id_telefono, this.principal, this.numero, this.id_anuncio);
  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(json['id_telefono'], json['principal'], json['numero'],
        json['id_anuncio']);
  }
}
