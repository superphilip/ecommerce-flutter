import 'dart:convert';

import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;


class ResponseHelper {
  static dynamic tryDecodeBody(String body) {
    if (body.trim().isEmpty) return null;
    try {
      return json.decode(body);
    } catch (e) {
      print('ResponseHelper.tryDecodeBody - JSON decode error: $e');
      return null;
    }
  }

  static Resource<T> handleResponseData<T>(
    dynamic data,
    int statusCode,
    String body,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (statusCode == 200 || statusCode == 201) {
      if (data is Map<String, dynamic>) {
        final parsed = fromJson(data);
        final message = (data['message'] as String?) ?? '';
        return Success(parsed, message);
      } else if (body.trim().isEmpty) {
        return Success(fromJson(<String, dynamic>{}), '');
      } else {
        return Error('Respuesta inesperada del servidor: no devolvió JSON válido. Body: ${body.trim()}');
      }
    }

    if (statusCode == 204) {
      return Success(fromJson(<String, dynamic>{}), '');
    }

    if (data is Map<String, dynamic>) {
      final msgValue = data['message'];
      return Error(listToString(msgValue));
    }

    return Error('Error $statusCode: ${body.trim()}');
  }

  static Future<Resource<List<T>>> requestJsonList<T>(
    Future<http.Response> futureResponse,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await futureResponse;
      final body = response.body;
      final status = response.statusCode;
      final data = tryDecodeBody(body);

      print('${response.request?.method ?? 'REQ'} ${response.request?.url}');
      print('status: $status');
      print('content-type: ${response.headers['content-type']}');
      print('body: $body');

      if (status == 200 || status == 201) {
        if (data is List) {
          final List<T> list = <T>[];
          for (final item in data) {
            if (item is Map<String, dynamic>) {
              list.add(fromJson(item));
            } else {
              return Error('Respuesta inesperada: elementos del array no son objetos JSON');
            }
          }
          return Success(list, '');
        } else if (body.trim().isEmpty) {
          return Success(<T>[], '');
        } else {
          return Error('Respuesta inesperada del servidor: se esperaba un array JSON. Body: ${body.trim()}');
        }
      }

      if (data is Map<String, dynamic>) {
        final msgValue = data['message'];
        return Error(listToString(msgValue));
      }

      return Error('Error $status: ${body.trim()}');
    } catch (e, st) {
      print('ResponseHelper.requestJsonList error: $e\n$st');
      return Error(e.toString());
    }
  }

  /// Nuevo: helper que interpreta la respuesta HTTP como éxito/fallo (bool).
  /// Devuelve Success(true) para status 200/204, y Error(...) en otros casos.
  static Future<Resource<bool>> requestBool(
    Future<http.Response> futureResponse,
  ) async {
    try {
      final response = await futureResponse;
      final body = response.body;
      final status = response.statusCode;
      final data = tryDecodeBody(body);

      print('${response.request?.method ?? 'REQ'} ${response.request?.url}');
      print('status: $status');
      print('content-type: ${response.headers['content-type']}');
      print('body: $body');

      if (status == 200 || status == 204) {
        return Success(true, '');
      }

      if (data is Map<String, dynamic>) {
        final msgValue = data['message'];
        return Error(listToString(msgValue));
      }

      return Error('Error $status: ${body.trim()}');
    } catch (e, st) {
      print('ResponseHelper.requestBool error: $e\n$st');
      return Error(e.toString());
    }
  }

  static Future<Resource<T>> requestJson<T>(
    Future<http.Response> futureResponse,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await futureResponse;
      final body = response.body;
      final data = tryDecodeBody(body);

      print('${response.request?.method ?? 'REQ'} ${response.request?.url}');
      print('status: ${response.statusCode}');
      print('content-type: ${response.headers['content-type']}');
      print('body: $body');

      return handleResponseData<T>(data, response.statusCode, body, fromJson);
    } catch (e, st) {
      print('ResponseHelper.requestJson error: $e\n$st');
      return Error(e.toString());
    }
  }
}