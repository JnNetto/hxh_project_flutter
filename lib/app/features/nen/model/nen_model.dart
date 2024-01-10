import 'dart:convert';

class Nen {

  final List titulos;
  final List content;
  final List images;

  Nen({required this.titulos, required this.content, required this.images,});

  Nen copyWith({
    List? titulos,
    List? content,
    List? images,
  }) {
    return Nen(
      titulos: titulos ?? this.titulos,
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
      'titulos': titulos,
    };
  }

  factory Nen.fromMap(Map<String, dynamic> map) {
    return Nen(
      content: map['content'] as List,
      images: map['images'] as List,
      titulos: map['titulos'] as List,
    );
  }

}
