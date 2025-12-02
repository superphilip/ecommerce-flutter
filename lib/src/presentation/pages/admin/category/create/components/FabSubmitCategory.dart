import 'package:ecommerce_flutter/src/presentation/pages/admin/category/create/bloc/AdminCategoryCreateBloc.dart';
import 'package:flutter/material.dart';

class FabSubmitCategory extends StatelessWidget {
  AdminCategoryCreateBloc? bloc;
  AdminCategoryCreateState state;

  FabSubmitCategory(this.bloc, this.state, {super.key});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 30),
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          if(state.formKey?.currentState?.validate() ?? false) {
            bloc?.add(AdminCategoryCreateSubmit());
          }
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}