import 'package:flutter_modular/flutter_modular.dart';
import 'package:hxh/app/home/home_page.dart';

import 'features/nen/page/nen_page.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute("/home", child:  (context, args) => const HomePage()),
    ChildRoute("/nenPage", child:  (context, args) => const NenPage()),
    
  ];
}