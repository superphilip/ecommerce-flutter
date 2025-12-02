import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldNameProduct extends StatelessWidget {
  AdminProductCreateBloc? bloc;
  AdminProductCreateState state;

  TextFieldNameProduct(this.bloc, this.state, {super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      label: 'Nombre del producto',
      icon: Icons.category,
      onChanged: (text) => bloc?.add(AdminProductCretateNameChanged(name: BlocFormItem(value: text))),
      validator: (error) => state.name.error,
      color: Colors.black,
    );
  }
}