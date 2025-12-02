import 'package:flutter/material.dart';

class TextUpdateProduct extends StatelessWidget {
  const TextUpdateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 35, left: 10),
      child: Text(
        'ACTUALIZAR PRODUCTO', 
        style: TextStyle(
          fontSize: 17
        )
      ),
    );
  }
}
