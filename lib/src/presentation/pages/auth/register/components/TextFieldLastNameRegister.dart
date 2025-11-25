import 'package:flutter/material.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/bloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/utils/Constants.dart';


class TextfieldLastNameRegister extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;
  TextfieldLastNameRegister(this.bloc, this.state,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Apellido',
        icon: Icons.person,
        onChanged: (text) => bloc?.add(
          RegisterLastNameChanged(lastName: BlocFormItem(value: text)),
        ),
        validator: (value) => state.lastName.error,
        formatter: kOnlyAlphabeticFormatter,
        keyboardType: TextInputType.name,
      ),
    );
  }
}
