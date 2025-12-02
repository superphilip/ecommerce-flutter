import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/components/FabSubmitCategory.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/components/TextFieldDescriptionCategory.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/components/TextFieldNameCategory.dart';
import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/components/TextNewCategory.dart';
import 'package:flutter/material.dart';

class CardCategoryForm extends StatelessWidget {
  AdminCategoryCreateBloc? bloc;
  AdminCategoryCreateState state;

  CardCategoryForm(this.bloc, this.state, {super.key});


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
            TextFieldNameCategory(bloc, state),
            TextFielDdescriptionCategory(bloc, state),
            FabSubmitCategory(bloc, state),
          ],
        ),
      ),
    );
  }
}