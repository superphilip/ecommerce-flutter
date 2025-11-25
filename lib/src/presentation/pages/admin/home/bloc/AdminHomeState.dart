part of 'AdminHomeBloc.dart';

class AdminHomeState extends Equatable {
  final int pageIndex;

  const AdminHomeState({this.pageIndex = 0});

  AdminHomeState copyWith({int? pageIndex}) {
    return AdminHomeState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }

  @override
  List<Object> get props => [pageIndex];
}

class AdminLogoutSuccess extends AdminHomeState {

    @override
    List<Object> get props => [];
}