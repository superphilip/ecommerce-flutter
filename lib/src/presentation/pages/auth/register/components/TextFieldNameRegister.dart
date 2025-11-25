import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterEvent.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/RegisterState.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/DefaultTextField.dart';
import 'package:ecommerce_flutter/src/utils/Constants.dart';
import 'package:flutter/material.dart';

class TextFieldNameRegister extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;

  TextFieldNameRegister(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Nombre',
        icon: Icons.person,
        onChanged: (text) =>
            bloc?.add(RegisterNameChanged(name: BlocFormItem(value: text))),
        validator: (value) => state.name.error,
        formatter: kOnlyAlphabeticFormatter,
        keyboardType: TextInputType.name,
      ),
    );
  }
}
