import 'package:flutter/material.dart';

class TextUpdateCategory extends StatelessWidget {
  const TextUpdateCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10),
      child: Text(
        'ACTUALIZAR CATEGORIA', 
        style: TextStyle(
          fontSize: 17
        )
      ),
    );
  }
}
