import 'package:ecommerce_flutter/src/presentation/pages/admin/category/update/bloc/AdminCategoryUpdateBloc.dart';
import 'package:flutter/material.dart';

class FabSubmitCategoryUpdate extends StatelessWidget {
  AdminCategoryUpdateBloc? bloc;
  AdminCategoryUpdateState state;

  FabSubmitCategoryUpdate(this.bloc, this.state, {super.key});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 30),
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          if(state.formKey?.currentState?.validate() ?? false) {
            bloc?.add(AdminCategoryUpdateSubmit());
          }
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}