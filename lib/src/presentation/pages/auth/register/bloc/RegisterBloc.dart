import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/utils/Validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  AuthUseCases authUseCases;

  RegisterBloc(this.authUseCases) : super(RegisterState()) {
    on<RegisterInitEvent>(_onInitEvent);
    on<RegisterNameChanged>(_onNameChanged);
    on<RegisterLastNameChanged>(_onLastNameChanged);
    on<RegisterEmailChanged>(_onEmailChanged);
    on<RegisterPhoneChanged>(_onPhoneChanged);
    on<RegisterPasswordChanged>(_onPasswordChanged);
    on<RegisterConfirmPasswordChanged>(_onConfirmPasswordChanged);
    on<RegisterFormSubmit>(_onRegisterSubmit);
    on<RegisterFormReset>(_onLoginFormReset);
  }

  final formKey = GlobalKey<FormState>();
  final _validators = Validators();

  Future<void> _onInitEvent(
    RegisterInitEvent event,
    Emitter<RegisterState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
  } 

  Future<void> _onLoginFormReset(
    RegisterFormReset event,
    Emitter<RegisterState> emit,
  ) async {
    state.formKey?.currentState?.reset();
  }

  Future<void> _onNameChanged(
    RegisterNameChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final nameValue = event.name.value;
    final nameError = _validators.textValidator(nameValue);
    emit(
      state.copyWith(
        name: BlocFormItem(value: nameValue, error: nameError),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onLastNameChanged(
    RegisterLastNameChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final lastNameValue = event.lastName.value;
    final lastNameError = _validators.textValidator(lastNameValue);
    emit(
      state.copyWith(
        lastName: BlocFormItem(value: lastNameValue, error: lastNameError),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onEmailChanged(
    RegisterEmailChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final emailValue = event.email.value;
    final emailError = _validators.emailValidator(emailValue);
    emit(
      state.copyWith(
        email: BlocFormItem(value: emailValue, error: emailError),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPhoneChanged(
    RegisterPhoneChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final phoneValue = event.phone.value;
    final phoneError = _validators.phoneValidator(phoneValue);
    emit(
      state.copyWith(
        phone: BlocFormItem(value: phoneValue, error: phoneError),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onPasswordChanged(
    RegisterPasswordChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final passwordValue = event.password.value;
    final passwordError = _validators.passwordValidator(passwordValue);
    emit(
      state.copyWith(
        password: BlocFormItem(value: passwordValue, error: passwordError),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onConfirmPasswordChanged(
    RegisterConfirmPasswordChanged event,
    Emitter<RegisterState> emit,
  ) async {
    final confirmPasswordValue = event.confirmPassword.value;
    final confirmPasswordError = _validators.confirmPasswordValidator(
      confirmPasswordValue,
      state.password.value,
    );
    emit(
      state.copyWith(
        confirmPassword: BlocFormItem(
          value: confirmPasswordValue,
          error: confirmPasswordError,
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onRegisterSubmit(
    RegisterFormSubmit event,
    Emitter<RegisterState> emit,
  ) async {
    Resource<AuthResponse> response = await authUseCases.register.run(state.toUser());
    emit(state.copyWith(response: Loading(), formKey: formKey));
    await Future.delayed(Duration(seconds: 4));
    emit(state.copyWith(
      response: response,
      formKey: formKey
    ));
  }
  
  
}
