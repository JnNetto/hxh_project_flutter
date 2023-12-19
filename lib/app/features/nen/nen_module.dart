import 'package:flutter_modular/flutter_modular.dart';
import 'package:hxh/app/features/nen/datasource/nen_datasource_impl.dart';
import 'package:hxh/app/features/nen/page/nen_page.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/nen_conceitos.dart';

import 'controller/nen_controller.dart';

class NenModule extends Module {
  @override
  List<Bind> get binds => [
    Bind<NenController>((i) => NenController(NenDataSourceImpl()))
  ];
  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child:  (context, args) => const NenPage()),
    ChildRoute("/nenEAura", child: (context, args) => NenEAura(controller: Modular.get<NenController>()))
  ];
}