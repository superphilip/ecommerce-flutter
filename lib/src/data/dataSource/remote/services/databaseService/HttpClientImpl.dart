import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/databaseService/AbstractHttpClient.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/data/helpers/HttpUtils.dart';
import 'package:ecommerce_flutter/src/data/helpers/MultipartSender.dart';
import 'package:ecommerce_flutter/src/data/helpers/ResponseHelper.dart';
import 'package:ecommerce_flutter/src/data/helpers/SessionManager.dart';
import 'package:http/http.dart' as http;

class HttpClientImpl extends AbstractHttpClient {
  final SessionManager sessionManager;
  final http.Client client;
  final MultipartSender multipartSender;
  final String _apiBaseUrl = ApiConfig.API_ECOMMERCE;
  final Map<String, String> _jsonHeaders = defaultJsonHeaders();

  HttpClientImpl(
    this.sessionManager, {
    http.Client? client,
    MultipartSender? multipartSender,
  }) : client = client ?? http.Client(),
       multipartSender = multipartSender ?? MultipartSender();

  factory HttpClientImpl.fromSharedPref(
    SharedPref sharedPref, {
    http.Client? client,
    MultipartSender? multipartSender,
  }) {
    final sessionMgr = SessionManager(sharedPref);
    return HttpClientImpl(
      sessionMgr,
      client: client,
      multipartSender: multipartSender,
    );
  }

  Uri _buildUri(String path, [Map<String, String>? queryParameters]) {
    return buildUri(_apiBaseUrl, path, queryParameters);
  }

  Future<Map<String, String>> _buildHeaders() {
    return buildHeadersAsync(
      sessionManager.getSessionToken,
      baseHeaders: _jsonHeaders,
    );
  }

  @override
  Future<Resource<T>> getData<T>({
    required String path,
    Map<String, String>? queryParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final headers = await _buildHeaders();
    return ResponseHelper.requestJson<T>(
      client.get(uri, headers: headers),
      fromJson,
    );
  }

  @override
  Future<Resource<List<T>>> getDataList<T>({
    required String path,
    Map<String, String>? queryParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final headers = await _buildHeaders();
    return ResponseHelper.requestJsonList<T>(
      client.get(uri, headers: headers),
      fromJson,
    );
  }

  @override
  Future<Resource<T>> postData<T>({
    required String path,
    required Map<String, dynamic> bodyParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final uri = _buildUri(path);
    final headers = await _buildHeaders();
    final body = json.encode(bodyParameters);
    return ResponseHelper.requestJson<T>(
      client.post(uri, headers: headers, body: body),
      fromJson,
    );
  }

  @override
  Future<Resource<T>> putData<T>({
    required String path,
    required Map<String, dynamic> bodyParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final uri = _buildUri(path);
    final headers = await _buildHeaders();
    final body = json.encode(bodyParameters);
    return ResponseHelper.requestJson<T>(
      client.put(uri, headers: headers, body: body),
      fromJson,
    );
  }

  @override
  Future<Resource<T>> deleteData<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final uri = _buildUri(path);
    final headers = await _buildHeaders();
    return ResponseHelper.requestJson<T>(
      client.delete(uri, headers: headers),
      fromJson,
    );
  }

  @override
  Future<Resource<bool>> deleteBool({
    required String path,
    Map<String, String>? queryParameters,
  }) async {
    final uri = _buildUri(path, queryParameters);
    final headers = await _buildHeaders();
    return ResponseHelper.requestBool(client.delete(uri, headers: headers));
  }

  @override
  Future<Resource<T>> putMultipart<T>({
    required String path,
    Map<String, String>? fields,
    // Backward-compat single-file-per-field
    Map<String, File>? files,
    // New: multiple files per field name, e.g. {'files[]': [file1, file2]}
    Map<String, List<File>>? multipleFiles,
    Map<String, String>? fileMimeTypes,
    String fileMimeType = 'image/jpeg',
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final uri = _buildUri(path);
    final headers = await _buildHeaders();
    return multipartSender.send<T>(
      method: 'PUT',
      uri: uri,
      headers: headers,
      fields: fields,
      files: files,
      multipleFiles: multipleFiles,
      fileMimeTypes: fileMimeTypes,
      defaultFileMimeType: fileMimeType,
      fromJson: fromJson,
    );
  }

  @override
  Future<Resource<T>> postMultipart<T>({
    required String path,
    Map<String, String>? fields,
    Map<String, File>? files,
    Map<String, List<File>>? multipleFiles,
    Map<String, String>? fileMimeTypes,
    String fileMimeType = 'image/jpeg',
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    final uri = _buildUri(path);
    final headers = await _buildHeaders();
    return multipartSender.send<T>(
      method: 'POST',
      uri: uri,
      headers: headers,
      fields: fields,
      files: files,
      multipleFiles: multipleFiles,
      fileMimeTypes: fileMimeTypes,
      defaultFileMimeType: fileMimeType,
      fromJson: fromJson,
    );
  }
}
