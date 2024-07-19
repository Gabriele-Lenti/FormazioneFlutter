import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:formazione_flutter/Network/DioClient.dart';
import 'package:formazione_flutter/Response/ExampleResponse.dart';

class NetworkManager {

  final DioClient _dioClient = DioClient();

  Future<ExampleResponse?> getToDoList() async {

    String url = _dioClient.getBaseUrl();
    String endpoint = '$url/todos/1';
    final response = await _dioClient.dio.get(endpoint, options: Options(responseType: ResponseType.json));
    final jsonData = jsonDecode(response.toString());
    return ExampleResponse.fromJson(jsonData);
  }
}