import 'package:ecommerce_flutter/src/presentation/pages/admin/home/AdminHomePage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/acountblock/AcountBlockPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/activesessions/ActiveSessionesPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/confirmaccount/ConfirmAccountPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/forgotpassword/ForgotPasswordPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/login/LoginPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/passwordchanged/PasswordChangedPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/register/RegisterPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resendcode/ResendCodePage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/auth/resetpassword/ResetPasswordPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/roles/RolesPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/client/home/ClientHomePage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/info/ProfileInfoPage.dart';
import 'package:ecommerce_flutter/src/presentation/pages/profile/update/ProfileUpdatePage.dart';
import 'package:flutter/material.dart';

class AppRouter {
    static const String loginRoute = 'login';
    static const String registerRoute = 'register';
    static const String rolesRoute = 'roles';
    static const String confirmAccountRoute = '/auth/confirm';
    static const String resetPasswordRoute = '/auth/reset-password';
    static const String clientHomeRoute = '/client/home';
    static const String adminHomeRoute = '/admin/home';
    static const String profileInfoRoute = 'profile/info';
    static const String profileUpdateRoute = 'profile/update';
    static const String accountBlockRoute = '/auth/accountblock';
    static const String passwordChangedRoute = '/auth/passwordchanged';
    static const String activeSessionsRoute = '/auth/activesessions';
    static const String resendCodeRoute = 'auth/resendcode';
    static const String forgotPasswordRoute = 'auth/forgot-password';


    static Map<String, WidgetBuilder> getRoutes() {
        return {
            loginRoute: (context) => const LoginPage(),
            registerRoute: (context) => const RegisterPage(),
            rolesRoute: (context) => const RolesPage(),
            confirmAccountRoute: (context) => const ConfirmAccountPage(),
            clientHomeRoute: (context) => const ClientHomePage(),
            adminHomeRoute: (context) => const AdminHomePage(),
            profileInfoRoute: (context) => const ProfileInfoPage(),
            profileUpdateRoute: (context) => const ProfileUpdatePage(),
            accountBlockRoute: (context) => const AccountBlockPage(),
            passwordChangedRoute: (context) => const PasswordChangedPage(),
            activeSessionsRoute: (context) => const ActiveSessionsPage(),
            resendCodeRoute: (context) => const ResendCodePage(),
            forgotPasswordRoute: (context) => const ForgotPasswordPage(),

            resetPasswordRoute: (context) => ResetPasswordPage(notificationToken: null),
        };
    }

    static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
        
        if (settings.name?.startsWith(resetPasswordRoute) == true) {
            
            final fullUri = Uri.parse(settings.name!); 
            
            final notificationToken = fullUri.queryParameters['notificationToken']; 

            return MaterialPageRoute(
                builder: (context) => ResetPasswordPage(notificationToken: notificationToken),
            );
        }
        
        final routes = getRoutes();
        final builder = routes[settings.name];

        if (builder != null) {
            return MaterialPageRoute(builder: builder);
        }

        return null;
    }
}