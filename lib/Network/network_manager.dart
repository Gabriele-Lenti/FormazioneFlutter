import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:formazione_flutter/Network/dio_client.dart';
import 'package:formazione_flutter/Request/login_request.dart';
import 'package:formazione_flutter/Response/artist_collection_response.dart';
import 'package:formazione_flutter/Response/example_response.dart';

import '../Response/login_response.dart';

class NetworkManager {
  final DioClient _dioClient = DioClient();

  Future<ExampleResponse?> getToDoList() async {
    String url = _dioClient.getBaseUrl();
    String endpoint = '$url/todos/1';
    final response = await _dioClient.dio
        .get(endpoint, options: Options(responseType: ResponseType.json));
    return ExampleResponse.fromJson(response.data);
  }

  Future<ArtistCollectionResponse> getArtistCollection(String artist) async {
    _dioClient.updateBaseUrl(false);
    String url = _dioClient.getBaseUrl();
    String endpoint = '$url/search?term=$artist&limit=20';

    print("Endpoint: ${endpoint}");

    try {
      final response = await _dioClient.dio
          .get(endpoint, options: Options(responseType: ResponseType.json));
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
      if (dioError.response?.statusCode == 404 ||
          dioError.response?.statusCode == 403) {
        return ArtistCollectionResponse();
      } else {
        throw Exception(dioError.message);
      }
    }
  }

  Future<LoginResponse> getUserLoginInfo(
      String username, String password) async {
    _dioClient.updateBaseUrl(true);
    String url = _dioClient.getBaseUrl();
    String endpoint = '$url/auth/login';
    try {
      LoginRequest object = LoginRequest(
          username: username, password: password, expiresInMins: 30);
      final response = await _dioClient.dio.post(endpoint,
          options: Options(responseType: ResponseType.json, headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: jsonEncode(object.toJson()));
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        throw Exception(response.statusCode.toString());
      }
    } catch (error) {
      DioException dioError = error as DioException;
      throw Exception(dioError);
    }
  }
}
