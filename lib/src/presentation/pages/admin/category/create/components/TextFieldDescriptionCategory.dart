import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFielDdescriptionCategory extends StatelessWidget {
  AdminCategoryCreateBloc? bloc;
  AdminCategoryCreateState state;

  TextFielDdescriptionCategory(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      label: 'Description',
      icon: Icons.description,
      onChanged: (text) => bloc?.add(AdminCategoryCretateDescriptionChanged(description: BlocFormItem(value: text))),
      validator: (error) => state.description.error,
      color: Colors.black,
    );
  }
}