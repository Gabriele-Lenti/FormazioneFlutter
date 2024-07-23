import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:formazione_flutter/Network/DioClient.dart';
import 'package:formazione_flutter/Response/ArtistCollectionResponse.dart';
import 'package:formazione_flutter/Response/ExampleResponse.dart';

class NetworkManager {

  final DioClient _dioClient = DioClient();

  Future<ExampleResponse?> getToDoList() async {

    String url = _dioClient.getBaseUrl();
    String endpoint = '$url/todos/1';
    final response = await _dioClient.dio.get(endpoint, options: Options(responseType: ResponseType.json));
    return ExampleResponse.fromJson(response.data);
  }

  Future<ArtistCollectionResponse> getArtistCollection(String artist) async {

    String url = _dioClient.getBaseUrl();
    String endpoint = '$url/search?term=$artist&limit=20';
    final response = await _dioClient.dio.get(endpoint, options: Options(responseType: ResponseType.json));
    final jsonData = jsonDecode(response.data);
    print("JSON DATA: $jsonData");
    return ArtistCollectionResponse.fromJson(jsonData);
  }
}