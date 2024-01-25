import 'package:hxh/app/features/nen/model/nen_model.dart';

import '../datasource/nen_datasource_impl.dart';

class NenController {
  final NenDataSourceImpl _dataSource;

  NenController(this._dataSource);

  List<Nen>? nenContent;
  setNenContent(List<Nen>? value) => nenContent = value;

  getNenContent({required String titulo}) async {
    try {
      nenContent?.clear();
      setNenContent(await _dataSource.getNenContent(titulo: titulo));
    } catch (e) {
      return [];
    }
  }

  Future<List<String>> getNenTitles() async {
    try {
      List<String> titlesNen = await _dataSource.getNenTitles();
      return titlesNen;
    } catch (e) {
      throw Exception('Erro ao buscar os títulos do Nen');
    }
  }
}
