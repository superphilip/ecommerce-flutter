import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/bloc.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';

class TextFieldEmailRegister extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;

  TextFieldEmailRegister(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Email',
        icon: Icons.email,
        onChanged: (text) =>
            bloc?.add(RegisterEmailChanged(email: BlocFormItem(value: text))),
        validator: (value) => state.email.error,
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }
}
