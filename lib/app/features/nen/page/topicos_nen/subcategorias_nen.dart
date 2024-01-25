import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/config_screen.dart';
import '../../controller/nen_controller.dart';

class SubcategoriasDoNen extends StatefulWidget {
  final NenController controller;

  const SubcategoriasDoNen({Key? key, required this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SubcategoriasDoNenState();
}

class _SubcategoriasDoNenState extends State<SubcategoriasDoNen> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await widget.controller.getNenContent(titulo: "Subcategorias do Nen");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Subcategorias do Nen',
            style: TextStyle(color: Colors.white),
          ),
          automaticallyImplyLeading: true,
          leading: ElevatedButton(
              onPressed: () {
                Modular.to.pop();
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 0, 0, 6))),
              child: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
              )),
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
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: const Color.fromARGB(255, 0, 0, 6),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                ),
                ...(widget.controller.nenContent ?? []).map((conteudo) {
                  double fontTitleSize = 22;
                  double fontTextSize = 17;
                  List<Widget> contentRepeated = [];
                  for (var i = 1; i < conteudo.titulos.length; i++) {
                    contentRepeated.add(
                      Column(
                        children: [
                          Text(
                            conteudo.titulos[i],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fontTitleSize,
                                fontFamily: 'SM'),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            conteudo.content[i],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fontTextSize,
                                fontFamily: 'SM'),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    child: Center(
                        child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            conteudo.content[0],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fontTextSize,
                                fontFamily: 'SM'),
                          ),
                          const SizedBox(height: 30),
                          ...contentRepeated,
                          const SizedBox(
                            height: 30,
                          )
                        ],
                      ),
                    )),
                  );
                }).toList()
              ],
            );
          },
        ));
  }
}
