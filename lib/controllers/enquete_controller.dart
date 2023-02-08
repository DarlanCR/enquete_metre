import 'package:enquete/dio/dio_config.dart';
import 'package:enquete/models/enquete_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../dio/shared_preference.dart';
//import 'package:http/http.dart' as http;

class EnqueteController {
  ValueNotifier<List<Enquete>> enquete = ValueNotifier<List<Enquete>>([]);
  ValueNotifier<bool> isLoad = ValueNotifier<bool>(true);
  ValueNotifier<bool> onError = ValueNotifier<bool>(false);
  final ApiService client;
  final SharedPreferencesHelper _cacheHelper = Modular.get();

  EnqueteController(this.client);

  Future<void> loadBaseUrl() async {
    isLoad.value = true;
    await Future.delayed(const Duration(seconds: 2));
    final baseUrl = _cacheHelper.getUrlAPI('baseUrl');
    debugPrint(baseUrl);
    client.dio.options.baseUrl = baseUrl ?? '';
  }

  getEnquete() async {
    try {
      isLoad.value = true;
      onError.value = false;
      final response = await client.dio.get('enquete');
      final decodeResponse = response.data as List;
      decodeResponse.isEmpty
          ? onError.value = true
          : enquete.value =
              decodeResponse.map((e) => Enquete.fromMap(e)).toList();
    } catch (e) {
      debugPrint(e.toString());
      Modular.to.navigate('/config');
    } finally {
      isLoad.value = false;
    }
  }
}
