import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stroke_text/stroke_text.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  State<StatefulWidget> createState() => _HomePage();
  
}

class _HomePage extends State<HomePage>{
  var verify = true;
  var _isVisible = true;

  @override
  void initState() {
    super.initState();
    
    // Inicia um temporizador para alternar a visibilidade do texto
    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        _isVisible = !_isVisible;
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                onTap:() {verify = false;},
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
            Visibility(
              visible: !verify,
              child: Center(
                child: Container(
                  width: constrants.maxWidth * .3,
                  height: constrants.maxHeight * .8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                    image: ExactAssetImage('assets/images/fundoMenu.png'),
                  ),
                ),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton(
                        onPressed: (){verify = true;}, 
                        child: const Icon(Icons.arrow_back)),
                    )
                  ],
                ),
              ),
            ))
          ],
        );
      }),
    );
  }
}