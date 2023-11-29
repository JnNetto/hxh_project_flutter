import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    Modular.setNavigatorKey(navigatorKey);
    Modular.setInitialRoute('/home');
    return MaterialApp.router(
      title: 'HxH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xFF1b8853)),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}