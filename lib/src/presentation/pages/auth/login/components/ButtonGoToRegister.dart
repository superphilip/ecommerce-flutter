import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';

class ButtonGoToRegister extends StatelessWidget {
  const ButtonGoToRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      margin: EdgeInsets.only(left: 25, right: 25, top: 15),
      child: DefaultButton(
        text: 'REGISTRATE',
        onPressed: () => Navigator.pushNamed(context, 'register')
      ),
    );
  }
}
