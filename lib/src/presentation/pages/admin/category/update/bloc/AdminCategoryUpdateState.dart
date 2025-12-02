part of 'AdminCategoryUpdateBloc.dart';

class AdminCategoryUpdateState extends Equatable {
  final int id;
  final BlocFormItem name;
  final BlocFormItem description;
  final File? file;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  const AdminCategoryUpdateState({
    this.id = 0,
    this.name = const BlocFormItem(error: 'Ingresa el nombre' ),
    this.description = const BlocFormItem(error: 'Ingresa la descripcion' ),
    this.file,
    this.formKey,
    this.response,
  });

  AdminCategoryUpdateState resetForm() {
    return AdminCategoryUpdateState(
      file: null,
    );
  }

  toCategory() => Category(
    id: id,
    name: name.value,
    description: description.value,
  );



  AdminCategoryUpdateState copyWith({
    int? id,
    BlocFormItem? name,
    BlocFormItem? description,
    File? file,
    GlobalKey<FormState>? formKey,
    Resource? response,
  }) {
    return AdminCategoryUpdateState(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      file: file ?? this.file,
      formKey: formKey,
      response: response,
    );
  }

  @override
  List<Object?> get props => [id, name, description, file, response];
}
