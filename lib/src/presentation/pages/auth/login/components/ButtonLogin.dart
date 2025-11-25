import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/bloc.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonLogin extends StatelessWidget {
  LoginBloc? bloc;
  LoginState state;
  final GlobalKey<FormState> formKey;

  ButtonLogin(this.bloc, this.state, this.formKey, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 55,
      margin: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 15),
      child: DefaultButton(
        text: 'INICIAR SESIÓN',
        // color: isFormValid ? Colors.green : Colors.grey,
        color: Colors.green,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            bloc?.add(LoginSubmit());
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
