import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldDescriptionCategoryUpdate extends StatelessWidget {
  AdminCategoryUpdateBloc? bloc;
  AdminCategoryUpdateState state;
  Category? category;

  TextFieldDescriptionCategoryUpdate(this.bloc, this.state, this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      label: 'Description',
      icon: Icons.description,
      initialValue: category?.description ?? '',
      onChanged: (text) => bloc?.add(AdminCategoryUpdateDescriptionChanged(description: BlocFormItem(value: text))),
      validator: (error) => state.description.error,
      color: Colors.black,
    );
  }
}