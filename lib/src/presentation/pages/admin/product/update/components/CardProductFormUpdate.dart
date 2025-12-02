import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/components/FabSubmitProductUpdate.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/components/TextFieldDescriptionProduct.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/components/TextFieldNameProductUpdate.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/components/TextFieldPriceProductUpdate.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/components/TextUpdateProduct.dart';
import 'package:flutter/material.dart';

class CardProductFormUpdate extends StatelessWidget {
  AdminProductUpdateBloc? bloc;
  AdminProductUpdateState state;
  Product? product;
  
  CardProductFormUpdate(this.bloc, this.state, this.product, {super.key});

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
            TextUpdateProduct(),
            TextFieldNameProductUpdate(bloc, state, product),
            TextFieldDescriptionProductUpdate(bloc, state, product),
            TextFieldPriceProductUpdate(bloc, state, product),
            FabSubmitProductUpdate(bloc, state),
          ],
        ),
      ),
    );
  }
}