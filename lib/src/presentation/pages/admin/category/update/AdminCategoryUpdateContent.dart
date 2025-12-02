import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/components/CardCategoryUpdateForm.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/components/ImageCategoryUpdate.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdminCategoryUpdateContent extends StatelessWidget {
  AdminCategoryUpdateBloc? bloc;
  AdminCategoryUpdateState state;
  Category? category;

  AdminCategoryUpdateContent(this.bloc, this.state, this.category, {super.key});
  

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
                  ImageCategoryUpdate(bloc, state, category),
                  CardCategoryUpdateForm(bloc, state, category),
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