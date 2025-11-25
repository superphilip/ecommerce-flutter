import 'package:ecommerce_flutter/src/presentation/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';


class AccountBlockPage extends StatelessWidget {
  final String? securityToken; 

  const AccountBlockPage({super.key, this.securityToken});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloqueo de Cuenta'),
        backgroundColor: Colors.redAccent,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.security_update_warning_outlined,
                color: Colors.red,
                size: 80,
              ),
              const SizedBox(height: 20),

              const Text(
                'ALERTA DE SEGURIDAD',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),

              const Text(
                'Si crees que tu cuenta está siendo utilizada por alguien más o has recibido un email de alerta, debes bloquear el acceso inmediatamente. Esto cerrará todas las sesiones y evitará futuros inicios de sesión.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 40),

              DefaultButton(
                text: 'CONFIRMAR BLOQUEO DE CUENTA',
                color: Colors.red,
                onPressed: () {
                  print('Disparando evento para bloquear cuenta...');
                },
              ),
              const SizedBox(height: 15),

              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancelar / Contactar Soporte',
                  style: TextStyle(color: Colors.blueGrey, fontSize: 14),
                ),
              ),
              
              const SizedBox(height: 40),

              Text(
                'Estado: BLOCKED - El acceso permanecerá congelado.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}