import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldPriceProduct extends StatelessWidget {
  AdminProductCreateBloc? bloc;
  AdminProductCreateState state;

  TextFieldPriceProduct(this.bloc, this.state, {super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTextField(
      label: 'Precio del producto',
      icon: Icons.attach_money,
      onChanged: (text) => bloc?.add(AdminProductCretatePriceChanged(price: BlocFormItem(value: text))),
      validator: (error) => state.price.error,
      color: Colors.black,
      keyboardType: TextInputType.number,
    );
  }
}