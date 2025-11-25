
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';

class ResendCodeUseCase {
  AuthRepository repository;
  ResendCodeUseCase(this.repository);

  run(String email) => repository.resendCode(email);
}
