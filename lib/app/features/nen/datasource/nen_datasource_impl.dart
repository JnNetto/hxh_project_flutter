import '../model/nen_model.dart';

class NenDataSourceImpl {
  var listaDeConteudosNen = {
    "Nen e Aura": [
      {
        "titulo": "Título 1",
        "content": [],
        "images": []
      }
    ],
    "Aprendizado do Nen": [
      {
        "titulo": "Título 2",
        "content": [],
        "images": []
      }
    ],
    "Propriedades e relações do Nen": [
      {
        "titulo": "Título 3",
        "content": [],
        "images": []
      }
    ],
    "Os 4 Princípios do Nen": [
      {
        "titulo": "Título 4",
        "content": [],
        "images": []
      }
    ],
    "Técnicas avançadas do Nen": [
      {
        "titulo": "Título 4",
        "content": [],
        "images": []
      }
    ],
    "Individualidades do Nen": [
      {
        "titulo": "Título 4",
        "content": [],
        "images": []
      }
    ],
    "Tipos de Nen": [
      {
        "titulo": "Título 4",
        "content": [],
        "images": []
      }
    ],
    "Subcategorias do Nen": [
      {
        "titulo": "Título 4",
        "content": [],
        "images": []
      }
    ],
    "Nen e limitações": [
      {
        "titulo": "Título 4",
        "content": [],
        "images": []
      }
    ],
    "Quantificação de aura": [
      {
        "titulo": "Título 4",
        "content": [],
        "images": []
      }
    ],
    "Tipos de treinamento do Nen": [
      {
        "titulo": "Título 4",
        "content": [],
        "images": []
      }
    ],
    "Curiosidades": [
      {
        "titulo": "Título 4",
        "content": [],
        "images": []
      }
    ],
    
  };

  Future<List<String>> getNenTitles() async {
    try {
      List<String> titlesNen = listaDeConteudosNen.keys.toList();
      return titlesNen;
    } catch (e) {
      print('Erro ao buscar os títulos do Nen: $e');
      throw Exception('Erro ao buscar os títulos do Nen');
    }
  }

  Future<List<Nen>> getNenContent({required String titulo}) async {
    try {
      return listaDeConteudosNen[titulo]?.map((conteudo) {
        conteudo['id'] = listaDeConteudosNen[titulo]!.indexOf(conteudo).toString();
        return Nen.fromMap(conteudo);
      }).toList() ?? [];
    } catch (e) {
      print('Erro ao buscar o conteúdo Nen: $e');
      throw Exception('Erro ao buscar o conteúdo Nen');
    }
  }
}
