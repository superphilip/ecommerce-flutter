import 'package:ecommerce_flutter/src/presentation/pages/auth/forgotpassword/bloc/ForgotPasswordBloc.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';

class TextfieldEmailForgotPassword extends StatelessWidget {
  ForgotPasswordBloc? bloc;
  ForgotPasswordState state;

  TextfieldEmailForgotPassword(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Correo Electrónico',
        icon: Icons.email,
        onChanged: (text) =>
            bloc?.add(ForgotPasswordEmailChanged(email: BlocFormItem(value: text))),
        validator: (value) {
          return state.email.error;
        },
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}