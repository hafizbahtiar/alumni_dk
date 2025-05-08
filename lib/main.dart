import 'package:alumni_dk/shared/providers/app_providers.dart';
import 'package:alumni_dk/myapp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");
  await SharedPreferences.getInstance();

  runApp(MultiProvider(providers: AppProviders.providers, child: const MyApp()));
  // runApp(MyApp());
}
