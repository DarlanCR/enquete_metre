import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:enquete/dio/dio_config.dart';
import 'package:enquete/models/resposta_model.dart';

class RespostaController {
  postResposta(List<Resposta> enquete) async {
    final client = Dio(DioClient.options);
    var data = enquete.map((e) => e.toMap()).toList();
    Map dataMap = {'data': data};

    try {
      await client.post('', data: dataMap);
      print(jsonEncode(enquete));
    } catch (e) {
      print(e);
    } finally {
      client.close();
    }
  }
}
