
import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:ecommerce_flutter/src/presentation/utils/SelectOptionImageDialog.dart';
import 'package:flutter/material.dart';

class ImageProfileUpdate extends StatelessWidget {
  ProfileUpdateBloc? bloc;
  ProfileUpdateState state;
  User? user;
  
  ImageProfileUpdate(this.bloc, this.state, this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectOptionImageDialog(context, () => bloc?.add(ProfileUpdatePickImage()), () => bloc?.add(ProfileUpdateTakePhoto())),
      child: Container(
        margin: EdgeInsets.only(top: 135),
        width: 150,
        child: AspectRatio(
          aspectRatio: 1/1,
          child: ClipOval(
            child: state.image != null && state.image!.path.isNotEmpty
            ? Image.file(
              state.image!,
              fit: BoxFit.cover,
            )
            : (user?.image != null && user!.image!.isNotEmpty)
            ? FadeInImage.assetNetwork(
              placeholder: 'assets/img/user_image.png', 
              image: user!.image!,
              fit: BoxFit.cover,
              fadeInDuration: Duration(seconds: 1),
            )
            : Image.asset(
              'assets/img/user_image.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}