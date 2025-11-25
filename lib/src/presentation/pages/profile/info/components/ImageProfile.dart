import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:flutter/material.dart';

class ImageProfile extends StatelessWidget {
  User? user;
  
  ImageProfile(this.user,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 135),
      width: 150,
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: ClipOval(
          child: (user != null && user?.image != null && user!.image!.isNotEmpty)
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
    );
  }
}
