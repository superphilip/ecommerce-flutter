import 'package:ecommerce_flutter/src/utils/Validators.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class LoginBlocCubit extends Cubit<LoginBlocState> {
  LoginBlocCubit() : super(LoginInitialState());

  final _emailController = BehaviorSubject<String>.seeded('');
  final _passwordController = BehaviorSubject<String>.seeded('');
  final _isFormSubmitted = BehaviorSubject<bool>.seeded(false);

  final _validators = Validators();

  //Getters con validación condicional
  Stream<String?> get emailValidationStream => Rx.combineLatest2(
    _emailController.stream,
    _isFormSubmitted.stream,
    (email, isSubmitted) {
      if (!isSubmitted && email.isEmpty) {
        return null;
      }
      return _validators.emailValidator(email);
    },
  );

  Stream<String?> get passwordValidationStream => Rx.combineLatest2(
    _passwordController.stream,
    _isFormSubmitted.stream,
    (password, isSubmitted) {
      if (!isSubmitted && password.isEmpty) {
        return null;
      }
      return _validators.passwordValidator(password);
    },
  );

  Stream<bool> get validateForm => Rx.combineLatest2(
    emailValidationStream,
    passwordValidationStream,
    (emailError, passwordError) {
      return emailError == null && passwordError == null;
    },
  );

  // Getters for current values
  String get currentEmail => _emailController.value;
  String get currentPassword => _passwordController.value;

  //Setters
  void changeEmail(String email) => _emailController.add(email);
  void changePassword(String password) => _passwordController.add(password);

  //Login
  void login() async {
    _isFormSubmitted.add(true);

    final isValid = await validateForm.first;

    if (isValid) {
      print('Name: ${_emailController.value}');
      print('Password: ${_passwordController.value}');
    }
  }

  @override
  Future<void> close() {
    _emailController.close();
    _passwordController.close();
    _isFormSubmitted.close();
    return super.close();
  }
}
