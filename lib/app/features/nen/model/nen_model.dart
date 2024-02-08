class Nen {
  final List titulos;
  final List content;
  final List images;

  Nen({
    required this.titulos,
    required this.content,
    required this.images,
  });

  factory Nen.fromMap(Map<String, dynamic> map) {
    return Nen(
      content: map['content'] as List,
      images: map['images'] as List,
      titulos: map['titulos'] as List,
    );
  }
}
