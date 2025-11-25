import 'package:ecommerce_flutter/src/config/AppRouter.dart';
import 'package:flutter/material.dart';

class DefaultTextfieldResendCode extends StatelessWidget {
  const DefaultTextfieldResendCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '¿Tu código ha caducado o no lo recibiste?',
          style: TextStyle(color: Colors.white70, fontSize: 13),
        ),

        const SizedBox(height: 2),

        GestureDetector(
          onTap: () => Navigator.pushNamed(context, AppRouter.resendCodeRoute),
          child: const Text(
            'Solicitar Nuevo Código Ahora',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}