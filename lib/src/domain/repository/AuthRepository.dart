import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

abstract class AuthRepository {
  Future<AuthResponse?> getUserSessionToken();
  Future<bool> logout();
  Future<void> saveUserSession(AuthResponse authResponse);
  Future<Resource<AuthResponse>> login(String email, String password);
  Future<Resource<AuthResponse>> register(User user);
  Future<Resource<AuthResponse>> confirmaccount(String notificationToken);
  Future<Resource<AuthResponse>> resendCode(String email);
  Future<Resource<AuthResponse>> forgotPassword(String email);
  Future<Resource<User>> update(int id, User user, File? file);
  Future<Resource<AuthResponse>> resetPassword(String notificationToken, String password);
}
