import 'package:alumni_dk/core/constant/global_key.dart';
import 'package:alumni_dk/modules/auth/pages/login_page.dart';
import 'package:alumni_dk/shared/providers/appearance_provider.dart';
import 'package:alumni_dk/core/routes/generate_route.dart';
import 'package:alumni_dk/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<AppearanceProvider>(context, listen: false).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final watch = Provider.of<AppearanceProvider>(context, listen: true);
    final themeMode = watch.isDarkMode ? ThemeMode.dark : ThemeMode.light;

    return MaterialApp(
      title: 'Alumni DK',
      theme: appThemeData(context, false),
      darkTheme: appThemeData(context, true),
      themeMode: themeMode,
      navigatorKey: navigatorKey,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: LoginPage(),
    );
  }
}
