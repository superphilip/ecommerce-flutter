import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:flutter/material.dart';

class FabSubmitProfileUpdate extends StatelessWidget {
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;

  FabSubmitProfileUpdate(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, top: 20),
      alignment: Alignment.centerRight,
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => bloc?.add(ProfileUpdateFormSubmit()),
        child: Icon(Icons.check, color: Colors.white),
      ),
    );
  }
}
