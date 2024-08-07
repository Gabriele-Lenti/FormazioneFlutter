import 'package:dio/dio.dart';

class DioClient {

  String baseUrl = "https://itunes.apple.com";
  String loginUrl = "https://dummyjson.com";
  final dio = Dio(
      BaseOptions(
        contentType: Headers.textPlainContentType
      )
  );

  DioClient() {
    configureDio();
  }

  void configureDio() {

    dio.options.baseUrl = baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 30);
    dio.options.receiveTimeout = const Duration(seconds: 30);

  }

  void updateBaseUrl(bool isLogin){
    dio.options.baseUrl = isLogin ? loginUrl : baseUrl;
  }

  String getBaseUrl() {
    return dio.options.baseUrl;
  }
}