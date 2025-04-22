import 'package:alumni_dk/core/theme/app_color.dart';
import 'package:alumni_dk/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

ThemeData appThemeData(BuildContext context, bool isDarkMode) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: appColor(isDarkMode),
    primaryColor: AppPallete.primary,
    primaryColorLight: AppPallete.light.primary,
    primaryColorDark: AppPallete.dark.primary,
    dividerColor: Colors.transparent,
  );
}
