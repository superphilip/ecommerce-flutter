


import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';

class ForgotPasswordUseCase {
  AuthRepository repository;
  ForgotPasswordUseCase(this.repository);

  run(String email) => repository.forgotPassword(email);
}
