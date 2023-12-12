import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:stroke_text/stroke_text.dart';
import '../core/utils/config_screen.dart';
import '../core/utils/background_music.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePage();
  
}

class _HomePage extends State<HomePage> with WidgetsBindingObserver{

  var verify = true;
  var _isVisible = true;
void _showMenu(BuildContext contextDialog, double maxHeight, double maxWidth) {
  showDialog(
    context: contextDialog,
    builder: (BuildContext contextDialog) {
      return OrientationBuilder(
        builder: (context, orientation) {
        
          double contentWidth = orientation == Orientation.landscape ? maxWidth * 0.2 : maxWidth * 0.5;
          double contentHeight = orientation == Orientation.landscape ? maxHeight * 0.9 : maxHeight * 0.5;
          double fontSizeButtom = orientation == Orientation.landscape ? maxWidth * 0.013 : maxWidth * 0.03;
          double fontSize = orientation == Orientation.landscape ? maxWidth * 0.025 : maxWidth * 0.06;
          
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
                        top: constraints.maxHeight * 0.47,
                        left: constraints.maxWidth * 0.2,
                        right: constraints.maxWidth * 0.2,
                        bottom: constraints.maxHeight * 0.45,
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
                            verify = true;
                            Modular.to.pushNamed("/nenPage");
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
    BackgroundMusicPlayer.loadMusic(0);
    super.initState();
    BackgroundMusicPlayer.playBackgroundMusic(0);
    Timer.periodic(const Duration(milliseconds: 500),(timer){
      setState(() {
        _isVisible = !_isVisible;
      });
    });
    WidgetsBinding.instance.addObserver(this);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return const SettingsDialog();
              },
            );
          },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: const Color.fromARGB(0, 28, 73, 5),
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
              color: Colors.black,
            ),
            Container(
              decoration: const BoxDecoration(
              image: DecorationImage(
              fit: BoxFit.cover,
              image: ExactAssetImage('assets/images/fundo2.png'),
            ),
          ),
            ),
            Visibility(
              visible: verify,
              child: GestureDetector(
                onTap:() {
                  _showMenu(context, constrants.maxHeight, constrants.maxWidth);
                  verify = false;
                  },
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
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (!verify) {
      Navigator.of(context).pop();
      setState(() {
        verify = true;
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}