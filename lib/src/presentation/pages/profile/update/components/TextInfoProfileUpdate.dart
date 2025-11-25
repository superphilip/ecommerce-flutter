import 'package:flutter/material.dart';

class TextInfoProfileUpdate extends StatelessWidget {
  const TextInfoProfileUpdate({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 25, left: 35, bottom: 15),
      child: Text(
        'ACTUALIZAR INFORMACIÓN',
        
        style: TextStyle(
          fontSize: 17
        ),
      ),
    );
  }
}