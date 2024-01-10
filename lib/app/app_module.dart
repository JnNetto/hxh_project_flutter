
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hxh/app/features/nen/nen_module.dart';
import 'package:hxh/app/home/home_page.dart';
import 'package:hxh/app/core/utils/splash.dart';

class AppModule extends Module {

  @override
  List<ModularRoute> get routes => [ 
    ModuleRoute("/nenPage", module: NenModule(),),
    ChildRoute("/splash", child:  (context, args) => const SplashPage(),
    transition: TransitionType.fadeIn),
    ChildRoute("/home", child:  (context, args) => const HomePage(),
    transition: TransitionType.fadeIn),
  ];
}