import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldNameProductUpdate extends StatelessWidget {
  AdminProductUpdateBloc? bloc;
  AdminProductUpdateState state;
  Product? product;

  TextFieldNameProductUpdate(this.bloc, this.state, this.product, {super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      label: 'Nombre del producto',
      initialValue: product?.name ?? '',
      icon: Icons.category,
      onChanged: (text) => bloc?.add(AdminProductUpdateNameChanged(name: BlocFormItem(value: text))),
      validator: (error) => state.name.error,
      color: Colors.black,
    );
  }
}