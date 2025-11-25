import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/components/components.dart';

import 'package:flutter/material.dart';

class CardProfileUpdate extends StatelessWidget {
  User? user;
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;

  CardProfileUpdate(this.bloc, this.state, this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.41,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.7),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35)
        )
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            TextInfoProfileUpdate(),
            TextfieldNameProfileUpdate(bloc, state, user),
            TextfieldLastNameProfileUpdate(bloc, state, user),
            TextfieldPhoneProfileUpdate(bloc, state, user),
            FabSubmitProfileUpdate(bloc, state)
          ],
        ),
      ),
    );
  }
}