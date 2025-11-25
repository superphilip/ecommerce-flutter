import 'package:flutter/widgets.dart';

class DefaultImageBackGround extends StatelessWidget {
  String image;

  DefaultImageBackGround(this.image,{super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.cover,
      color: Color.fromRGBO(0, 0, 0, 0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
