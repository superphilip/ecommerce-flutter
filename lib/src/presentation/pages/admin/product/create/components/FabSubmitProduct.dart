import 'package:ecommerce_flutter/src/presentation/pages/admin/product/create/bloc/AdminProductCreateBloc.dart';
import 'package:flutter/material.dart';

class FabSubmitProduct extends StatelessWidget {
  AdminProductCreateBloc? bloc;
  AdminProductCreateState state;

  FabSubmitProduct(this.bloc, this.state, {super.key});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 30),
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          if(state.formKey?.currentState?.validate() ?? false) {
            bloc?.add(AdminProductCreateSubmit());
          }
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}