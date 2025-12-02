import 'package:ecommerce_flutter/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_flutter/src/domain/models/AuthResponse.dart';


class SessionManager {
  final SharedPref sharedPref;

  SessionManager(this.sharedPref);

  Future<String> getSessionToken() async {
    try {
      final userSession = await sharedPref.read('user');
      if (userSession != null) {
        final auth = AuthResponse.fromJson(userSession);
        return auth.token ?? '';
      }
      return '';
    } catch (e, st) {
      print('SessionManager.getSessionToken error: $e\n$st');
      return '';
    }
  }
}