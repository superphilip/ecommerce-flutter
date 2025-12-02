import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldNameCategoryUpdate extends StatelessWidget {
  AdminCategoryUpdateBloc? bloc;
  AdminCategoryUpdateState state;
  Category? category;

  TextFieldNameCategoryUpdate(this.bloc, this.state, this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      label: 'Nombre de la categoria',
      icon: Icons.category,
      initialValue: category?.name ?? '',
      onChanged: (text) => bloc?.add(AdminCategoryUpdateNameChanged(name: BlocFormItem(value: text))),
      validator: (error) => state.name.error,
      color: Colors.black,
    );
  }
}