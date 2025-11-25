import 'package:flutter/material.dart';

class DefaultTextFielDontHavedAccount extends StatelessWidget {
  const DefaultTextFielDontHavedAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 53,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(right: 5),
        ),
        Text('No tienes una cuenta?', style: TextStyle(color: Colors.white)),
        Container(
          width: 53,
          height: 1,
          color: Colors.white,
          margin: EdgeInsets.only(left: 5),
        ),
      ],
    );
  }
}
