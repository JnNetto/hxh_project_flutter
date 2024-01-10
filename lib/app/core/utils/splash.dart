import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget{
  const SplashPage({super.key});
  @override
  State<StatefulWidget> createState() => _SplashPage();
  
}

class _SplashPage extends State<SplashPage>{
@override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.fadeIn(
          backgroundColor: const Color.fromARGB(255, 50, 50, 50),
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/images/logo.png"),
          ),
          asyncNavigationCallback: () async {
            await Future.delayed(const Duration(seconds: 3));
            if (context.mounted) {
              Modular.to.pushNamed("/home");
            }
          },

          
        );
}
}