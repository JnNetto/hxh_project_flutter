// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/config_screen.dart';
import '../../controller/nen_controller.dart';

class QuatroPrincipiosNen extends StatefulWidget {
  final NenController controller;

  const QuatroPrincipiosNen({Key? key, required this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _QuatroPrincipiosNenState();
}

class _QuatroPrincipiosNenState extends State<QuatroPrincipiosNen> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await widget.controller.getNenContent(titulo: "Os 4 Princípios do Nen");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Os 4 Princípios do Nen",
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
                  bool isHorizontal =
                      constraints.maxWidth > constraints.maxHeight;
                  double fontTitleSize = 22;
                  double fontTextSize = 17;
                  Widget text(int number) {
                    return Text(
                      conteudo.content[number],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontTextSize,
                          fontFamily: 'SM'),
                    );
                  }

                  Widget title(int number) {
                    return Text(
                      conteudo.titulos[number],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontTitleSize,
                          fontFamily: 'SM'),
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
                          text(0),
                          const SizedBox(
                            height: 10,
                          ),
                          title(1),
                          const SizedBox(
                            height: 5,
                          ),
                          text(1),
                          const SizedBox(
                            height: 20,
                          ),
                          title(2),
                          const SizedBox(
                            height: 5,
                          ),
                          text(2),
                          const SizedBox(
                            height: 20,
                          ),
                          title(3),
                          const SizedBox(
                            height: 5,
                          ),
                          text(3),
                          const SizedBox(
                            height: 20,
                          ),
                          title(4),
                          const SizedBox(
                            height: 5,
                          ),
                          text(4),
                          const SizedBox(
                            height: 10,
                          ),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: isHorizontal
                                  ? constraints.maxHeight
                                  : constraints.maxHeight * .3,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: true,
                            ),
                            items: conteudo.images.map((imagens) {
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height: isHorizontal
                                    ? MediaQuery.of(context).size.height * .8
                                    : MediaQuery.of(context).size.height,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: ExactAssetImage(imagens),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
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
