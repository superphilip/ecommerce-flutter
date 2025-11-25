import 'dart:convert';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/databaseServices/AbstractHttpClient.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class HttpClientImpl extends AbstractHttpClient {
  final SharedPref sharedPref;
  final String _apiBaseUrl = ApiConfig.API_ECOMMERCE;
  final Map<String, String> _jsonHeaders = {'Content-Type': 'application/json'};

  HttpClientImpl(this.sharedPref);

  @override
  Future<Resource<T>> deleteData<T>({
        required String path,
        required T Function(Map<String, dynamic>) fromJson,
    }) async {
        try {
            Uri url = Uri.http(_apiBaseUrl, path);
            String token = await getSessionToken();

            final response = await http.delete(url, headers: {'Authorization': token});
            final data = json.decode(response.body);

            if (response.statusCode == 200 || response.statusCode == 204) {
                T parsedResponse = fromJson(data);
                final message = data['message'] is String ? data['message'] : '';
                return Success(parsedResponse, message);
            }

            return Error(listToString(data['message']));
        } catch (e) {
            print('Error en $path: $e');
            return Error(e.toString());
        }
    }

  @override
  Future<Resource<T>> getData<T>({
        required String path,
        Map<String, String>? queryParameters,
        required T Function(Map<String, dynamic>) fromJson,
    }) async {
        try {
            Uri url = Uri.http(_apiBaseUrl, path, queryParameters);
            String token = await getSessionToken();

            final response = await http.get(url, headers: {'Authorization': token});
            final data = json.decode(response.body);

            if (response.statusCode == 200 || response.statusCode == 201) {
                T parsedResponse = fromJson(data);
                final message = data['message'] is String ? data['message'] : '';
                return Success(parsedResponse, message);
            }

            return Error(listToString(data['message']));
        } catch (e) {
            print('Error en $path: $e');
            return Error(e.toString());
        }
    }

  @override
  Future<String> getSessionToken() async {
    try {
      final userSession = await sharedPref.read('user');
      if (userSession != null) {
        AuthResponse authResponse = AuthResponse.fromJson(userSession);
        return authResponse.token ?? '';
      }
      return '';
    } catch (e) {
      print('Error al obtener token de sesión: $e');
      return '';
    }
  }

  @override
  Future<Resource<T>> postData<T>({
    required String path,
    required Map<String, dynamic> bodyParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      Uri url = Uri.http(_apiBaseUrl, path);
      String body = json.encode(bodyParameters);
      String token = await getSessionToken();

      final response = await http.post(
        url,
        headers: {'Authorization': token, ..._jsonHeaders},
        body: body,
      );
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        T parsedResponse = fromJson(data);
        final message = data['message'] is String ? data['message'] : '';
        return Success(parsedResponse, message);
      }

      return Error(listToString(data['message']));
    } catch (e) {
      print('Error en $path: $e');
      return Error(e.toString());
    }
  }

  @override
  Future<Resource<T>> putData<T>({
        required String path,
        required Map<String, dynamic> bodyParameters,
        required T Function(Map<String, dynamic>) fromJson,
    }) async {
        try {
            Uri url = Uri.http(_apiBaseUrl, path);
            String body = json.encode(bodyParameters);
            String token = await getSessionToken();

            final response = await http.put(url, headers: {'Authorization': token, ..._jsonHeaders}, body: body);
            final data = json.decode(response.body);

            if (response.statusCode == 200 || response.statusCode == 201) {
                T parsedResponse = fromJson(data);
                final message = data['message'] is String ? data['message'] : '';
                return Success(parsedResponse, message);
            }

            return Error(listToString(data['message']));
        } catch (e) {
            print('Error en $path: $e');
            return Error(e.toString());
        }
    }
}
