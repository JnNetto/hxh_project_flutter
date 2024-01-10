
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hxh/app/features/nen/datasource/nen_datasource_impl.dart';
import 'package:hxh/app/features/nen/page/nen_page.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/4_principios_nen.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/aprendizado_nen.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/curiosidades.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/individualidades_nen.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/nen_conceitos.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/nen_e_limitacoes.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/propriedades_relacoes_nen.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/quantificacao_do_nen.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/subcategorias_nen.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/tecnicas_avancadas_nen.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/tipos_de_nen.dart';
import 'package:hxh/app/features/nen/page/topicos_nen/treinamentos_nen.dart';
import 'controller/nen_controller.dart';


class NenModule extends Module {
  @override
  List<Bind> get binds => [
    Bind<NenController>((i) => NenController(NenDataSourceImpl()))
  ];
  @override
  List<ModularRoute> get routes => [
    ChildRoute("/", child:  (context, args) => const NenPage(),
    transition: TransitionType.fadeIn,),
    ChildRoute("/nenEAura", child: (context, args) => NenEAura(controller: Modular.get<NenController>()),
    transition: TransitionType.fadeIn),
    ChildRoute("/aprendizadoDoNen", child: (context, args) => AprendizadoNen(controller: Modular.get<NenController>()),
    transition: TransitionType.fadeIn),
    ChildRoute("/propriedadesERelacoesDoNen", child: (context, args) => PropriedadesERelacoesNen(controller: Modular.get<NenController>()), transition: TransitionType.fadeIn,),
    ChildRoute("/os4PrincipiosDoNen", child: (context, args) => QuatroPrincipiosNen(controller: Modular.get<NenController>()),
    transition: TransitionType.fadeIn),
    ChildRoute("/tecnicasAvancadasDoNen", child: (context, args) => TecnicasAvancadasNen(controller: Modular.get<NenController>()), transition: TransitionType.fadeIn,),
    ChildRoute("/individualidadesDoNen", child: (context, args) => IndividualidadesNen(controller: Modular.get<NenController>()),
    transition: TransitionType.fadeIn),
    ChildRoute("/tiposDeNen", child: (context, args) => TiposDeNen(controller: Modular.get<NenController>()),
    transition: TransitionType.fadeIn),
    ChildRoute("/subcategoriasDoNen", child: (context, args) => SubcategoriasDoNen(controller: Modular.get<NenController>()),
    transition: TransitionType.fadeIn),
    ChildRoute("/nenELimitacoes", child: (context, args) => NenELimitacoes(controller: Modular.get<NenController>()),
    transition: TransitionType.fadeIn),
    ChildRoute("/quantificacaoDoNen", child: (context, args) => QuantificacaoDoNen(controller: Modular.get<NenController>()),
    transition: TransitionType.fadeIn),
    ChildRoute("/tiposDeTreinamentoDoNen", child: (context, args) => TreinamentosDoNen(controller: Modular.get<NenController>()),
    transition: TransitionType.fadeIn),
    ChildRoute("/curiosidades", child: (context, args) => CuriosidadesNen(controller: Modular.get<NenController>()),
    transition: TransitionType.fadeIn),
  ];
}