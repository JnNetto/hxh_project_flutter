import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:just_audio/just_audio.dart';
import 'package:stroke_text/stroke_text.dart';
import '../core/utils/config_screen.dart';
import '../core/utils/background_music.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePage();
  
}

class _HomePage extends State<HomePage>{
  var verify = true;
  var _isVisible = true;
  late AudioPlayer player = AudioPlayer()..setAsset("assets/audio/departure.mp3");

void _showCustomDialog(BuildContext contextDialog, double maxHeight, double maxWidth) {
  showDialog(
    context: contextDialog,
    builder: (BuildContext contextDialog) {
      return OrientationBuilder(
        builder: (context, orientation) {
          double contentWidth = orientation == Orientation.landscape ? maxWidth * 0.2 : maxWidth * 0.5;
          double contentHeight = orientation == Orientation.landscape ? maxHeight * 0.75 : maxHeight * 0.5;
          double fontSizeButtom = orientation == Orientation.landscape ? maxWidth * 0.013 : maxWidth * 0.03;
          double fontSize = orientation == Orientation.landscape ? maxWidth * 0.02 : maxWidth * 0.06;
          
          return AlertDialog(
            backgroundColor: Colors.transparent, 
            content: Container(
              width: contentWidth,
              height: contentHeight,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/fundoMenu.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: <Widget>[
                      Positioned(
                        top: constraints.maxHeight * 0.48,
                        left: constraints.maxWidth * 0.2,
                        right: constraints.maxWidth * 0.2,
                        bottom: constraints.maxHeight * 0.44,
                        child: Center(
                          child: Text(
                            'Bem Vindo!',
                            style: TextStyle(
                              fontSize: fontSize,
                              fontFamily: "SF"
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: constraints.maxHeight * 0.74,
                        left: constraints.maxWidth * 0.05,
                        right: constraints.maxWidth * 0.05,
                        bottom: constraints.maxHeight * 0.21,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white)
                          ),
                          child: Text(
                            'Conhecer sobre o Nen', 
                            style: TextStyle(
                              fontSize: fontSizeButtom,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      );
    },
  ).then((value) {
    setState(() {
      verify = true;
      // player.stop(); 
    });
  });
}

  @override
  void initState() {
    // BackgroundMusicPlayer.playBackgroundMusic(player, 'assets/audio/departure.mp3');
    super.initState();
    
    Timer.periodic(const Duration(milliseconds: 500),(timer){
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showDialog(
                context: context,
                builder: (BuildContext context) {
                  return ConfigPage.buildSettingsDialog(context);
                },
              );},
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Color.fromARGB(0, 28, 73, 5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), 
              ),
            ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), 
              ),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
              ),
            ),),
      body: LayoutBuilder(builder: (context, constrants){
        return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
              image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/images/fundoHome.png'),
            ),
          ),
            ),
            Visibility(
              visible: verify,
              child: GestureDetector(
                onTap:() {
                  _showCustomDialog(context, constrants.maxHeight, constrants.maxWidth);
                  verify = false;
                  BackgroundMusicPlayer.playBackgroundMusic(player, 'assets/audio/departure.mp3');},
                child: Padding(
                  padding: EdgeInsets.only(top: constrants.maxHeight * 0.8),
                  child: Center(
                    child: AnimatedOpacity(
                      opacity: _isVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: const StrokeText(
                        text: 'Toque para continuar',
                        textStyle: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                        ),
                        strokeColor: Colors.black,
                        strokeWidth: 5,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
  @override
  void dispose() {
    BackgroundMusicPlayer.stopBackgroundMusic(player);
    super.dispose();
  }
}