import 'dart:io';

import 'package:ecommerce_flutter/src/data/dataSource/remote/services/databaseService/AbstractHttpClient.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';


class AuthService {
  final AbstractHttpClient client;

  AuthService(this.client);

  // Métodos de negocio (altos nivel)
  Future<Resource<AuthResponse>> login(String email, String password) {
    return client.postData<AuthResponse>(
      path: '/auth/login',
      bodyParameters: {'email': email, 'password': password},
      fromJson: AuthResponse.fromJson,
    );
  }

  Future<Resource<AuthResponse>> register(User user) {
    return client.postData<AuthResponse>(
      path: '/auth/register',
      bodyParameters: user.toJson(),
      fromJson: AuthResponse.fromJson,
    );
  }

  Future<Resource<User>> update(int id, User user, File? file) {
    final path = 'auth/upload/$id';
    final fields = <String, String>{
      'name': user.name ?? '',
      'lastName': user.lastName ?? '',
      'phone': user.phone ?? '',
    };

    return client.putMultipart<User>(
      path: path,
      fields: fields,
      files: file != null ? { 'file': file } : null,
      fileMimeType: 'image/jpeg',
      fromJson: (m) => User.fromJson(m),
    );
  }

  Future<Resource<AuthResponse>> confirmaccount(String notificationToken) {
    return client.postData<AuthResponse>(
      path: '/auth/confirm',
      bodyParameters: {'token': notificationToken},
      fromJson: AuthResponse.fromJson,
    );
  }

  Future<Resource<AuthResponse>> resendcode(String email) {
    return client.postData<AuthResponse>(
      path: '/auth/resend-code',
      bodyParameters: {'email': email},
      fromJson: AuthResponse.fromJson,
    );
  }

  Future<Resource<AuthResponse>> forgotpassword(String email) {
    return client.postData<AuthResponse>(
      path: '/auth/forgot-password',
      bodyParameters: {'email': email},
      fromJson: AuthResponse.fromJson,
    );
  }

  Future<Resource<AuthResponse>> resetpassword(String notificationToken, String password) {
    return client.postData<AuthResponse>(
      path: '/auth/reset-password/$notificationToken',
      bodyParameters: {'password': password},
      fromJson: AuthResponse.fromJson,
    );
  }

  Future<Resource<T>> postData<T>({
    required String path,
    required Map<String, dynamic> bodyParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    return client.postData<T>(
      path: path,
      bodyParameters: bodyParameters,
      fromJson: fromJson,
    );
  }

  Future<Resource<T>> putData<T>({
    required String path,
    required Map<String, dynamic> bodyParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    return client.putData<T>(
      path: path,
      bodyParameters: bodyParameters,
      fromJson: fromJson,
    );
  }

  Future<Resource<T>> getData<T>({
    required String path,
    Map<String, String>? queryParameters,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    return client.getData<T>(
      path: path,
      queryParameters: queryParameters,
      fromJson: fromJson,
    );
  }

  Future<Resource<T>> deleteData<T>({
    required String path,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    return client.deleteData<T>(
      path: path,
      fromJson: fromJson,
    );
  }

  Future<Resource<T>> postMultipart<T>({
    required String path,
    Map<String, String>? fields,
    File? file,
    String fileField = 'file',
    String fileMimeType = 'image/jpeg',
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    return client.postMultipart<T>(
      path: path,
      fields: fields,
      files: file != null ? { 'file': file } : null,
      fileMimeType: fileMimeType,
      fromJson: fromJson,
    );
  }

  Future<Resource<T>> putMultipart<T>({
    required String path,
    Map<String, String>? fields,
    File? file,
    String fileField = 'file',
    String fileMimeType = 'image/jpeg',
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    return client.putMultipart<T>(
      path: path,
      fields: fields,
      files: file != null ? { 'file': file } : null,
      fileMimeType: fileMimeType,
      fromJson: fromJson,
    );
  }
}