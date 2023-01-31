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
      final response = await client.get(
          Uri.parse('http://192.168.100.8:8080/app/services/micro/enquete'));
      final decodeResponse = jsonDecode(response.body) as List;
      enquete.value = decodeResponse.map((e) => Enquete.fromMap(e)).toList();
      await Future.delayed(const Duration(seconds: 1));
    } finally {
      client.close();
      isLoad.value = false;
    }
  }
}
