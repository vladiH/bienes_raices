class Image {
  final int id_imagen;
  final String img;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int id_anuncio;
  Image(this.id_imagen, this.img, this.createdAt, this.updatedAt,
      this.id_anuncio);
  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(json['id_imagen'], json['img'], json['createdAt'],
        json['updatedAt'], json['id_anuncio']);
  }
}
