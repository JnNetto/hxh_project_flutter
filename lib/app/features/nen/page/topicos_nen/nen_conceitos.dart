import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/utils/config_screen.dart';
import '../../controller/nen_controller.dart';

class NenEAura extends StatefulWidget{
  final NenController controller;

  const NenEAura({Key? key, required this.controller}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NenEAuraState();
}

class _NenEAuraState extends State<NenEAura>{
  late NenController _controller;

  @override
  void initState() {
   super.initState();
    _controller = widget.controller;
    _initializeData();
  }

  Future<void> _initializeData() async {
    await _controller.getNenContent(titulo: "Nen e Aura");
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Nen e Aura',
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
                double fontTextSize = 17;
                Widget text(int number){
                  return Text(conteudo.content[number], style: TextStyle(color: Colors.white, fontSize: fontTextSize, fontFamily: 'SM'),);
                  }
                Widget image(int number){
                  return Container(
                          width: MediaQuery.of(context).size.width,
                          height: isHorizontal ? MediaQuery.of(context).size.height * .8: MediaQuery.of(context).size.height*.3,
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
                          const SizedBox(height: 30,),
                          text(0),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: text(1),
                              ),
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  conteudo.images[0],
                                  width: 205,
                                  height: 110,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          text(2),
                          const SizedBox(height: 10,),
                          image(1),
                          const SizedBox(height: 10,),
                          text(3),
                          const SizedBox(height: 10,),
                          text(4),
                          const SizedBox(height: 10,),
                          text(5),
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