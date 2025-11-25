part of 'ForgotPasswordBloc.dart';

class ForgotPasswordState extends Equatable {
  final BlocFormItem email;
  final Resource? response;
  final GlobalKey<FormState>? formKey;

  const ForgotPasswordState({
    this.email = const BlocFormItem(error: 'Ingresa tu email'),
    this.formKey,
    this.response,
  });

  ForgotPasswordState copyWith({
    BlocFormItem? email,
    Resource? response,
    GlobalKey<FormState>? formKey,
  }) {
    return ForgotPasswordState(
      email: email ?? this.email,
      response: response,
      formKey: formKey,
    );
  }

  @override
  List<Object?> get props => [email, response];
}
