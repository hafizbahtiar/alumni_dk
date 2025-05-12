import 'package:alumni_dk/modules/auth/pages/forgot_password_page.dart';
import 'package:alumni_dk/modules/auth/pages/login_page.dart';
import 'package:alumni_dk/profile_page.dart';
import 'package:alumni_dk/core/routes/name_route.dart';
import 'package:alumni_dk/modules/auth/pages/register_page.dart';
import 'package:alumni_dk/settings_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NameRoute.login:
        return MaterialPageRoute(builder: (_) => LoginPage(), settings: RouteSettings(name: NameRoute.login));
      case NameRoute.register:
        return MaterialPageRoute(builder: (_) => RegisterPage(), settings: RouteSettings(name: NameRoute.register));
      case NameRoute.forgotPassword:
        return MaterialPageRoute(
          builder: (_) => ForgotPasswordPage(),
          settings: RouteSettings(name: NameRoute.forgotPassword),
        );
      case NameRoute.profile:
        return MaterialPageRoute(builder: (_) => ProfilePage(), settings: RouteSettings(name: NameRoute.profile));
      case NameRoute.settings:
        return MaterialPageRoute(builder: (_) => SettingsPage(), settings: RouteSettings(name: NameRoute.settings));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Error: Route not found'))));
  }
}
