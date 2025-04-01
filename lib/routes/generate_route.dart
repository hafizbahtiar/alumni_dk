import 'package:alumni_dk/main_page.dart';
import 'package:alumni_dk/profile_page.dart';
import 'package:alumni_dk/routes/name_route.dart';
import 'package:alumni_dk/settings_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NameRoute.root:
        return MaterialPageRoute(builder: (_) => const MainPage(), settings: RouteSettings(name: NameRoute.root));
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
