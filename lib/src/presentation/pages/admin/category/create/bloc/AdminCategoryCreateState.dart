part of 'AdminCategoryCreateBloc.dart';

class AdminCategoryCreateState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem description;
  final File? file;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const AdminCategoryCreateState({
    this.name = const BlocFormItem(error: 'Ingresa el nombre' ),
    this.description = const BlocFormItem(error: 'Ingresa la descripcion' ),
    this.file,
    this.formKey,
    this.response,
  });

  toCategory() => Category(
    name: name.value,
    description: description.value,
  );

  AdminCategoryCreateState resetForm() {
    return AdminCategoryCreateState(
      name: const BlocFormItem(error: 'Ingresa el nombre' ),
      description: const BlocFormItem(error: 'Ingresa la descripcion' ),
      file: null,
    );
  }

  AdminCategoryCreateState copyWith({
    BlocFormItem? name,
    BlocFormItem? description,
    File? file,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return AdminCategoryCreateState(
      name: name ?? this.name,
      description: description ?? this.description,
      file: file ?? this.file,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [name, description, file, response];
}
