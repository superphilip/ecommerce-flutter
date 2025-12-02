import 'package:flutter/material.dart';

class TextNewCategory extends StatelessWidget {
  const TextNewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10),
      child: Text(
        'NUEVA CATEGORIA', 
        style: TextStyle(
          fontSize: 17
        )
      ),
    );
  }
}
