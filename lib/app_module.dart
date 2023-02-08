import 'package:enquete/controllers/resposta_controller.dart';
import 'package:enquete/dio/dio_config.dart';
import 'package:enquete/dio/shared_preference.dart';
import 'package:enquete/views/config_page.dart';
import 'package:enquete/views/erro_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/enquete_controller.dart';
import 'views/confirmacao_page.dart';
import 'views/enquete_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => ApiService(i())),
    //
    Bind.lazySingleton((i) => SharedPreferencesHelper()),
    //
    Bind.lazySingleton((i) => EnqueteController(i())),
    Bind.lazySingleton((i) => RespostaController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const EnquetePage()),
    ChildRoute(
      '/confirmacao',
      child: (context, args) => const ConfirmacaoPage(),
    ),
    ChildRoute('/config', child: (context, args) => const ConfigPage()),
    ChildRoute('/erro', child: (context, args) => const ErroPage())
  ];
}
