import 'package:alumni_dk/core/theme/app_button_style.dart';
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
    elevatedButtonTheme: ElevatedButtonThemeData(style: AppButtonStyle.elevatedButtonStyle(context)),
    textButtonTheme: TextButtonThemeData(style: AppButtonStyle.textButtonStyle(context)),
    outlinedButtonTheme: OutlinedButtonThemeData(style: AppButtonStyle.outlinedButtonStyle(context)),
    filledButtonTheme: FilledButtonThemeData(style: AppButtonStyle.filledButtonStyle(context)),
  );
}
