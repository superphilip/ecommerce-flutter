import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:ecommerce_flutter/src/config/AppRouter.dart';
import 'package:flutter/material.dart';

const String _APP_SCHEME = 'yourapp';
const String _CONFIRM_PATH = 'auth/confirm';
const String _RESET_PASSWORD_PATH = 'auth/reset-password';
const String _ACCOUNT_bLOCK_PATH = 'auth/accountblock';
const String _PASSWORD_CHANGED = 'auth/passwordchanged';
const String _ACTIVE_SESSIONS = 'auth/activesessions';

extension NavigatorStateExtension on NavigatorState {
  RouteSettings? get currentSettings {
    Route? route;
    popUntil((r) {
      route = r;
      return true;
    }
    );
    return route?.settings; 
  }
}

class DeepLinkService {
  final GlobalKey<NavigatorState> navigatorKey;
  StreamSubscription<Uri>? _linkSubscription;
  late final Map<String, Function(Uri)> _routeHandlers;
  
  bool _isHandlingLink = false;

  DeepLinkService({required this.navigatorKey}) {
    _routeHandlers = {
      _CONFIRM_PATH.replaceAll('/', ''): _handleConfirmAccount,
      _RESET_PASSWORD_PATH.replaceAll('/', ''): _handleResetPassword,
      _ACCOUNT_bLOCK_PATH.replaceAll('/', ''): _handleAccountBlock,
      _PASSWORD_CHANGED.replaceAll('/', ''): _handlePasswordChanged,
      _ACTIVE_SESSIONS.replaceAll('/', ''): _handleActiveSessions,
    };
  }

  Future<void> initDeepLinks() async {
    final appLinks = AppLinks();

    _linkSubscription = AppLinks().uriLinkStream.listen((uri) async {
      _openAppLink(uri);
    });

    await appLinks.getInitialLink();
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
  
  bool _isCurrentRoute(String route) {
    return navigatorKey.currentState?.currentSettings?.name == route;
  }

  void _openAppLink(Uri uri) {
    print('URI COMPLETA: ${uri.toString()}');
    print('PARÁMETROS RECIBIDOS: ${uri.queryParameters}');
    final cleanPath = uri.path.replaceAll('/', '');

    if (uri.scheme != _APP_SCHEME) {
      return;
    }

    final handler = _routeHandlers[cleanPath];

    if (handler != null) {
      
      if (_isHandlingLink) return;

      _isHandlingLink = true; 

      try {
        handler(uri);
      } catch (e) {
        print('Error en DeepLink Handler: $e'); 
      } finally {
        _isHandlingLink = false; 
      }
    }
  }

  void _safePush(String route, {dynamic arguments, bool removeUntil = false}) {
    final navigator = navigatorKey.currentState;

    if (navigator != null) {
      
      if (_isCurrentRoute(route)) {
        return;
      }
      
      if (removeUntil) {
        navigator.popUntil((r) => false); 
        navigator.pushNamed(route, arguments: arguments); 
      } else {
        navigator.pushNamed(route, arguments: arguments);
      }
    }
  }

  void _handleConfirmAccount(Uri uri) {
    _safePush(AppRouter.confirmAccountRoute, removeUntil: true);
  }

  void _handleAccountBlock(Uri uri) {
    _safePush(AppRouter.accountBlockRoute, removeUntil: true); 
  }

  void _handlePasswordChanged(Uri uri) {
    _safePush(AppRouter.passwordChangedRoute, removeUntil: true);
  }

  void _handleActiveSessions(Uri uri) {
    _safePush(AppRouter.activeSessionsRoute);
  }

  void _handleResetPassword(Uri uri) {
    final notificationToken = uri.queryParameters['notificationToken'];
    _safePush(AppRouter.resetPasswordRoute, arguments: notificationToken, removeUntil: true);
  }
}