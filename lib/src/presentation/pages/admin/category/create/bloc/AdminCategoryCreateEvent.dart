part of 'AdminCategoryCreateBloc.dart';

abstract class AdminCategoryCreateEvent extends Equatable {
  const AdminCategoryCreateEvent();

  @override
  List<Object> get props => [];
}

class AdminCategoryCreateInitEvent extends AdminCategoryCreateEvent {
  const AdminCategoryCreateInitEvent();
}

class AdminCategoryCreateReset extends AdminCategoryCreateEvent {
  const AdminCategoryCreateReset();

  @override
  List<Object> get props => [];
}

class AdminCategoryCretateNameChanged extends AdminCategoryCreateEvent {
  final BlocFormItem name;
  
  const AdminCategoryCretateNameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class AdminCategoryCretateDescriptionChanged extends AdminCategoryCreateEvent {
  final BlocFormItem description;
  
  const AdminCategoryCretateDescriptionChanged({required this.description});

  @override
  List<Object> get props => [description];
}

class PickImage extends AdminCategoryCreateEvent {
  const PickImage();
}

class TakePhoto extends AdminCategoryCreateEvent {
  const TakePhoto();
}

class AdminCategoryCreateSubmit extends AdminCategoryCreateEvent {
  const AdminCategoryCreateSubmit();
}