part of 'AdminProductUpdateBloc.dart';


abstract class AdminProductUpdateEvent extends Equatable {
  const AdminProductUpdateEvent();

  @override
  List<Object?> get props => [];
}

class AdminProductUpdateInitEvent extends AdminProductUpdateEvent {
  final Product? product;
  const AdminProductUpdateInitEvent({required this.product});

  @override
  List<Object?> get props => [product];
}

class AdminProductUpdateReset extends AdminProductUpdateEvent {
  const AdminProductUpdateReset();
  @override
  List<Object> get props => [];
}

class AdminProductUpdateNameChanged extends AdminProductUpdateEvent {
  final BlocFormItem name;

  const AdminProductUpdateNameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class AdminProductUpdateDescriptionChanged extends AdminProductUpdateEvent {
  final BlocFormItem description;

  const AdminProductUpdateDescriptionChanged({required this.description});

  @override
  List<Object> get props => [description];
}

class AdminProductUpdatePriceChanged extends AdminProductUpdateEvent {
  final BlocFormItem price;

  const AdminProductUpdatePriceChanged({required this.price});

  @override
  List<Object> get props => [price];
}

class PickImage extends AdminProductUpdateEvent {
  final int numberFile;
  const PickImage({required this.numberFile});
}

class TakePhoto extends AdminProductUpdateEvent {
  final int numberFile;
  const TakePhoto({required this.numberFile});
}

class AdminProductUpdateSubmit extends AdminProductUpdateEvent {
  const AdminProductUpdateSubmit();
}
