import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:equatable/equatable.dart';

part 'AdminHomeEvent.dart';
part 'AdminHomeState.dart';

class AdminHomeBloc extends Bloc<AdminHomeEvent, AdminHomeState> {

  AuthUseCases authUseCases;

  AdminHomeBloc(this.authUseCases) : super(AdminHomeState()) {
    on<AdminChangedDrawerPage>(_onAdminChangedDrawerPage);
    on<AdminLogout>(_onAdminLogout);
  }

  Future<void> _onAdminLogout(
    AdminLogout event,
    Emitter<AdminHomeState> emit,
  ) async {
    await authUseCases.logout.run();
    emit(AdminLogoutSuccess());
  }

  Future<void> _onAdminChangedDrawerPage(
    AdminChangedDrawerPage event,
    Emitter<AdminHomeState> emit,
  ) async {
    emit(
      state.copyWith(
        pageIndex: event.pageIndex
      )
    );
  }

}
