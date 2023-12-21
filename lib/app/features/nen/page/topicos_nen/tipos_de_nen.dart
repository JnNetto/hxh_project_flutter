import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/config_screen.dart';
import '../../controller/nen_controller.dart';

class TiposDeNen extends StatefulWidget{
  final NenController controller;

  const TiposDeNen({Key? key, required this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TiposDeNenState();
}

class _TiposDeNenState extends State<TiposDeNen>{
  late NenController _controller;

  @override
  void initState() {
   super.initState();
    _controller = widget.controller;
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _controller.getNenContent(titulo: "Tipos de Nen");
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Tipos de Nen',
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
                          const SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: isHorizontal ? MediaQuery.of(context).size.height * .8: MediaQuery.of(context).size.height*.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(                            
                              image: ExactAssetImage(conteudo.images[0]),
                            ),
                          ),
                          ),
                          const SizedBox(height: 5,),
                          Text(conteudo.content[1], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 30,),
                          Text(conteudo.content[2], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: isHorizontal ? MediaQuery.of(context).size.height * .8: MediaQuery.of(context).size.height*.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(                            
                              image: ExactAssetImage(conteudo.images[1]),
                            ),
                          ),
                          ),
                          const SizedBox(height: 5,),
                          Text(conteudo.content[3], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 30,),
                          Text(conteudo.content[4], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: isHorizontal ? MediaQuery.of(context).size.height * .8: MediaQuery.of(context).size.height*.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(                            
                              image: ExactAssetImage(conteudo.images[2]),
                            ),
                          ),
                          ),
                          const SizedBox(height: 5,),
                          Text(conteudo.content[5], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 30,),
                          Text(conteudo.content[6], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: isHorizontal ? MediaQuery.of(context).size.height * .8: MediaQuery.of(context).size.height*.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(                            
                              image: ExactAssetImage(conteudo.images[3]),
                            ),
                          ),
                          ),
                          const SizedBox(height: 5,),
                          Text(conteudo.content[7], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 30,),
                          Text(conteudo.content[8], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: isHorizontal ? MediaQuery.of(context).size.height * .8: MediaQuery.of(context).size.height*.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(                            
                              image: ExactAssetImage(conteudo.images[4]),
                            ),
                          ),
                          ),
                          const SizedBox(height: 5,),
                          Text(conteudo.content[9], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 30,),
                          Text(conteudo.content[10], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
                          const SizedBox(height: 5,),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: isHorizontal ? MediaQuery.of(context).size.height * .8: MediaQuery.of(context).size.height*.3,
                            decoration: BoxDecoration(
                              image: DecorationImage(                            
                              image: ExactAssetImage(conteudo.images[5]),
                            ),
                          ),
                          ),
                          const SizedBox(height: 5,),
                          Text(conteudo.content[11], style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontSize: fontSize),),
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