import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldDescriptionProductUpdate extends StatelessWidget {
  AdminProductUpdateBloc? bloc;
  AdminProductUpdateState state;
  Product? product;

  TextFieldDescriptionProductUpdate(this.bloc, this.state, this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      label: 'Description',
      icon: Icons.description,
      initialValue: product?.description ?? '',
      onChanged: (text) => bloc?.add(AdminProductUpdateDescriptionChanged(description: BlocFormItem(value: text))),
      validator: (error) => state.description.error,
      color: Colors.black,
    );
  }
}