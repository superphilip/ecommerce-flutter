import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/utils/Resource.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'ConfirmAccountEvent.dart';
part 'ConfirmAccounTState.dart';

class ConfirmAccountBloc
    extends Bloc<ConfirmAccountEvent, ConfirmAccountState> {
  AuthUseCases authUseCases;
  ConfirmAccountBloc(this.authUseCases) : super(ConfirmAccountState()) {
    on<ConfirmAccountInitEvent>(_onConfirmAccountInitEvent);
    on<ConfirmAccountNotificationToken>(_onNotificationTokenChanged);
    on<ConfirmAccountSubmit>(_onConfirmAccountSubmit);
  }

  final formKey = GlobalKey<FormState>();

  Future<void> _onConfirmAccountInitEvent(
    ConfirmAccountEvent event,
    Emitter<ConfirmAccountState> emit,
  ) async {
    emit(state.copyWith(formKey: formKey));
  }

  Future<void> _onNotificationTokenChanged(
    ConfirmAccountNotificationToken event,
    Emitter<ConfirmAccountState> emit,
  ) async {
    final notificationTokenValue = event.notificationToken.value;
    // final notificationTokenError = _validators.notificationTokenValidator(notificationTokenValue);
    emit(
      state.copyWith(
        notificationToken: BlocFormItem(
          value: notificationTokenValue,
          error: notificationTokenValue,
        ),
        formKey: formKey,
      ),
    );
  }

  Future<void> _onConfirmAccountSubmit(
    ConfirmAccountSubmit event,
    Emitter<ConfirmAccountState> emit,
  ) async {
    Resource<AuthResponse> response = await authUseCases.confirmAccount.run(
      state.notificationToken.value,
    );
    emit(state.copyWith(response: Loading(), formKey: formKey));
    await Future.delayed(Duration(seconds: 4));
    emit(state.copyWith(response: response, formKey: formKey));
  }
}
