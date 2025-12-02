import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/components/CardProductForm.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/components/ImageProductOne.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/components/ImageProductTwo.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdminProductCreateContent extends StatelessWidget {
  AdminProductCreateBloc? bloc;
  AdminProductCreateState state;

  AdminProductCreateContent(this.bloc, this.state, {super.key});
  

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
                      ImageProductOne(bloc, state),
                      SizedBox(width: 20),
                      ImageProductTwo(bloc, state)
                    ]
                  ),
                  CardProductForm(bloc, state),
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