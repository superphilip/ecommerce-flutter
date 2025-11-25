import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PasswordChangedPage extends StatelessWidget {
  const PasswordChangedPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Usamos GlobalKey<FormState> a nivel de maquetación para indicar la estructura
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Actualizar Contraseña'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Seguridad de la Cuenta',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),

                // 1. Campo Contraseña Actual
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Contraseña Actual',
                    hintText: 'Ingresa tu contraseña existente',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {},
                  // Se puede añadir validator: (value) => ...
                ),
                const SizedBox(height: 25),
                
                const Divider(),
                const SizedBox(height: 25),

                // 2. Campo Nueva Contraseña
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Nueva Contraseña',
                    hintText: 'Mínimo 8 caracteres',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),

                // 3. Campo Confirmar Nueva Contraseña
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Confirmar Nueva Contraseña',
                    hintText: 'Repite la nueva contraseña',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 40),

                // 4. Botón de Acción
                DefaultButton(
                  text: 'GUARDAR CAMBIOS',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                        print('Formulario válido. Disparando evento de cambio de password...');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}