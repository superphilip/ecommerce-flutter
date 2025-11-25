
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/components/CardProfileUpdate.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/components/ImageProfileUpdate.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Profileupdatecontent extends StatelessWidget {
  User? user;
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;
  
  Profileupdatecontent(this.bloc, this.state, this.user, {super.key});



  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        alignment: Alignment.center,
        children: [
          DefaultImageBackGround('assets/img/background3.jpg'),
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImageProfileUpdate(bloc, state, user),
                  // Spacer(),
                  CardProfileUpdate(bloc, state, user)
                ],
              ),
            ),
          ),
          DefaultIconBack(left: 15, top: 50)
        ],
      ),
    );
  }
}