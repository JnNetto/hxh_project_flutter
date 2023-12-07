import 'package:flutter/material.dart';
import 'package:hxh/app/features/nen/controller/nen_controller.dart';
import 'package:hxh/app/features/nen/model/nen_model.dart';
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
  String pathMusic = "assets/audio/departure.mp3";
  
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
        actions: [
          ElevatedButton(
        onPressed: () {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return SettingsDialog(path: pathMusic,);
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
                    return Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: ExactAssetImage('assets/images/fundo3.png'),
                            ),
                          ),
                        ),
                        Center(
                          child: ListView.builder(
                            itemCount: (nenTitles.length / 2).ceil(),
                            itemBuilder: (context, index) {
                              final int itemIndex = index * 2;
                              return Row(
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
                                            Future<List<Nen>> _nenContent =
                                                _nenController.getNenContent(titulo: nenTitles[itemIndex]);
                                          },
                                          child: Text(
                                            nenTitles[itemIndex],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: fontSize * 0.025
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (itemIndex + 1 < nenTitles.length)
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
                                            Future<List<Nen>> _nenContent = _nenController
                                                .getNenContent(titulo: nenTitles[itemIndex + 1]);
                                          },
                                          child: Text(
                                            nenTitles[itemIndex + 1],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: fontSize * 0.025
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
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
