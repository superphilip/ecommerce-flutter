part of 'AdminProductCreateBloc.dart';

abstract class AdminProductCreateEvent extends Equatable {
  const AdminProductCreateEvent();

  @override
  List<Object?> get props => [];
}

class AdminProductCreateInitEvent extends AdminProductCreateEvent {
  final Category? category;
  const AdminProductCreateInitEvent({required this.category});

  @override
  List<Object?> get props => [category];
}

class AdminProductCreateReset extends AdminProductCreateEvent {
  const AdminProductCreateReset();
  @override
  List<Object> get props => [];
}

class AdminProductCretateNameChanged extends AdminProductCreateEvent {
  final BlocFormItem name;

  const AdminProductCretateNameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class AdminProductCretateDescriptionChanged extends AdminProductCreateEvent {
  final BlocFormItem description;

  const AdminProductCretateDescriptionChanged({required this.description});

  @override
  List<Object> get props => [description];
}

class AdminProductCretatePriceChanged extends AdminProductCreateEvent {
  final BlocFormItem price;

  const AdminProductCretatePriceChanged({required this.price});

  @override
  List<Object> get props => [price];
}

class PickImage extends AdminProductCreateEvent {
  final int numberFile;
  const PickImage({required this.numberFile});
}

class TakePhoto extends AdminProductCreateEvent {
  final int numberFile;
  const TakePhoto({required this.numberFile});
}

class AdminProductCreateSubmit extends AdminProductCreateEvent {
  const AdminProductCreateSubmit();
}
