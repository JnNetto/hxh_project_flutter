import 'dart:convert';

class Nen {

  final String? titulo;
  final List? content;
  final List? images;

  Nen({required this.titulo, required this.content, required this.images,});

  Nen copyWith({
    String? titulo,
    List? content,
    List? images,
  }) {
    return Nen(
      titulo: titulo ?? this.titulo,
      content: content ?? this.content,
      images: images ?? this.images,
    );
  }


  static Nen? fromJson(String? source) {
    if (source?.isEmpty ?? true) return Nen.fromMap({});
    return Nen.fromMap(json.decode(source!));
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'images': images,
      'titulo': titulo,
    };
  }

  factory Nen.fromMap(Map<String, dynamic> map) {
    return Nen(
      content: map['content'] as List?,
      images: map['images'] as List?,
      titulo: map['titulo'] as String?,
    );
  }
}
