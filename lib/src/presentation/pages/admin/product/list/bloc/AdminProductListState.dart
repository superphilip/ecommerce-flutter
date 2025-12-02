part of 'AdminProductListBloc.dart';

class AdminProductListState extends Equatable {
  final Resource? response;

  const AdminProductListState({this.response});

  AdminProductListState copyWith({Resource? response}) {
    return AdminProductListState(
      response: response,
    );
  }

  @override
  List<Object?> get props => [response];
}
