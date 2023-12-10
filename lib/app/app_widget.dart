import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hxh/app/core/utils/background_music.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    BackgroundMusicPlayer.initialize();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    BackgroundMusicPlayer.disposeBackgroundMusic();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.inactive:
        BackgroundMusicPlayer.pauseBackgroundMusic();
        break;
      case AppLifecycleState.paused:
        BackgroundMusicPlayer.pauseBackgroundMusic();
        break;
      case AppLifecycleState.resumed:
        BackgroundMusicPlayer.resumeBackgroundMusic();
        break;
      case AppLifecycleState.detached:
        BackgroundMusicPlayer.stopBackgroundMusic();
        break;
      case AppLifecycleState.hidden:
        BackgroundMusicPlayer.pauseBackgroundMusic();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    Modular.setNavigatorKey(navigatorKey);
    Modular.setInitialRoute('/home');
    return MaterialApp.router(
      title: 'HxH',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFF1b8853),
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
