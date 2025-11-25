import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';

class ResetPasswordUseCase {
  AuthRepository authRepository;

  ResetPasswordUseCase(this.authRepository);

  run(String notificationToken, String password) => authRepository.resetPassword(notificationToken, password);
}