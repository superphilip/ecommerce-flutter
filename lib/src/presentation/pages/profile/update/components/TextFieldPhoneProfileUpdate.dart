import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextfieldPhoneProfileUpdate extends StatelessWidget {
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;
  User? user;

  TextfieldPhoneProfileUpdate(this.bloc, this.state, this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Telefono',
        icon: Icons.phone,
        color: Colors.black,
        initialValue: user?.phone ?? '',
        onChanged: (text) {
          bloc?.add(ProfileUpdatePhoneChanged(phone: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.phone.error;
        },
        keyboardType: TextInputType.phone,
      ),
    );
  }
}
