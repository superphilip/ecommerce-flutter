import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/components/CardCategoryForm.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/components/ImageCategory.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdminCategoryCreateContent extends StatelessWidget {
  AdminCategoryCreateBloc? bloc;
  AdminCategoryCreateState state;

  AdminCategoryCreateContent(this.bloc, this.state, {super.key});
  

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
                  ImageCategory(bloc, state),
                  CardCategoryForm(bloc, state),
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