import 'dart:io';

import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';

class UpdateUserUseCase {
  AuthRepository authRepository;

  UpdateUserUseCase(this.authRepository);

  run(int id, User user, File? file) => authRepository.update(id, user, file);
}