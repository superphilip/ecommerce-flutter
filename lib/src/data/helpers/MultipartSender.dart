import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_flutter/src/domain/utils/ListToString.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

/// Responsable de enviar requests multipart (POST/PUT/DELETE/...).
/// Soporta:
/// - files: Map<String, File> (un archivo por campo, backward compatible)
/// - multipleFiles: Map<String, List<File>> (varios archivos con el mismo nombre de campo,
///   por ejemplo 'files[]' -> [file1, file2])
class MultipartSender {
  final http.Client client;

  MultipartSender({http.Client? client}) : client = client ?? http.Client();

  Future<Resource<T>> send<T>({
    required String method,
    required Uri uri,
    required Map<String, String> headers,
    Map<String, String>? fields,
    Map<String, File>? files,
    Map<String, List<File>>? multipleFiles,
    Map<String, String>? fileMimeTypes,
    String defaultFileMimeType = 'image/jpeg',
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    try {
      final request = http.MultipartRequest(method.toUpperCase(), uri);

      
      final filtered = Map<String, String>.from(headers)..remove('Content-Type');
      request.headers.addAll(filtered);

      if (fields != null) request.fields.addAll(fields);

      
      if (multipleFiles != null && multipleFiles.isNotEmpty) {
        for (final entry in multipleFiles.entries) {
          final field = entry.key;
          final list = entry.value;
          for (final f in list) {
            final detected = lookupMimeType(f.path);
            final mime = (fileMimeTypes != null && fileMimeTypes.containsKey(field))
                ? fileMimeTypes[field]!
                : (detected ?? defaultFileMimeType);
            final parts = mime.split('/');
            final multipartFile = await http.MultipartFile.fromPath(
              field,
              f.path,
              contentType: MediaType(parts[0], parts[1]),
            );
            request.files.add(multipartFile);
          }
        }
      }

      
      if (files != null && files.isNotEmpty) {
        for (final entry in files.entries) {
          final field = entry.key;
          final f = entry.value;
          final detected = lookupMimeType(f.path);
          final mime = (fileMimeTypes != null && fileMimeTypes.containsKey(field))
              ? fileMimeTypes[field]!
              : (detected ?? defaultFileMimeType);
          final parts = mime.split('/');
          final multipartFile = await http.MultipartFile.fromPath(
            field,
            f.path,
            contentType: MediaType(parts[0], parts[1]),
          );
          request.files.add(multipartFile);
        }
      }

      final streamed = await client.send(request);
      final body = await streamed.stream.transform(utf8.decoder).join();
      final status = streamed.statusCode;

      dynamic data;
      try {
        data = json.decode(body);
      } catch (_) {
        data = null;
      }

      print('$method (multipart) $uri');
      print('request-fields: $fields');
      print('request-files: ${multipleFiles?.keys.toList() ?? files?.keys.toList() ?? []}');
      print('status: $status');
      print('body: $body');

      if (status == 200 || status == 201) {
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

      if (status == 204) {
        return Success(fromJson(<String, dynamic>{}), '');
      }

      if (data is Map<String, dynamic>) {
        final msgValue = data['message'];
        return Error(listToString(msgValue));
      } else {
        return Error('Error $status: $body');
      }
    } catch (e, st) {
      print('MultipartSender.send error: $e\n$st');
      return Error(e.toString());
    }
  }
}