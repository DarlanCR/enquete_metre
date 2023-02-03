import 'package:dio/dio.dart';
import 'package:enquete/models/enquete_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

class EnqueteController {
  ValueNotifier<List<Enquete>> enquete = ValueNotifier<List<Enquete>>([]);
  final Dio client;

  EnqueteController(this.client);

  getEnquete() async {
    try {
      final response = await client.get('enquete');
      final decodeResponse = response.data as List;
      enquete.value = decodeResponse.map((e) => Enquete.fromMap(e)).toList();
      await Future.delayed(const Duration(seconds: 1));
    } finally {}
  }
}
