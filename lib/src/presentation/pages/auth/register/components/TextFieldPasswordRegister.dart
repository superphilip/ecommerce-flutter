import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/bloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextFieldPasswordRegister extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;

  TextFieldPasswordRegister(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Contraseña',
        icon: Icons.lock,
        onChanged: (text) => bloc?.add(
          RegisterPasswordChanged(password: BlocFormItem(value: text)),
        ),
        validator: (value) => state.password.error,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }
}
