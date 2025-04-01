import 'package:alumni_dk/app_providers.dart';
import 'package:alumni_dk/myapp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  runApp(MultiProvider(providers: AppProviders.providers, child: const MyApp()));
  // runApp(MyApp());
}
