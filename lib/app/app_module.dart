import 'package:flutter_modular/flutter_modular.dart';
import 'package:hxh/app/home/home_page.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
    ChildRoute("/home", child:  (context, args) => HomePage()),
  ];
}