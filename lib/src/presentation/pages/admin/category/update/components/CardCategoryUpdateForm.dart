import 'package:ecommerce_flutter/src/domain/models/Category.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/components/TextNewCategory.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/components/FabSubmitCategoryUpdate.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/components/TextFieldDescriptionCategoryUpdate.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/components/TextFieldNameCategoryUpdate.dart';
import 'package:flutter/material.dart';

class CardCategoryUpdateForm extends StatelessWidget {
  AdminCategoryUpdateBloc? bloc;
  AdminCategoryUpdateState state;
  Category? category;

  CardCategoryUpdateForm(this.bloc, this.state, this.category, {super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.44,
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
            TextNewCategory(),
            TextFieldNameCategoryUpdate(bloc, state, category),
            TextFieldDescriptionCategoryUpdate(bloc, state, category),
            FabSubmitCategoryUpdate(bloc, state),
          ],
        ),
      ),
    );
  }
}