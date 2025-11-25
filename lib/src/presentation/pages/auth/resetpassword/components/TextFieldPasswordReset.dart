import 'package:ecommerce_flutter/src/presentation/pages/auth/resetpassword/bloc/ResetPasswordBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldPasswordReset extends StatelessWidget {
  ResetPasswordBloc? bloc;
  ResetPasswordState state;

  TextFieldPasswordReset(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Contraseña',
        icon: Icons.lock,
        onChanged: (text) => bloc?.add(
          ResetPasswordChanged(password: BlocFormItem(value: text)),
        ),
        validator: (value) => state.password.error,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }
}