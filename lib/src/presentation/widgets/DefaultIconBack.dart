import 'package:flutter/material.dart';

class DefaultIconBack extends StatelessWidget {
  double left;
  double top;
  Function()? onPressed;


  DefaultIconBack({required this.left, required this.top, this.onPressed,super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: Container(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: onPressed ?? () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, size: 35, color: Colors.white),
        ),
      ),
    );
  }
}
