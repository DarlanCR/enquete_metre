// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:enquete/controllers/enquete_controller.dart';
import 'package:enquete/dio/dio_config.dart';
import 'package:enquete/models/resposta_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RespostaController {
  final EnqueteController _controller = Modular.get();
  final ApiService client;

  RespostaController(this.client);
  postResposta(List<Resposta> enquete) async {
    var data = enquete.map((e) => e.toMap()).toList();
    Map dataMap = {'data': data};

    try {
      _controller.isLoad.value = true;
      await client.dio.post('/enquete', data: dataMap);
      print(jsonEncode(enquete));
    } catch (e) {
      print(e);
    } finally {
      _controller.isLoad.value = false;
    }
  }
}
