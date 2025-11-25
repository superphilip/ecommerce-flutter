part of 'AdminHomeBloc.dart';

abstract class AdminHomeEvent extends Equatable {
  const AdminHomeEvent();

  @override
  List<Object> get props => [];
}

class AdminChangedDrawerPage extends AdminHomeEvent {
  final int pageIndex;
  const AdminChangedDrawerPage({required this.pageIndex});

  @override
  List<Object> get props => [pageIndex];

}

class AdminLogout extends AdminHomeEvent {
  const AdminLogout();
}
