import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldNameCategory extends StatelessWidget {
  AdminCategoryCreateBloc? bloc;
  AdminCategoryCreateState state;

  TextFieldNameCategory(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      label: 'Nombre de la categoria',
      icon: Icons.category,
      onChanged: (text) => bloc?.add(AdminCategoryCretateNameChanged(name: BlocFormItem(value: text))),
      validator: (error) => state.name.error,
      color: Colors.black,
    );
  }
}