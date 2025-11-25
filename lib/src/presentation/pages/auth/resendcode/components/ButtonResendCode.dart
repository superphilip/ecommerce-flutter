import 'package:ecommerce_flutter/src/presentation/pages/auth/resendcode/bloc/ResendCodeBloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonResendCode extends StatelessWidget {
  ResendCodeBloc? bloc;
  ResendCodeState state;

  ButtonResendCode(this.bloc, this.state,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
      child: DefaultButton(
        text: 'Enviar',
        // color: isFormValid ? Colors.green : Colors.grey,
        color: Colors.green,
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(ResendCodeSubmit());
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
