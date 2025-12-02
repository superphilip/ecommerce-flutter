import 'package:ecommerce_flutter/src/domain/models/Product.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/components/CardProductFormUpdate.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/components/ImageProductOneUpdate.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/components/ImageProductTwoUpdate.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdminProductUpdateContent extends StatelessWidget {
  AdminProductUpdateBloc? bloc;
  AdminProductUpdateState state;
  Product? product;

  AdminProductUpdateContent(this.bloc, this.state, this.product, {super.key});
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          DefaultImageBackGround('assets/img/background3.jpg'),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ImageProductOneUpdate(bloc, state, product),
                      SizedBox(width: 20),
                      ImageProductTwoUpdate(bloc, state, product)
                    ]
                  ),
                  CardProductFormUpdate(bloc, state, product),
                ],
              ),
            ),
          ),
          DefaultIconBack(left: 15, top: 50)
        ],
      ),
    );
  }
}