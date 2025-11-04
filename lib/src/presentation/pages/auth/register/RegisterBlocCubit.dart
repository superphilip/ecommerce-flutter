import 'package:ecommerce_flutter/src/utils/Validators.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBlocCubit extends Cubit<RegisterBlocState> {
  RegisterBlocCubit() : super(RegisterInitialState());

  //Controllers
  final _nameController = BehaviorSubject<String>.seeded('');
  final _lastNameController = BehaviorSubject<String>.seeded('');
  final _emailController = BehaviorSubject<String>.seeded('');
  final _phoneController = BehaviorSubject<String>.seeded('');
  final _passwordController = BehaviorSubject<String>.seeded('');
  final _confirmPasswordController = BehaviorSubject<String>.seeded('');
  final _isFormSubmitted = BehaviorSubject<bool>.seeded(false);

  //Helpers
  final _validators = Validators();

  //Getters
  Stream<String?> get nameStream => Rx.combineLatest2(
    _nameController.stream,
    _isFormSubmitted.stream,
    (name, isSubmitted) {
      if (!isSubmitted && name.isEmpty) {
        return null;
      }
      return _validators.textValidator(name);
    },
  );
  Stream<String?> get lastNameStream => Rx.combineLatest2(
    _lastNameController.stream,
    _isFormSubmitted.stream,
    (lastname, isSubmitted) {
      if (!isSubmitted && lastname.isEmpty) {
        return null;
      }
      return _validators.textValidator(lastname);
    },
  );
  Stream<String?> get emailStream => Rx.combineLatest2(
    _emailController.stream,
    _isFormSubmitted.stream,
    (email, isSubmitted) {
      if (!isSubmitted && email.isEmpty) {
        return null;
      }
      return _validators.emailValidator(email);
    },
  );
  Stream<String?> get phoneStream => Rx.combineLatest2(
    _phoneController.stream,
    _isFormSubmitted.stream,
    (phone, isSubmitted) {
      if (!isSubmitted && phone.isEmpty) {
        return null;
      }
      return _validators.phoneValidator(phone);
    },
  );
  Stream<String?> get passwordStream => Rx.combineLatest2(
    _passwordController.stream,
    _isFormSubmitted.stream,
    (password, isSubmitted) {
      if (!isSubmitted && password.isEmpty) {
        return null;
      }
      return _validators.passwordValidator(password);
    },
  );
  Stream<String?> get confirmPasswordStream => Rx.combineLatest2(
    _confirmPasswordController.stream,
    _isFormSubmitted.stream,
    (confirmPassword, isSubmitted) {
      if (!isSubmitted && confirmPassword.isEmpty) {
        return null;
      }
      return _validators.confirmPasswordValidator(
        _passwordController.value,
        confirmPassword,
      );
    },
  );

  Stream<bool> get validateForm => Rx.combineLatest6(
    nameStream,
    lastNameStream,
    emailStream,
    phoneStream,
    passwordStream,
    confirmPasswordStream,
    (nameErr, lastNameErr, emailErr, phoneErr, passErr, confirmPassErr) {
      return nameErr == null &&
          lastNameErr == null &&
          emailErr == null &&
          phoneErr == null &&
          passErr == null &&
          confirmPassErr == null;
    },
  );

  // Getters for current values
  String get currentName => _nameController.value;
  String get currentLastName => _lastNameController.value;
  String get currentEmail => _emailController.value;
  String get currentPhone => _phoneController.value;
  String get currentPassword => _passwordController.value;
  String get currentConfirmPassword => _confirmPasswordController.value;

  //Setters
  void changeName(String name) => _nameController.add(name);
  void changeLastName(String lastname) => _lastNameController.add(lastname);
  void changeEmail(String email) => _emailController.add(email);
  void changePhone(String phone) => _phoneController.add(phone);
  void changePassword(String password) => _passwordController.add(password);
  void changeConfirmPassword(String confirmPassword) =>
      _confirmPasswordController.add(confirmPassword);

  void register() async {
    _isFormSubmitted.add(true);

    final isValid = await validateForm.first;

    if (isValid) {
      print('Name: ${_nameController.value}');
      print('Last Name: ${_lastNameController.value}');
      print('Email: ${_emailController.value}');
      print('Phone: ${_phoneController.value}');
      print('Password: ${_passwordController.value}');
      print('Confirm Password: ${_confirmPasswordController.value}');
    }
  }

  @override
  Future<void> close() {
    _nameController.close();
    _lastNameController.close();
    _emailController.close();
    _phoneController.close();
    _passwordController.close();
    _confirmPasswordController.close();
    _isFormSubmitted.close(); 
    return super.close(); 
  }
}
