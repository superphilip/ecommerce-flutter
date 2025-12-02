import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldPriceProductUpdate extends StatelessWidget {
  AdminProductUpdateBloc? bloc;
  AdminProductUpdateState state;
  Product? product;

  TextFieldPriceProductUpdate(this.bloc, this.state, this.product, {super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      label: 'Precio del producto',
      icon: Icons.attach_money,
      initialValue: product?.price.toString() ?? '',
      onChanged: (text) => bloc?.add(AdminProductUpdatePriceChanged(price: BlocFormItem(value: text))),
      validator: (error) => state.price.error,
      color: Colors.black,
      keyboardType: TextInputType.number,
    );
  }
}