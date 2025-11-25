part of 'ResendCodeBloc.dart';

abstract class ResendCodeEvent extends Equatable {
  const ResendCodeEvent();

  @override
  List<Object?> get props => [];
}

class ResendCodeInitEvent extends ResendCodeEvent {
  const ResendCodeInitEvent();
}

class ResendCodeReset extends ResendCodeEvent {
  const ResendCodeReset();
}

class ResendCodeEmailChanged extends ResendCodeEvent {
  final BlocFormItem email;
  const ResendCodeEmailChanged({required this.email});

  @override
  List<Object?> get props => [email];
}

class ResendCodeSubmit extends ResendCodeEvent {
  const ResendCodeSubmit();
}