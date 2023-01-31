import 'package:dio/dio.dart';

class DioClient {
  static final BaseOptions options = BaseOptions(
    baseUrl: 'http://192.168.100.8:8080/app/services/micro/enquete',
    connectTimeout: 10000,
    headers: {Headers.contentTypeHeader: 'application/json'},
  );
}
