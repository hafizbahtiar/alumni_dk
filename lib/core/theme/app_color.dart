import 'package:alumni_dk/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';

ColorScheme appColor(bool isDarkMode) {
  return ColorScheme(
    brightness: isDarkMode ? Brightness.dark : Brightness.light,
    primary: isDarkMode ? AppPallete.dark.primary : AppPallete.light.primary,
    onPrimary: isDarkMode ? AppPallete.dark.onPrimary : AppPallete.light.onPrimary,
    primaryContainer: isDarkMode ? AppPallete.dark.primaryContainer : AppPallete.light.primaryContainer,
    onPrimaryContainer: isDarkMode ? AppPallete.dark.onPrimaryContainer : AppPallete.light.onPrimaryContainer,
    secondary: isDarkMode ? AppPallete.dark.secondary : AppPallete.light.secondary,
    onSecondary: isDarkMode ? AppPallete.dark.onSecondary : AppPallete.light.onSecondary,
    secondaryContainer: isDarkMode ? AppPallete.dark.secondaryContainer : AppPallete.light.secondaryContainer,
    onSecondaryContainer: isDarkMode ? AppPallete.dark.onSecondaryContainer : AppPallete.light.onSecondaryContainer,
    tertiary: isDarkMode ? AppPallete.dark.tertiary : AppPallete.light.tertiary,
    onTertiary: isDarkMode ? AppPallete.dark.onTertiary : AppPallete.light.onTertiary,
    tertiaryContainer: isDarkMode ? AppPallete.dark.tertiaryContainer : AppPallete.light.tertiaryContainer,
    onTertiaryContainer: isDarkMode ? AppPallete.dark.onTertiaryContainer : AppPallete.light.onTertiaryContainer,
    error: isDarkMode ? AppPallete.dark.error : AppPallete.light.error,
    onError: isDarkMode ? AppPallete.dark.onError : AppPallete.light.onError,
    errorContainer: isDarkMode ? AppPallete.dark.errorContainer : AppPallete.light.errorContainer,
    onErrorContainer: isDarkMode ? AppPallete.dark.onErrorContainer : AppPallete.light.onErrorContainer,
    surface: isDarkMode ? AppPallete.dark.surface : AppPallete.light.surface,
    onSurface: isDarkMode ? AppPallete.dark.onSurface : AppPallete.light.onSurface,
    onSurfaceVariant: isDarkMode ? AppPallete.dark.onSurfaceVariant : AppPallete.light.onSurfaceVariant,
    inverseSurface: isDarkMode ? AppPallete.dark.inverseSurface : AppPallete.light.inverseSurface,
    onInverseSurface: isDarkMode ? AppPallete.dark.inverseOnSurface : AppPallete.light.inverseOnSurface,
    outline: isDarkMode ? AppPallete.dark.outline : AppPallete.light.outline,
    outlineVariant: isDarkMode ? AppPallete.dark.outlineVariant : AppPallete.light.outlineVariant,
    surfaceTint: isDarkMode ? AppPallete.dark.surfaceTint : AppPallete.light.surfaceTint,
    inversePrimary: isDarkMode ? AppPallete.dark.inversePrimary : AppPallete.light.inversePrimary,
    surfaceBright: isDarkMode ? AppPallete.dark.surfaceBright : AppPallete.light.surfaceBright,
    surfaceContainer: isDarkMode ? AppPallete.dark.surfaceContainer : AppPallete.light.surfaceContainer,
    surfaceDim: isDarkMode ? AppPallete.dark.surfaceDim : AppPallete.light.surfaceDim,
    surfaceContainerHigh: isDarkMode ? AppPallete.dark.surfaceContainerHigh : AppPallete.light.surfaceContainerHigh,
    surfaceContainerHighest:
        isDarkMode ? AppPallete.dark.surfaceContainerHighest : AppPallete.light.surfaceContainerHighest,
    surfaceContainerLow: isDarkMode ? AppPallete.dark.surfaceContainerLow : AppPallete.light.surfaceContainerLow,
    surfaceContainerLowest:
        isDarkMode ? AppPallete.dark.surfaceContainerLowest : AppPallete.light.surfaceContainerLowest,
  );
}
