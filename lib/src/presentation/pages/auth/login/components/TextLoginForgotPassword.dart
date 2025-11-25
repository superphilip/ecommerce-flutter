import 'package:ecommerce_flutter/src/config/AppRouter.dart';
import 'package:flutter/material.dart';

class TextLoginForgotPassword extends StatelessWidget {
  const TextLoginForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, AppRouter.forgotPasswordRoute),
        child: const Text(
          '¿Olvidaste tu contraseña?',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
