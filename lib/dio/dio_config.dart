import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* class DioClient {
  static final BaseOptions options = BaseOptions(
    baseUrl: 'http://192.168.100.10:8080/app/services/micro/enquete',
    connectTimeout: 10000,
    headers: {Headers.contentTypeHeader: 'application/json'},
  );
  
} */

class ApiService {
  /*  static final ApiService _singleton = ApiService._internal(); */
  static final Dio _dio = Dio();
  final SharedPreferences prefs;

  ApiService(this.prefs) {
    _dio.options.connectTimeout = 10000;
    _initBaseUrl();
  }

  Future<void> _initBaseUrl() async {
    final baseUrl = prefs.getString('baseUrl');
    if (baseUrl != null) {
      _dio.options.baseUrl = baseUrl;
    }
  }

  Future<void> setBaseUrl(String url) async {
    print(url);
    await prefs.setString('baseUrl', url);
    _dio.options.baseUrl = url;
  }

  Dio get dio {
    return _dio;
  }
}
