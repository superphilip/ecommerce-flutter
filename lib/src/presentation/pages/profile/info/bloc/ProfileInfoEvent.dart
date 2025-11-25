part of 'ProfileInfoBloc.dart';

abstract class ProfileInfoEvent extends Equatable {
  const ProfileInfoEvent();

  @override
  List<Object> get props => [];
}

class ProfileInfoGetUser extends ProfileInfoEvent {
  const ProfileInfoGetUser();
}
