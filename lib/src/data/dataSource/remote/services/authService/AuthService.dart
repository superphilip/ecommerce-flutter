import 'dart:convert';
import 'dart:io';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/databaseServices/HttpClientImpl.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;

import 'package:ecommerce_flutter/src/data/api/ApiConfig.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:http_parser/http_parser.dart';

class AuthService extends HttpClientImpl {
  AuthService(super.sharedPref);

  Future<Resource<AuthResponse>> login(String email, String password) async {
    return postData<AuthResponse>(
      path: '/auth/login',
      bodyParameters: {'email': email, 'password': password},
      fromJson: AuthResponse.fromJson,
    );
  }

  Future<Resource<AuthResponse>> register(User user) async {
    return postData<AuthResponse>(
      path: '/auth/register',
      bodyParameters: user.toJson(),
      fromJson: AuthResponse.fromJson,
    );
  }

  Future<Resource<User>> update(int id, User user, File? file) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMERCE, 'auth/upload/$id');
      String token = await getSessionToken();

      final request = http.MultipartRequest('PUT', url);
      request.headers['Authorization'] = token;

      if (file != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'file',
            file.path,
            contentType: MediaType('image', 'jpeg'),
          ),
        );
      }

      request.fields.addAll({
        'name': user.name!,
        'lastName': user.lastName!,
        'phone': user.phone!,
      });

      final streamedResponse = await request.send();
      final responseBody = await streamedResponse.stream
          .transform(utf8.decoder)
          .first;
      final data = json.decode(responseBody);

      if (streamedResponse.statusCode == 200 ||
          streamedResponse.statusCode == 201) {
        User userResponse = User.fromJson(data);
        final message = data['message'] is String ? data['message'] : '';
        return Success(userResponse, message);
      }

      return Error(data['message']?.toString() ?? 'Error desconocido');
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<AuthResponse>> confirmaccount(
    String notificationToken,
  ) async {
    return postData<AuthResponse>(
      path: '/auth/confirm',
      bodyParameters: {'notificationToken': notificationToken},
      fromJson: AuthResponse.fromJson,
    );
  }

  Future<Resource<AuthResponse>> resendcode(String email) async {
    return postData<AuthResponse>(
      path: '/auth/resend-code',
      bodyParameters: {'email': email},
      fromJson: AuthResponse.fromJson,
    );
  }

  Future<Resource<AuthResponse>> forgotpassword(String email) async {
    return postData<AuthResponse>(
      path: '/auth/forgot-password',
      bodyParameters: {'email': email},
      fromJson: AuthResponse.fromJson,
    );
  }

  Future<Resource<AuthResponse>> resetpassword(
    String notificationToken,
    String password,
  ) async {
    return postData<AuthResponse>(
      path: '/auth/reset-password/$notificationToken',
      bodyParameters: {'password': password},
      fromJson: AuthResponse.fromJson,
    );
  }
}
