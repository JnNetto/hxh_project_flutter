import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/config_screen.dart';
import '../../controller/nen_controller.dart';

class TreinamentosDoNen extends StatefulWidget {
  final NenController controller;

  const TreinamentosDoNen({Key? key, required this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _TreinamentosDoNenState();
}

class _TreinamentosDoNenState extends State<TreinamentosDoNen> {
  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  Future<void> _initializeData() async {
    await widget.controller
        .getNenContent(titulo: "Tipos de treinamento do Nen");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Tipos de treinamento do Nen',
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
                  double fontSubTitleSize = 19.5;
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

                  Widget subTitle(int number) {
                    return Text(
                      conteudo.titulos[number],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSubTitleSize,
                          fontFamily: 'SM'),
                    );
                  }

                  Widget image(int number) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: isHorizontal
                          ? MediaQuery.of(context).size.height * .8
                          : MediaQuery.of(context).size.height * .3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: ExactAssetImage(conteudo.images[number]),
                        ),
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
                          text(0),
                          const SizedBox(
                            height: 30,
                          ),
                          title(1),
                          const SizedBox(
                            height: 10,
                          ),
                          text(1),
                          const SizedBox(
                            height: 30,
                          ),
                          title(2),
                          const SizedBox(
                            height: 10,
                          ),
                          text(2),
                          const SizedBox(
                            height: 30,
                          ),
                          subTitle(3),
                          const SizedBox(
                            height: 10,
                          ),
                          text(3),
                          const SizedBox(
                            height: 30,
                          ),
                          subTitle(4),
                          const SizedBox(
                            height: 10,
                          ),
                          text(4),
                          const SizedBox(
                            height: 30,
                          ),
                          subTitle(5),
                          const SizedBox(
                            height: 10,
                          ),
                          text(5),
                          const SizedBox(
                            height: 30,
                          ),
                          subTitle(6),
                          const SizedBox(
                            height: 10,
                          ),
                          text(6),
                          const SizedBox(
                            height: 30,
                          ),
                          title(7),
                          const SizedBox(
                            height: 10,
                          ),
                          text(7),
                          const SizedBox(
                            height: 30,
                          ),
                          subTitle(8),
                          const SizedBox(
                            height: 10,
                          ),
                          text(8),
                          const SizedBox(
                            height: 7,
                          ),
                          image(0),
                          const SizedBox(
                            height: 30,
                          ),
                          subTitle(9),
                          const SizedBox(
                            height: 10,
                          ),
                          text(9),
                          const SizedBox(
                            height: 7,
                          ),
                          image(1),
                          const SizedBox(
                            height: 30,
                          ),
                          subTitle(10),
                          const SizedBox(
                            height: 10,
                          ),
                          text(10),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: isHorizontal
                                  ? constraints.maxHeight
                                  : constraints.maxHeight * .3,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: true,
                            ),
                            items: [2, 3].map((imagens) {
                              return image(imagens);
                            }).toList(),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          title(11),
                          const SizedBox(
                            height: 10,
                          ),
                          text(11),
                          const SizedBox(
                            height: 30,
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
