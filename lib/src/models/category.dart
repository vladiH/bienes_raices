class Category {
  final int id_categoria;
  final String categoria;
  final bool estado;
  final int id_categoria_padre;
  Category(
      this.id_categoria, this.categoria, this.estado, this.id_categoria_padre);
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(json['id_categoria'], json['categoria'], json['estado'],
        json['id_categoria_padre']);
  }
}
