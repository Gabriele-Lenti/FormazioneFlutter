import 'package:dio/dio.dart';
import 'package:formazione_flutter/Network/NetworkManager.dart';

class DioClient {

  final dio = Dio(
      BaseOptions(
        contentType: Headers.textPlainContentType
      )
  );

  DioClient() {
    configureDio();
  }

  void configureDio() {

    dio.options.baseUrl = 'https://jsonplaceholder.typicode.com';
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);

  }

  String getBaseUrl() {
    return dio.options.baseUrl;
  }
}