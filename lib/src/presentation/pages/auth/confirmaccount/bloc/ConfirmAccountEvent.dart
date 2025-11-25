part of 'ConfirmAccountBloc.dart';

abstract class ConfirmAccountEvent extends Equatable {
  const ConfirmAccountEvent();

  @override
  List<Object?> get props => [];
}

class ConfirmAccountInitEvent extends ConfirmAccountEvent {
  const ConfirmAccountInitEvent();
}

class ConfirmAccountNotificationToken extends ConfirmAccountEvent {
  final BlocFormItem notificationToken;
  const ConfirmAccountNotificationToken({required this.notificationToken});

  @override
  List<Object?> get props => [notificationToken];
}

class ConfirmAccountSubmit extends ConfirmAccountEvent {
  const ConfirmAccountSubmit();
}
