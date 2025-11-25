import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/utils/Validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'ResendCodeEvent.dart';
part 'ResendCodeState.dart';

class ResendCodeBloc extends Bloc<ResendCodeEvent, ResendCodeState> {
  AuthUseCases authUseCases;
  ResendCodeBloc(this.authUseCases) : super(ResendCodeState()) {
    on<ResendCodeInitEvent>(_onResendCodeInitEvent);
    on<ResendCodeEmailChanged>(_onEmailChanged);
    on<ResendCodeSubmit>(_onResendCodeSubmit);
    on<ResendCodeReset>(_onResendCodeReset);
  }

  final formKey = GlobalKey<FormState>();
  final _validators = Validators();

  Future<void> _onResendCodeInitEvent(
    ResendCodeEvent event,
    Emitter<ResendCodeState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onResendCodeReset(
    ResendCodeReset event,
    Emitter<ResendCodeState> emit,
  ) async {
    state.formKey?.currentState?.reset();
  }

  Future<void> _onEmailChanged(
    ResendCodeEmailChanged event,
    Emitter<ResendCodeState> emit,
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

  Future<void> _onResendCodeSubmit(
    ResendCodeSubmit event,
    Emitter<ResendCodeState> emit,
  ) async {
    Resource<AuthResponse> response = await authUseCases.resendCode.run(
      state.email.value,
    );
    emit(state.copyWith(response: Loading(), formKey: formKey));
    await Future.delayed(Duration(seconds: 4));
    emit(state.copyWith(response: response, formKey: formKey));
  }


}
