import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/bloc.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonRegister extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;
  
  ButtonRegister(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
      child: DefaultButton(
        text: 'REGISTRARSE',
        onPressed: () {
          if (state.formKey!.currentState!.validate()) {
            bloc?.add(RegisterFormSubmit());
          } else {
            // Muestra el Toast de advertencia
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
