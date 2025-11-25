part of 'ResendCodeBloc.dart';

class ResendCodeState extends Equatable {
  final BlocFormItem email;
  final Resource? response;
  final GlobalKey<FormState>? formKey;
  const ResendCodeState({
    this.email = const BlocFormItem(error: 'Ingresa tu email'),
    this.formKey,
    this.response,
  });

  ResendCodeState copyWith({
    BlocFormItem? email,
    Resource? response,
    GlobalKey<FormState>? formKey,
  }) {
    return ResendCodeState(
      email: email ?? this.email,
      response: response,
      formKey: formKey,
    );
  }
  
  @override
  List<Object?> get props => [email, response];
}

