part of 'ResetPasswordBloc.dart';

class ResetPasswordState extends Equatable {
  final String notificationToken;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const ResetPasswordState({
    this.notificationToken = '',
    this.password = const BlocFormItem(error: 'Ingresa una contraseña'),
    this.formKey,
    this.response,
  });

  ResetPasswordState copyWith({
    String? notificationToken,
    BlocFormItem? password,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return ResetPasswordState(
      notificationToken: notificationToken ?? this.notificationToken,
      password: password ?? this.password,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [notificationToken, password, response];
}

