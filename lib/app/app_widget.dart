import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hxh/app/core/utils/background_music.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    BackgroundMusicPlayer.initialize();
    WidgetsBinding.instance.addObserver(this);
  }

  void _startTimer() {
    const duration = Duration(seconds: 5);
    _timer = Timer.periodic(duration, (timer) {
      if (mounted) {
        _resetSystemUI();
      } else {
        timer.cancel();
      }
    });
  }

  void _resetSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }
  
  @override
  void dispose() {
    _timer.cancel();
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
        // BackgroundMusicPlayer.pauseBackgroundMusic();
        break;
      case AppLifecycleState.resumed:
        BackgroundMusicPlayer.resumeBackgroundMusic();
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, 
          statusBarIconBrightness: Brightness.dark, 
          systemNavigationBarColor: Colors.transparent, 
          systemNavigationBarIconBrightness: Brightness.dark,
        ));
        break;
      case AppLifecycleState.detached:
        BackgroundMusicPlayer.stopBackgroundMusic();
        break;
      case AppLifecycleState.hidden:
        // BackgroundMusicPlayer.pauseBackgroundMusic();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    Modular.setNavigatorKey(navigatorKey);
    Modular.setInitialRoute('/splash');
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

