import 'package:flutter/material.dart';
import 'package:hxh/app/features/nen/model/nen_model.dart';

import '../datasource/nen_datasource_impl.dart';

class NenController {
  final NenDataSourceImpl _dataSource;

  NenController(this._dataSource);

  Future<List<Nen>> getNenContent({required String titulo}) async {
    try {
      final List<Nen> nenContent = await _dataSource.getNenContent(titulo: titulo) ?? [];
      return nenContent;
    } catch (e) {
      print('Erro ao buscar o conteúdo Nen: $e');
      return [];
    }
  }

  Future<List<String>> getNenTitles() async {
    try {
      List<String> titlesNen = await _dataSource.getNenTitles() ?? [];
      return titlesNen;
    } catch (e) {
      print('Erro ao buscar os títulos do Nen: $e');
      throw Exception('Erro ao buscar os títulos do Nen');
    }
  }
}