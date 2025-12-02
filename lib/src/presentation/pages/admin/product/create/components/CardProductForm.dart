import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/components/TextFieldPriceProduct.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/components/TextNewProduct.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/components/FabSubmitProduct.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/components/TextFieldDescriptionProduct.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/components/TextFieldNameProduct.dart';
import 'package:flutter/material.dart';

class CardProductForm extends StatelessWidget {
  AdminProductCreateBloc? bloc;
  AdminProductCreateState state;

  CardProductForm(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: Column(
          children: [
            TextNewProduct(),
            TextFieldNameProduct(bloc, state),
            TextFielDdescriptionProduct(bloc, state),
            TextFieldPriceProduct(bloc, state),
            FabSubmitProduct(bloc, state),
          ],
        ),
      ),
    );
  }
}