part of 'ConfirmAccountBloc.dart';

class ConfirmAccountState extends Equatable {
  final BlocFormItem notificationToken;
  final Resource? response;
  final GlobalKey<FormState>? formKey;
  const ConfirmAccountState({
    this.notificationToken = const BlocFormItem(error: 'Ingresa el pin'),
    this.formKey,
    this.response,
  });

  ConfirmAccountState copyWith({
    BlocFormItem? notificationToken,
    Resource? response,
    GlobalKey<FormState>? formKey,
  }) {
    return ConfirmAccountState(
      notificationToken: notificationToken ?? this.notificationToken,
      response: response,
      formKey: formKey,
    );
  }
  
  @override
  List<Object?> get props => [notificationToken, response];
}

