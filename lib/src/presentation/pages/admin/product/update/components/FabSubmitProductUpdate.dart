import 'package:ecommerce_flutter/src/presentation/pages/admin/product/update/bloc/AdminProductUpdateBloc.dart';
import 'package:flutter/material.dart';

class FabSubmitProductUpdate extends StatelessWidget {
  AdminProductUpdateBloc? bloc;
  AdminProductUpdateState state;

  FabSubmitProductUpdate(this.bloc, this.state, {super.key});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 30),
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          if(state.formKey?.currentState?.validate() ?? false) {
            bloc?.add(AdminProductUpdateSubmit());
          }
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}