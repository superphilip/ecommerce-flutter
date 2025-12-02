import 'dart:io';

import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

abstract class AbstractHttpClient {

  Future<Resource<T>> postData<T>({
    required String path,
    required Map<String, dynamic> bodyParameters,
    required T Function(Map<String, dynamic>) fromJson,
  });

  Future<Resource<T>> putData<T>({
    required String path,
    required Map<String, dynamic> bodyParameters,
    required T Function(Map<String, dynamic>) fromJson,
  });

  Future<Resource<T>> getData<T>({
    required String path,
    Map<String, String>? queryParameters,
    required T Function(Map<String, dynamic>) fromJson,
  });

  Future<Resource<List<T>>> getDataList<T>({
    required String path,
    Map<String, String>? queryParameters,
    required T Function(Map<String, dynamic>) fromJson,
  });

  Future<Resource<T>> deleteData<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
  });

  Future<Resource<bool>> deleteBool({
    required String path,
    Map<String, String>? queryParameters,
  });

  Future<Resource<T>> putMultipart<T>({
    required String path,
    Map<String, String>? fields,
    Map<String, File>? files,
    Map<String, List<File>>? multipleFiles,
    Map<String, String>? fileMimeTypes,
    String fileMimeType = 'image/jpeg',
    required T Function(Map<String, dynamic>) fromJson,
  });

  Future<Resource<T>> postMultipart<T>({
    required String path,
    Map<String, String>? fields,
    Map<String, File>? files,
    Map<String, List<File>>? multipleFiles,
    Map<String, String>? fileMimeTypes,
    String fileMimeType = 'image/jpeg',
    required T Function(Map<String, dynamic>) fromJson,
  });
}