import 'package:ecommerce_flutter/src/domain/models/User.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/components/CardProfileInfo.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/components/ImageProfile.dart';
import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileInfoContent extends StatelessWidget {
  User? user;
  ProfileInfoContent(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        DefaultImageBackGround('assets/img/background3.jpg'),
        Column(
          children: [
            ImageProfile(user),
            Spacer(),
            CardProfileInfo(user)
          ],
        ),
      ],
    );
  }
}