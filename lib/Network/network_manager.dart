import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:formazione_flutter/Network/dio_client.dart';
import 'package:formazione_flutter/Response/artist_collection_response.dart';
import 'package:formazione_flutter/Response/example_response.dart';

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
    try {
      final response = await _dioClient.dio.get(
          endpoint, options: Options(responseType: ResponseType.json));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.data);
        print("JSON DATA: $jsonData");
        return ArtistCollectionResponse.fromJson(jsonData);
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (error) {
      DioException dioError = error as DioException;

      // Per gestire eventuali errori bloccanti
      if (dioError.response?.statusCode == 404 || dioError.response?.statusCode == 403) {
        return ArtistCollectionResponse();
      } else {
        throw Exception(dioError.message);
      }
    }
  }
}