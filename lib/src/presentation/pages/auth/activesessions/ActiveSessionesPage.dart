import 'package:ecommerce_flutter/src/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';


class SessionModel {
  final String deviceType;
  final String location;
  final DateTime lastAccessedAt;
  final bool isCurrent;

  SessionModel({
    required this.deviceType,
    required this.location,
    required this.lastAccessedAt,
    this.isCurrent = false,
  });
  
  static List<SessionModel> getDummySessions() {
    return [
      SessionModel(
        deviceType: 'iPhone 15 Pro Max',
        location: 'Caracas, Venezuela',
        lastAccessedAt: DateTime.now(),
        isCurrent: true,
      ),
      SessionModel(
        deviceType: 'Chrome Browser on Mac',
        location: 'Bogotá, Colombia',
        lastAccessedAt: DateTime.now().subtract(const Duration(hours: 3)),
      ),
      SessionModel(
        deviceType: 'Android Samsung S22',
        location: 'Madrid, España',
        lastAccessedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ];
  }
}

class ActiveSessionsPage extends StatelessWidget {
  const ActiveSessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Datos Dummy para la maquetación
    final dummySessions = SessionModel.getDummySessions();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sesiones Activas'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          // 1. Listado de Sesiones
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              itemCount: dummySessions.length,
              itemBuilder: (context, index) {
                final session = dummySessions[index];
                return _SessionTile(session: session);
              },
            ),
          ),
          
          // 2. Botón de Seguridad (Sección fija inferior)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: DefaultButton(
              text: 'CERRAR SESIÓN EN TODOS LOS DISPOSITIVOS',
              color: Colors.red,
              onPressed: () {
                // Aquí iría la llamada a context.read<SessionBloc>().add(LogoutAllRequested())
                print('Botón de Logout All Presionado (Solo UI)');
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------
// Widget Individual de Sesión
// ------------------------------------------------------------------

class _SessionTile extends StatelessWidget {
  final SessionModel session;

  const _SessionTile({required this.session});

  @override
  Widget build(BuildContext context) {
    final bool isCurrent = session.isCurrent;
    
    return ListTile(
      leading: Icon(
        isCurrent ? Icons.phone_android_rounded : Icons.security_outlined,
        color: isCurrent ? Colors.green.shade600 : Colors.blueGrey,
      ),
      title: Text(
        session.deviceType,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ubicación: ${session.location}'),
          Text('Última actividad: ${session.lastAccessedAt.toLocal().toString().substring(0, 16)}'),
        ],
      ),
      trailing: Text(
        isCurrent ? 'ACTIVA AHORA' : '',
        style: TextStyle(
          color: isCurrent ? Colors.green : Colors.transparent,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
      onTap: () {
        // Lógica para mostrar detalles o cerrar solo esta sesión
        print('Sesión tocada: ${session.deviceType}');
      },
    );
  }
}