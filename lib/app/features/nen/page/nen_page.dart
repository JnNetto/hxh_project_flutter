import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hxh/app/features/nen/controller/nen_controller.dart';
import 'package:hxh/app/features/nen/datasource/nen_datasource_impl.dart';

import '../../../core/utils/config_screen.dart';

class NenPage extends StatefulWidget {
  const NenPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NenPageState();
}

class _NenPageState extends State<NenPage> {
  final NenController _nenController = NenController(NenDataSourceImpl());
  late Future<List<String>> _nenTitles;

  String removeDiacritics(String text) {
  return text
      .replaceAll('á', 'a')
      .replaceAll('â', 'a')
      .replaceAll('à', 'a')
      .replaceAll('ã', 'a')
      .replaceAll('é', 'e')
      .replaceAll('ê', 'e')
      .replaceAll('í', 'i')
      .replaceAll('ó', 'o')
      .replaceAll('ô', 'o')
      .replaceAll('õ', 'o')
      .replaceAll('ú', 'u')
      .replaceAll('ü', 'u')
      .replaceAll('ç', 'c')
      ;
}

  String toCamelCase(String text) {
  var textWithouDiacritics = removeDiacritics(text);
  List<String> words = textWithouDiacritics.split(' ');
  String result = '';
  
  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    if (i == 0) {
      result += word.toLowerCase();
    } else {
      result += word[0].toUpperCase() + word.substring(1).toLowerCase();
    }
  }
  return result;
}

  @override
  void initState() {
    super.initState();
    _nenTitles = _nenController.getNenTitles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Nen Page',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: true,
        leading: ElevatedButton(
          onPressed:(){
            Modular.to.pop();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 0, 0, 6))
          ),
          child: const Center(child: Icon(Icons.arrow_back_outlined, color: Colors.white,))
        ),
        actions: [
          ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const SettingsDialog();
              },
            );
          },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: Colors.black,
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
            child: Icon(Icons.settings, color: Colors.white,),
              ),
            ),),
        ],
        backgroundColor: const Color.fromARGB(255, 0, 0, 6),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return LayoutBuilder(
            builder: (context, constraints) {
              bool isHorizontal = constraints.maxWidth > constraints.maxHeight;
              double contentHeight = orientation == Orientation.landscape ? constraints.maxHeight * 2.1 : constraints.maxHeight * 1.2;
              double fontSize = orientation == Orientation.landscape ? constraints.maxHeight * 2.1 : constraints.maxHeight * 0.85;
              return FutureBuilder<List<String>>(
                future: _nenTitles,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || !(snapshot.hasData && snapshot.data!.isNotEmpty)) {
                    return const Center(child: Text('Erro ao carregar dados Nen.'));
                  } else {
                    final List<String> nenTitles = snapshot.data!;
                    List<Widget> rows = [];
                    if(isHorizontal){
                      rows.clear();
                      for (var i = 0; i < nenTitles.length; i += 2) {
                      rows.add(
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: constraints.maxWidth * 0.05),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: constraints.maxWidth * 0.4,
                                  height: contentHeight * 0.05,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      foregroundColor: Colors.black,
                                      backgroundColor: const Color.fromARGB(255, 217, 217, 217),
                                      elevation: 4,
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    ),
                                    onPressed: () {
                                      var way = toCamelCase(nenTitles[i]);
                                      Modular.to.pushNamed("/nenPage/$way");
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        nenTitles[i],
                                        
                                        style: TextStyle(
                                          fontSize: fontSize * 0.025
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            if (i + 1 < nenTitles.length)
                            Padding(
                              padding: EdgeInsets.only(right: constraints.maxWidth * 0.05),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: constraints.maxWidth * 0.4,
                                  height: contentHeight * 0.05,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      backgroundColor: const Color.fromARGB(255, 217, 217, 217),
                                      foregroundColor: Colors.black,
                                      elevation: 4,
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    ),
                                    onPressed: () {
                                      // Future<List<Nen>> _nenContent = _nenController
                                      //     .getNenContent(titulo: nenTitles[i + 1]);
                                      var way = toCamelCase(nenTitles[i + 1]);
                                      Modular.to.pushNamed("/nenPage/$way");
                                    },
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        nenTitles[i + 1],
                                       
                                        style: TextStyle(
                                          fontSize: fontSize * 0.025
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    } else {
                      rows.clear();
                      for (var i = 0; i < nenTitles.length; i++) {
                        rows.add(
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SizedBox(
                              width: constraints.maxWidth * 0.8,
                              height: contentHeight * 0.05,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  foregroundColor: Colors.black,
                                  backgroundColor: const Color.fromARGB(255, 217, 217, 217),
                                  elevation: 4,
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                ),
                                onPressed: () {
                                  // Future<List<Nen>> _nenContent =
                                  //     _nenController.getNenContent(titulo: nenTitles[i]);
                                  var way = toCamelCase(nenTitles[i]);
                                  Modular.to.pushNamed("/nenPage/$way");
                                },
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    nenTitles[i],                                   
                                    style: TextStyle(fontSize: fontSize * 0.025),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    }
        
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                        fit: BoxFit.cover,
                        image: ExactAssetImage('assets/images/fundo3.png'),
                      ),
                    ),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: rows,
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
