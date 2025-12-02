import 'package:flutter/material.dart';

class TextNewProduct extends StatelessWidget {
  const TextNewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10),
      child: Text(
        'NUEVO PRODUCTO', 
        style: TextStyle(
          fontSize: 17
        )
      ),
    );
  }
}
