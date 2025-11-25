import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/utils/Validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'ResetPasswordEvent.dart';
part 'ResetPasswordState.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  AuthUseCases authUseCases;
  final formKey = GlobalKey<FormState>();
  final _validators = Validators();

  ResetPasswordBloc(this.authUseCases) : super(ResetPasswordState()) {
    on<ResetPasswordInitEvent>(_onInitEvent);
    on<ResetPasswordReset>(_onReset);
    on<ResetPasswordSetNotificationToken>(_onSetNotificationToken);
    on<ResetPasswordChanged>(_onPasswordChanged);
    on<ResetPasswordSubmit>(_onSubmit);
  }

  Future<void> _onInitEvent(
    ResetPasswordInitEvent event,
    Emitter<ResetPasswordState> emit,
  ) async{
    emit(
      state.copyWith(
        formKey: formKey,
      ),
    );
  }

  Future<void> _onReset(
    ResetPasswordReset event,
    Emitter<ResetPasswordState> emit,
  ) async{
    state.formKey?.currentState?.reset();
  }

  Future<void> _onSetNotificationToken(
    ResetPasswordSetNotificationToken event,
    Emitter<ResetPasswordState> emit,
  ) async{
    emit(
      state.copyWith(
        notificationToken: event.notificationToken,
      ),
    );
  }

  Future<void> _onPasswordChanged(
    ResetPasswordChanged event,
    Emitter<ResetPasswordState> emit,
  ) async{
    final passwordValue = event.password.value;
    final passwordError = _validators.passwordValidator(passwordValue);
    emit(
      state.copyWith(
        password: BlocFormItem(value: passwordValue, error: passwordError),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onSubmit(
    ResetPasswordSubmit event,
    Emitter<ResetPasswordState> emit,
  ) async{
    emit(state.copyWith(response: Loading(), formKey: formKey));
    await Future.delayed(Duration(seconds: 4));
    Resource<AuthResponse> response = await authUseCases.resetPassword.run(
      state.notificationToken,
      state.password.value,
    );
    emit(state.copyWith(response: response, formKey: formKey));
  }
}
