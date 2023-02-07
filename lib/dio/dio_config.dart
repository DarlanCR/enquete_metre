import 'package:dio/dio.dart';
import 'package:enquete/dio/shared_preference.dart';
import 'package:flutter/foundation.dart';

/* class DioClient {
  static final BaseOptions options = BaseOptions(
    baseUrl: 'http://192.168.100.10:8080/app/services/micro/enquete',
    connectTimeout: 10000,
    headers: {Headers.contentTypeHeader: 'application/json'},
  );
  
} */

class ApiService {
  /*  static final ApiService _singleton = ApiService._internal(); */
  final Dio _dio = Dio();
  final SharedPreferencesHelper _cacheHelper;

  ApiService(this._cacheHelper) {
    _dio.options.connectTimeout = 10000;
    // _initBaseUrl();
  }

  Future<void> setBaseUrl(String url) async {
    debugPrint("Salvando a url: $url");
    await _cacheHelper.setUrlAPI('baseUrl', url).then((value) {
      debugPrint('$value');
      return _dio.options.baseUrl = url;
    }).onError((error, stackTrace) {
      debugPrintStack(stackTrace: stackTrace, label: error.toString());
      return '';
    });
  }

  Dio get dio => _dio;
}
