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

  Uri _buildUri(String path, [Map<String, String>? queryParameters]) {
    String base = _apiBaseUrl;
    if (base.startsWith('http://') || base.startsWith('https://')) {
      final trimmedBase = base.endsWith('/') ? base.substring(0, base.length - 1) : base;
      final full = path.startsWith('/') ? '$trimmedBase$path' : '$trimmedBase/$path';
      return Uri.parse(full).replace(queryParameters: queryParameters);
    } else {
      // Si no trae esquema, añade http:// por defecto (ajusta si necesitas https)
      final trimmedBase = base.endsWith('/') ? base.substring(0, base.length - 1) : base;
      final full = 'http://$trimmedBase${path.startsWith('/') ? path : '/$path'}';
      return Uri.parse(full).replace(queryParameters: queryParameters);
    }
  }

  // Construye headers comunes y añade Authorization solo si token no está vacío.
  Future<Map<String, String>> _buildHeaders() async {
    final token = await getSessionToken();
    final headers = <String, String>{
      'Accept': 'application/json',
      ..._jsonHeaders,
    };
    if (token.trim().isNotEmpty) {
      headers['Authorization'] = token;
    }
    return headers;
  }

  // Intenta decodificar body si es JSON, sino devuelve null.
  dynamic _tryDecodeBody(http.Response response) {
    final contentType = response.headers['content-type'] ?? '';
    if (contentType.contains('application/json')) {
      try {
        return json.decode(response.body);
      } catch (e) {
        // JSON malformado
        print('JSON decode error: $e');
        return null;
      }
    }
    return null; // no es JSON
  }

  @override
  Future<Resource<T>> deleteData<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final uri = _buildUri(path);
      final headers = await _buildHeaders();

      final response = await http.delete(uri, headers: headers);

      print('DELETE $uri');
      print('status: ${response.statusCode}');
      print('content-type: ${response.headers['content-type']}');
      print('body: ${response.body}');

      final dynamic data = _tryDecodeBody(response);

      if (response.statusCode == 200 || response.statusCode == 204) {
        // Si no hay body (204) y fromJson no puede manejar {}, intenta retornar Success vacío.
        if (data is Map<String, dynamic>) {
          final T parsed = fromJson(data);
          final message = data['message'] is String ? data['message'] : '';
          return Success(parsed, message);
        } else {
          // No JSON en body pero status success -> devuelve mensaje genérico
          return Success(fromJson(<String, dynamic>{}), '');
        }
      }

      // Error handling
      if (data != null) {
        return Error(listToString(data['message']));
      } else {
        return Error('Error ${response.statusCode}: ${response.body}');
      }
    } catch (e, st) {
      print('Error en deleteData $path: $e\n$st');
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
      final uri = _buildUri(path, queryParameters);
      final headers = await _buildHeaders();

      final response = await http.get(uri, headers: headers);

      print('GET $uri');
      print('status: ${response.statusCode}');
      print('content-type: ${response.headers['content-type']}');
      print('body: ${response.body}');

      final dynamic data = _tryDecodeBody(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data is Map<String, dynamic>) {
          final T parsed = fromJson(data);
          final message = data['message'] is String ? data['message'] : '';
          return Success(parsed, message);
        } else {
          return Error('Respuesta inesperada del servidor: no devolvió JSON');
        }
      }

      if (data != null) {
        return Error(listToString(data['message']));
      } else {
        return Error('Error ${response.statusCode}: ${response.body}');
      }
    } catch (e, st) {
      print('Error en getData $path: $e\n$st');
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
    } catch (e, st) {
      print('Error al obtener token de sesión: $e\n$st');
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
      final uri = _buildUri(path);
      final headers = await _buildHeaders();
      final body = json.encode(bodyParameters);

      final response = await http.post(uri, headers: headers, body: body);

      print('POST $uri');
      print('request-body: $body');
      print('status: ${response.statusCode}');
      print('content-type: ${response.headers['content-type']}');
      print('body: ${response.body}');

      final dynamic data = _tryDecodeBody(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data is Map<String, dynamic>) {
          final T parsed = fromJson(data);
          final message = data['message'] is String ? data['message'] : '';
          return Success(parsed, message);
        } else if (response.body.trim().isEmpty) {
          // 200 con body vacío
          return Success(fromJson(<String, dynamic>{}), '');
        } else {
          return Error('Respuesta inesperada del servidor: no devolvió JSON');
        }
      }

      if (data != null) {
        return Error(listToString(data['message']));
      } else {
        return Error('Error ${response.statusCode}: ${response.body}');
      }
    } catch (e, st) {
      print('Error en postData $path: $e\n$st');
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
      final uri = _buildUri(path);
      final headers = await _buildHeaders();
      final body = json.encode(bodyParameters);

      final response = await http.put(uri, headers: headers, body: body);

      print('PUT $uri');
      print('request-body: $body');
      print('status: ${response.statusCode}');
      print('content-type: ${response.headers['content-type']}');
      print('body: ${response.body}');

      final dynamic data = _tryDecodeBody(response);

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (data is Map<String, dynamic>) {
          final T parsed = fromJson(data);
          final message = data['message'] is String ? data['message'] : '';
          return Success(parsed, message);
        } else if (response.body.trim().isEmpty) {
          return Success(fromJson(<String, dynamic>{}), '');
        } else {
          return Error('Respuesta inesperada del servidor: no devolvió JSON');
        }
      }

      if (data != null) {
        return Error(listToString(data['message']));
      } else {
        return Error('Error ${response.statusCode}: ${response.body}');
      }
    } catch (e, st) {
      print('Error en putData $path: $e\n$st');
      return Error(e.toString());
    }
  }
}