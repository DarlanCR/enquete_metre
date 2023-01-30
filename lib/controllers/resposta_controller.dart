import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RespostaController {
  ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);

  postResposta(
      int idEnquete, int idEnqueteQuestao, String? resposta, int? nota) async {
    Map<String, dynamic> respostaEnquete = {
      'idEnquete': idEnquete,
      'idEnqueteQuestao': idEnqueteQuestao,
      'resposta': resposta,
      'nota': nota
    };

    List<Map<String, dynamic>> list = [respostaEnquete];
    final client = http.Client();
    var jsonData = jsonEncode(list);

    try {
      isLoad.value = true;
      final response = await client.post(
          Uri.parse('http://localhost:8080/app/services/micro/enquete'),
          body: {jsonData});
      print(jsonData);
      await Future.delayed(const Duration(seconds: 2));
    } finally {
      client.close();
      isLoad.value = false;
    }
  }
}
