import 'dart:io';

import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/authService/AuthService.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthService authService;
  SharedPref sharedPref;

  AuthRepositoryImpl(this.authService, this.sharedPref);

  @override
  Future<Resource<AuthResponse>> login(String email, String password) {
    return authService.login(email, password);
  }

  @override
  Future<Resource<AuthResponse>> register(User user) {
    return authService.register(user);
  }

  @override
  Future<AuthResponse?> getUserSessionToken() async {
    final data = await sharedPref.read('user');
    if (data != null) {
      AuthResponse authResponse = AuthResponse.fromJson(
        await sharedPref.read('user'),
      );
      return authResponse;
    }
    return null;
  }

  @override
  Future<void> saveUserSession(AuthResponse authResponse) async {
    sharedPref.save('user', authResponse.toJson());
  }

  @override
  Future<bool> logout() async {
    return await sharedPref.remove('user');
  }

  @override
  Future<Resource<User>> update(int id, User user, File? file) {
    return authService.update(id, user, file);
  }

  @override
  Future<Resource<AuthResponse>> confirmaccount(String notificationToken) {
    return authService.confirmaccount(notificationToken);
  }
  
  @override
  Future<Resource<AuthResponse>> resendCode(String email) {
    return authService.resendcode(email);
  }
  
  @override
  Future<Resource<AuthResponse>> forgotPassword(String email) {
    return authService.forgotpassword(email);
  }
  
  @override
  Future<Resource<AuthResponse>> resetPassword(String notificationToken, String password) {
    return authService.resetpassword(notificationToken, password);
  }
}
