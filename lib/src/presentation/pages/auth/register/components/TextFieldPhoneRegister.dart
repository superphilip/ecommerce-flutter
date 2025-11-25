import 'package:ecommerce_flutter/src/presentation/pages/auth/register/bloc/bloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:ecommerce_flutter/src/utils/Constants.dart';
import 'package:flutter/material.dart';

class TextFieldPhoneRegister extends StatelessWidget {
  RegisterBloc? bloc;
  RegisterState state;

  TextFieldPhoneRegister(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Telefono',
        icon: Icons.phone,
        onChanged: (text) =>
            bloc?.add(RegisterPhoneChanged(phone: BlocFormItem(value: text))),
        validator: (value) => state.phone.error,
        formatter: kOnlyNumericFormatter,
        keyboardType: TextInputType.phone,
      ),
    );
  }
}
