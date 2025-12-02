part of 'AdminCategoryUpdateBloc.dart';

abstract class AdminCategoryUpdateEvent extends Equatable {
  const AdminCategoryUpdateEvent();

  @override
  List<Object?> get props => [];
}

class AdminCategoryUpdateInitEvent extends AdminCategoryUpdateEvent {
  final Category? category;
  const AdminCategoryUpdateInitEvent({this.category});
  @override
  List<Object?> get props => [category];
}

class AdminCategoryUpdateReset extends AdminCategoryUpdateEvent {
  const AdminCategoryUpdateReset();

  @override
  List<Object> get props => [];
}

class AdminCategoryUpdateNameChanged extends AdminCategoryUpdateEvent {
  final BlocFormItem name;
  
  const AdminCategoryUpdateNameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class AdminCategoryUpdateDescriptionChanged extends AdminCategoryUpdateEvent {
  final BlocFormItem description;
  
  const AdminCategoryUpdateDescriptionChanged({required this.description});

  @override
  List<Object> get props => [description];
}

class PickImageUpdate extends AdminCategoryUpdateEvent {
  const PickImageUpdate();
}

class TakePhotoUpdate extends AdminCategoryUpdateEvent {
  const TakePhotoUpdate();
}

class AdminCategoryUpdateSubmit extends AdminCategoryUpdateEvent {
  const AdminCategoryUpdateSubmit();
}