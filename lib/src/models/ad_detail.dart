class AdDetail {
  final int id_detalle_anuncio;
  final String descripcion;
  final int id_anuncio;
  final int id_detalle_anuncio_padre;
  AdDetail(this.id_detalle_anuncio, this.descripcion, this.id_anuncio,
      this.id_detalle_anuncio_padre);
  factory AdDetail.fromJson(Map<String, dynamic> json) {
    return AdDetail(json['id_detalle_anuncio'], json['descripcion'],
        json['id_anuncio'], json['id_detalle_anuncio_padre']);
  }
}
