import 'phone.dart';
import 'image.dart';
import 'category.dart';
import 'ad_detail.dart';

class Ad {
  final int id_anuncio;
  final String titulo;
  final String descripcion;
  final double latitud;
  final double longitud;
  final bool estado;
  final DateTime fecha_inicio;
  final DateTime fecha_fin;
  final double valor_soles;
  final double valor_dolares;
  final String referencia;
  final int id_usuario;
  final int id_categoria;
  final int reacciones;
  final List<Phone> phone;
  final List<Image> images;
  final Category category;
  final List<Category> subCategory;
  final List<AdDetail> adDetail;
  Ad(
    this.id_anuncio,
    this.titulo,
    this.descripcion,
    this.latitud,
    this.longitud,
    this.estado,
    this.fecha_inicio,
    this.fecha_fin,
    this.valor_soles,
    this.valor_dolares,
    this.referencia,
    this.id_usuario,
    this.id_categoria,
    this.reacciones,
    this.phone,
    this.images,
    this.category,
    this.subCategory,
    this.adDetail,
  );

  factory Ad.fromJson(Map<String, dynamic> json) {
    var phones = json['phone'] as List;
    var images = json['images'] as List;
    var subCategory = json['subCategory'] as List;
    var adDetail = json['adDetail'] as List;
    return Ad(
        int.parse(json['id_anuncio']),
        json['titulo'],
        json['descripcion'],
        json['latitud'],
        json['longitud'],
        json['estado'],
        DateTime.parse(json['fecha_inicio']),
        DateTime.parse(json['fecha_fin']),
        json['valor_soles'],
        json['valor_dolares'],
        json['referencia'],
        json['id_usuario'],
        json['id_categoria'],
        json['reacciones'],
        phones.map((e) => Phone.fromJson(e)).toList(),
        images.map((e) => Image.fromJson(e)).toList(),
        json['category'],
        subCategory.map((e) => Category.fromJson(e)).toList(),
        adDetail.map((e) => AdDetail.fromJson(e)).toList());
  }
}
