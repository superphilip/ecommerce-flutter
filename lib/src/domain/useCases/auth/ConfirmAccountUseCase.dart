import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';

class ConfirmAccountUseCase {
  AuthRepository repository;
  ConfirmAccountUseCase(this.repository);

  run(String notificationToken) => repository.confirmaccount(notificationToken);
}
