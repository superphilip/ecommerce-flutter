import 'package:ecommerce_flutter/src/presentation/pages/auth/resetpassword/bloc/ResetPasswordBloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonReset extends StatelessWidget {
  ResetPasswordBloc? bloc;
  ResetPasswordState state;
  final GlobalKey<FormState> formKey;
  
  ButtonReset(this.bloc, this.state, this.formKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
      child: DefaultButton(
        text: 'RESETEAR CONTRASEÑA',
        onPressed: () {
          if (formKey.currentState!.validate()) {
            bloc?.add(ResetPasswordSubmit());
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
