import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

abstract class AbstractHttpClient {
  
  Future<String> getSessionToken();

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

  Future<Resource<T>> deleteData<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
  });
}