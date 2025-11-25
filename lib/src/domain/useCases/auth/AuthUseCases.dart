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

class AuthUseCases {
  LoginUseCase login;
  RegisterUseCase register;
  SaveUserSessionUseCase saveUserSession;
  GetUserSessionUseCase getUserSession;
  LogoutUseCase logout;
  UpdateUserUseCase updateUser;
  ConfirmAccountUseCase confirmAccount;
  ResendCodeUseCase resendCode;
  ForgotPasswordUseCase forgotPassword;
  ResetPasswordUseCase resetPassword;




  AuthUseCases({
    required this.login,
    required this.register,
    required this.saveUserSession,
    required this.getUserSession,
    required this.logout,
    required this.updateUser,
    required this.confirmAccount,
    required this.resendCode,
    required this.forgotPassword,
    required this.resetPassword,
  });
}
