import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/bloc/bloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';

class TextFieldPasswordLogin extends StatelessWidget {
  LoginBloc? bloc;
  LoginState state;
  TextFieldPasswordLogin(this.bloc, this.state,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Contraseña',
        icon: Icons.lock,
        // errorText: snapshot.data,
        onChanged: (text) => bloc?.add(
          LoginPasswordChanged(password: BlocFormItem(value: text)),
        ),
        obscureText: true,
        validator: (value) {
          return state.password.error;
        },
        keyboardType: TextInputType.visiblePassword,
      ),
    );
  }
}
