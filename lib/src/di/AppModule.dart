import 'package:ecommerce_flutter/src/data/Repository/UsersRepositoyImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/data/Repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/authService/AuthService.dart';
import 'package:ecommerce_flutter/src/data/dataSource/remote/services/userService/UsersService.dart';
import 'package:ecommerce_flutter/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_flutter/src/domain/repository/UsersRepository.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/ConfirmAccountUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/ForgotPasswordUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/ResendCodeUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/ResetPasswordUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/UpdateUserUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  
  @injectable
  AuthService get authService => AuthService(sharedPref);

  @injectable
  UsersService get usersService => UsersService();

  @injectable
  SharedPref get sharedPref => SharedPref();


  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService, sharedPref);
  
  @injectable
  UsesRepository get usesRepository => UsersRepositoyImpl(usersService, sharedPref);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    register: RegisterUseCase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    logout: LogoutUseCase(authRepository),
    updateUser: UpdateUserUseCase(authRepository),
    confirmAccount: ConfirmAccountUseCase(authRepository),
    resendCode: ResendCodeUseCase(authRepository),
    forgotPassword: ForgotPasswordUseCase(authRepository),
    resetPassword: ResetPasswordUseCase(authRepository)
  );
}