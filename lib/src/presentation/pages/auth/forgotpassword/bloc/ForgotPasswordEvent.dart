part of 'ForgotPasswordBloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordInitEvent extends ForgotPasswordEvent {
  const ForgotPasswordInitEvent();
}

class ForgotPasswordReset extends ForgotPasswordEvent {
  const ForgotPasswordReset();
}

class ForgotPasswordEmailChanged extends ForgotPasswordEvent {
  final BlocFormItem email;
  const ForgotPasswordEmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class ForgotPasswordSubmit extends ForgotPasswordEvent {
  const ForgotPasswordSubmit();
}
