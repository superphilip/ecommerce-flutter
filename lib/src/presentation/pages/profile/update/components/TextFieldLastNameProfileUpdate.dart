import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TextfieldLastNameProfileUpdate extends StatelessWidget {
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;
  User? user;

  TextfieldLastNameProfileUpdate(this.bloc, this.state, this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      child: DefaultTextField(
        label: 'Apellido',
        icon: Icons.person,
        color: Colors.black,
        initialValue: user?.lastName ?? '',
        onChanged: (text) {
          bloc?.add(ProfileUpdateLastNameChanged(lastName: BlocFormItem(value: text)));
        },
        validator: (value) {
          return state.lastName.error;
        },
        keyboardType: TextInputType.text,
      ),
    );
  }
}
