class Area {
  final int id_area;
  final List<double> latitud;
  final List<double> longitud;
  final int id_anuncio;
  Area(this.id_area, this.latitud, this.longitud, this.id_anuncio);
  factory Area.fromJson(Map<String, dynamic> json) {
    return Area(
        json['id_area'], json['latitud'], json['longitud'], json['id_anuncio']);
  }
}
