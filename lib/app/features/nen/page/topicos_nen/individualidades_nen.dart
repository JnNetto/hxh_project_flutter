import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/config_screen.dart';
import '../../controller/nen_controller.dart';

class IndividualidadesNen extends StatefulWidget{
  final NenController controller;

  const IndividualidadesNen({Key? key, required this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IndividualidadesNenState();
}

class _IndividualidadesNenState extends State<IndividualidadesNen>{
  late NenController _controller;

  @override
  void initState() {
   super.initState();
    _controller = widget.controller;
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _controller.getNenContent(titulo: "Individualidades do Nen");
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Individualidades do Nen',
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
          child: const Icon(Icons.arrow_back_outlined, color: Colors.white,)
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
      body: LayoutBuilder(
        builder: (context, constraints){
          return Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
              ),
              ...widget.controller.nenContent!.map((conteudo){
                bool isHorizontal = constraints.maxWidth > constraints.maxHeight;
                double fontSize = 17;
                return SingleChildScrollView(
                  child: Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.9,
                      child: Column(
                        children: [
                          const SizedBox(height: 30,),
                          Text(conteudo.content[0], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 10,),
                          Text(conteudo.content[1], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 10,),
                          CarouselSlider(
                            options: CarouselOptions(
                              height: isHorizontal ? constraints.maxHeight * 0.9 : constraints.maxHeight * .5,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              enlargeCenterPage: true,
                            ),
                            items: conteudo.images.map((imagens) {
                              return Stack(
                                children: [
                                  Container(
                                    color: Colors.blueGrey,
                                  ),
                                  Center(
                                    child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: isHorizontal ? MediaQuery.of(context).size.height * .8: MediaQuery.of(context).size.height*.6,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                      image: ExactAssetImage(imagens),
                                    ),
                                    ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList(), 
                            ),
                          const SizedBox(height: 10,),
                          Text(conteudo.content[2], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 10,),
                          Text(conteudo.content[3], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 10,),
                          Text(conteudo.content[4], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 10,),
                          Text(conteudo.content[5], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),                         
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: isHorizontal ? MediaQuery.of(context).size.height * .8: MediaQuery.of(context).size.height*.3,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                              image: ExactAssetImage('assets/images/individualidadesDoNen7.png'),
                            ),
                          ),
                          ),
                          const SizedBox(height: 30,),
                        ],
                      ),
                    )
                  ),
                );
              }).toList()
            ],
          );  
        },
      )
    );
  }
}