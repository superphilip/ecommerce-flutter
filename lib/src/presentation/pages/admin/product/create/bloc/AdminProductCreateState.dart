part of 'AdminProductCreateBloc.dart';

class AdminProductCreateState extends Equatable {
  final int idCategory;
  final BlocFormItem name;
  final BlocFormItem description;
  final BlocFormItem price;
  final File? file1;
  final File? file2;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const AdminProductCreateState({
    this.idCategory = 0,
    this.name = const BlocFormItem(error: 'Ingresa el nombre' ),
    this.description = const BlocFormItem(error: 'Ingresa la descripcion' ),
    this.price = const BlocFormItem(error: 'Ingresa el precio' ),
    this.file1,
    this.file2,
    this.formKey,
    this.response,
  });

  toProduct() => Product(
    idCategory: idCategory,
    name: name.value,
    description: description.value,
    price: double.parse(price.value),
  );

  AdminProductCreateState resetForm() {
    return AdminProductCreateState(
      name: const BlocFormItem(error: 'Ingresa el nombre' ),
      description: const BlocFormItem(error: 'Ingresa la descripcion' ),
      price: const BlocFormItem(error: 'Ingresa el precio' ),
      file1: null,
      file2: null,
    );
  }

  AdminProductCreateState copyWith({
    int? idCategory,
    BlocFormItem? name,
    BlocFormItem? description,
    BlocFormItem? price,
    File? file1,
    File? file2,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return AdminProductCreateState(
      idCategory: idCategory ?? this.idCategory,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      file1: file1 ?? this.file1,
      file2: file2 ?? this.file2,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [idCategory, name, description, price, file1, file2, response];
}
