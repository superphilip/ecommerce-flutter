import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/utils/Validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'ForgotPasswordEvent.dart';
part 'ForgotPasswordState.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  AuthUseCases authUseCases;
  ForgotPasswordBloc(this.authUseCases) : super(ForgotPasswordState()) {
    on<ForgotPasswordInitEvent>(_onForgotPasswordInitEvent);
    on<ForgotPasswordEmailChanged>(_onEmailChanged);
    on<ForgotPasswordReset>(_onForgotPasswordReset);
    on<ForgotPasswordSubmit>(_onForgotPasswordSubmit);
  }

  final formKey = GlobalKey<FormState>();
  final _validators = Validators();

  Future<void> _onForgotPasswordInitEvent(
    ForgotPasswordEvent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onForgotPasswordReset(
    ForgotPasswordReset event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    state.formKey?.currentState?.reset();
  }

  Future<void> _onEmailChanged(
    ForgotPasswordEmailChanged event,
    Emitter<ForgotPasswordState> emit,
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

  Future<void> _onForgotPasswordSubmit(
    ForgotPasswordSubmit event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    Resource<AuthResponse> response = await authUseCases.forgotPassword.run(
      state.email.value,
    );
    emit(state.copyWith(response: Loading(), formKey: formKey));
    await Future.delayed(Duration(seconds: 4));
    emit(state.copyWith(response: response, formKey: formKey));
  }

}
