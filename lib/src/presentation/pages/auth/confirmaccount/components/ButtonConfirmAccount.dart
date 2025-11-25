import 'package:ecommerce_flutter/src/presentation/pages/auth/confirmaccount/bloc/ConfirmAccountBloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonConfirmAccount extends StatelessWidget {
  ConfirmAccountBloc? bloc;
  ConfirmAccountState state;
  final GlobalKey<FormState> formKey;

  ButtonConfirmAccount(this.bloc, this.state, this.formKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      child: DefaultButton(
        text: 'VALIDAR',
        // color: isFormValid ? Colors.green : Colors.grey,
        color: Colors.green,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            bloc?.add(ConfirmAccountSubmit());
          } else {
            Fluttertoast.showToast(
              msg: 'El formulario no es válido',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
      ),
    );
  }
}
