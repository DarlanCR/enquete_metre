import 'package:enquete/models/enquete_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EnqueteController {
  ValueNotifier<List<Enquete>> enquete = ValueNotifier<List<Enquete>>([]);
  ValueNotifier<bool> isLoad = ValueNotifier<bool>(false);

  getEnquete() async {
    final client = http.Client();
    try {
      isLoad.value = true;
      final response = await client
          .get(Uri.parse('http://localhost:8080/app/services/micro/enquete'));
      final decodeResponse = jsonDecode(response.body) as List;
      enquete.value = decodeResponse.map((e) => Enquete.fromMap(e)).toList();
      await Future.delayed(const Duration(seconds: 2));
    } finally {
      client.close();
      isLoad.value = false;
    }
  }

  postEnquete(
      int idEnquete, int idEnqueteQuestao, String resposta, int nota) async {
    final client = http.Client();
    try {
      final response = await client.post(
          Uri.parse('http://localhost:8080/app/services/micro/enquete'),
          body: {
            'idEnquete': idEnquete,
            'idEnqueteQuestao': idEnqueteQuestao,
            'resposta': resposta,
            'nota': nota
          });
      final encodeResponse = jsonEncode(response.body) as List;
      enquete.value = encodeResponse.map((e) => Enquete.fromMap(e)).toList();
      print(enquete);
    } finally {
      client.close();
    }
  }
}
