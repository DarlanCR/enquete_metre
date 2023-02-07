import 'package:enquete/dio/dio_config.dart';
import 'package:enquete/models/enquete_model.dart';
import 'package:enquete/views/config_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../dio/shared_preference.dart';
//import 'package:http/http.dart' as http;

class EnqueteController {
  ValueNotifier<List<Enquete>> enquete = ValueNotifier<List<Enquete>>([]);
  final ApiService client;
  final SharedPreferencesHelper _cacheHelper = Modular.get();

  EnqueteController(this.client);

  Future<void> loadBaseUrl() async {
    final baseUrl = _cacheHelper.getUrlAPI('baseUrl');
    debugPrint(baseUrl);
    client.dio.options.baseUrl = baseUrl ?? '';
  }

  getEnquete() async {
    try {
      final response = await client.dio.get('enquete');
      final decodeResponse = response.data as List;
      enquete.value = decodeResponse.map((e) => Enquete.fromMap(e)).toList();
      await Future.delayed(const Duration(seconds: 1));
    } catch (e) {
      debugPrint(e.toString());
      const ConfigPage();
    }
  }
}
