import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:equatable/equatable.dart';

part 'ProfileInfoEvent.dart';
part 'ProfileInfoState.dart';

class ProfileInfoBloc extends Bloc<ProfileInfoEvent, ProfileInfoState> {
  AuthUseCases authUseCases;

  ProfileInfoBloc(this.authUseCases) : super(ProfileInfoState()) {
    on<ProfileInfoGetUser>(_onGetUser);
  }

  Future<void> _onGetUser(
    ProfileInfoGetUser event,
    Emitter<ProfileInfoState> emit,
  ) async {
    AuthResponse authResponse = await authUseCases.getUserSession.run();
    emit(state.copyWith(user: authResponse.user));
  }
}
