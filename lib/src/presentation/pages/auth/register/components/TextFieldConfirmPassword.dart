import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/bloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextfieldConfirmPassword extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;
  
  TextfieldConfirmPassword(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Confirmar Contraseña',
        icon: Icons.lock_outline,
        onChanged: (text) => bloc?.add(
          RegisterConfirmPasswordChanged(
            confirmPassword: BlocFormItem(value: text),
          ),
        ),
        validator: (value) => state.confirmPassword.error,
        keyboardType: TextInputType.visiblePassword,
        obscureText: true,
      ),
    );
  }
}
