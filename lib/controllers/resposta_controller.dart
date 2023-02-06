// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:enquete/dio/dio_config.dart';
import 'package:enquete/models/resposta_model.dart';

class RespostaController {
  final ApiService client;

  RespostaController(this.client);
  postResposta(List<Resposta> enquete) async {
    var data = enquete.map((e) => e.toMap()).toList();
    Map dataMap = {'data': data};

    try {
      await client.dio.post('', data: dataMap);
      print(jsonEncode(enquete));
    } catch (e) {
      print(e);
    }
  }
}
