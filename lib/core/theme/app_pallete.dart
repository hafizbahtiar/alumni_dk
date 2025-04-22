import 'package:flutter/material.dart';

class AppPallete {
  static final Light light = Light();
  static final Dark dark = Dark();

  static const Color primary = Color(0xFF430858);
}

class Light {
  final Color primary = const Color(0xFF430858);
  final Color onPrimary = const Color(0xFFFFFFFF);
  final Color inversePrimary = const Color(0xFF381E72);
  final Color primaryContainer = const Color(0xFFEADDFF);
  final Color onPrimaryContainer = const Color(0xFF4F378B);

  final Color secondary = const Color(0xFF625B71);
  final Color onSecondary = const Color(0xFFFFFFFF);
  final Color secondaryContainer = const Color(0xFFE8DEF8);
  final Color onSecondaryContainer = const Color(0xFF4A4458);

  final Color tertiary = const Color(0xFF7D5260);
  final Color onTertiary = const Color(0xFFFFFFFF);
  final Color tertiaryContainer = const Color(0xFFFFD8E4);
  final Color onTertiaryContainer = const Color(0xFF633B48);

  final Color error = const Color(0xFFB3261E);
  final Color onError = const Color(0xFFFFFFFF);
  final Color errorContainer = const Color(0xFFF9DEDC);
  final Color onErrorContainer = const Color(0xFF8C1D18);

  final Color surface = const Color(0xFFF2F2F2);
  final Color onSurface = const Color(0xFF1D1B20);
  final Color onSurfaceVariant = const Color(0xFF49454F);
  final Color surfaceContainerHighest = const Color(0xFFE6E0E9);
  final Color surfaceContainerHigh = const Color(0xFFECE6F0);
  final Color surfaceContainer = const Color(0xFFF3EDF7);
  final Color surfaceContainerLow = const Color(0xFFF7F2FA);
  final Color surfaceContainerLowest = const Color(0xFFFFFFFF);
  final Color inverseSurface = const Color(0xFF322F35);
  final Color inverseOnSurface = const Color(0xFFF5EFF7);
  final Color surfaceTint = const Color(0xFF6750A4);

  final Color outline = const Color(0xFF79747E);
  final Color outlineVariant = const Color(0xFFCAC4D0);
  final Color surfaceBright = const Color(0xFFFFFFFF);
  final Color surfaceDim = const Color(0xFFE7E0EC);
}

class Dark {
  final Color primary = const Color(0xFFD0BCFF);
  final Color onPrimary = const Color(0xFF1E0032);
  final Color inversePrimary = const Color(0xFF6750A4);
  final Color primaryContainer = const Color(0xFF4A007A);
  final Color onPrimaryContainer = const Color(0xFFEADDFF);

  final Color secondary = const Color(0xFFB39DDB);
  final Color onSecondary = const Color(0xFF311B92);
  final Color secondaryContainer = const Color(0xFF512DA8);
  final Color onSecondaryContainer = const Color(0xFFD1C4E9);

  final Color tertiary = const Color(0xFFE1BEE7);
  final Color onTertiary = const Color(0xFF4A007A);
  final Color tertiaryContainer = const Color(0xFF6A1B9A);
  final Color onTertiaryContainer = const Color(0xFFF3E5F5);

  final Color error = const Color(0xFFEF9A9A);
  final Color onError = const Color(0xFFB71C1C);
  final Color errorContainer = const Color(0xFFC62828);
  final Color onErrorContainer = const Color(0xFFFFCDD2);

  final Color surface = const Color(0xFF1E1E1E);
  final Color onSurface = const Color(0xFFE0E0E0);
  final Color onSurfaceVariant = const Color(0xFFB0BEC5);
  final Color surfaceContainerHighest = const Color(0xFF2C2C2C);
  final Color surfaceContainerHigh = const Color(0xFF2C2C2C);
  final Color surfaceContainer = const Color(0xFF2C2C2C);
  final Color surfaceContainerLow = const Color(0xFF2C2C2C);
  final Color surfaceContainerLowest = const Color(0xFF1E1E1E);
  final Color inverseSurface = const Color(0xFFE0E0E0);
  final Color inverseOnSurface = const Color(0xFF1E1E1E);
  final Color surfaceTint = const Color(0xFFD0BCFF);

  final Color outline = const Color(0xFF8C8C8C);
  final Color outlineVariant = const Color(0xFF616161);
  final Color surfaceBright = const Color(0xFF1E1E1E);
  final Color surfaceDim = const Color(0xFF2C2C2C);
}
