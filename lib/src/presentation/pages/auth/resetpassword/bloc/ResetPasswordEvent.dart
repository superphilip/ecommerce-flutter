part of 'ResetPasswordBloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitEvent extends ResetPasswordEvent {
  const ResetPasswordInitEvent();
}

class ResetPasswordReset extends ResetPasswordEvent {
  const ResetPasswordReset();
}

class ResetPasswordSetNotificationToken extends ResetPasswordEvent {
  final String notificationToken;

  const ResetPasswordSetNotificationToken({required this.notificationToken});

  @override
  List<Object> get props => [notificationToken];
}

class ResetPasswordChanged extends ResetPasswordEvent {
  final BlocFormItem password;

  const ResetPasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class ResetPasswordSubmit extends ResetPasswordEvent {
  const ResetPasswordSubmit();
}
