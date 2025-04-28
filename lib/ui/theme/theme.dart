import 'dart:ui';

import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightOnPrimary,
    primaryContainer: AppColors.lightPrimaryContainer,
    onPrimaryContainer: AppColors.lightOnPrimaryContainer,
    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightOnSecondary,
    secondaryContainer: AppColors.lightSecondaryContainer,
    onSecondaryContainer: AppColors.lightOnSecondaryContainer,
    tertiary: AppColors.lightTertiary,
    onTertiary: AppColors.lightOnTertiary,
    tertiaryContainer: AppColors.lightTertiaryContainer,
    onTertiaryContainer: AppColors.lightOnTertiaryContainer,
    error: AppColors.lightError,
    onError: AppColors.lightOnError,
    errorContainer: AppColors.lightErrorContainer,
    onErrorContainer: AppColors.lightOnErrorContainer,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightOnSurface,
    surfaceContainerHighest: AppColors.lightSurfaceContainerHighest,
    outline: AppColors.lightOutline,
    shadow: AppColors.lightShadow,
    surfaceTint: AppColors.lightSurfaceTint,
    brightness: Brightness.light,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 2,
    centerTitle: true,
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    primaryContainer: AppColors.darkPrimaryContainer,
    onPrimaryContainer: AppColors.darkOnPrimaryContainer,
    secondary: AppColors.darkSecondary,
    onSecondary: AppColors.darkOnSecondary,
    secondaryContainer: AppColors.darkSecondaryContainer,
    onSecondaryContainer: AppColors.darkOnSecondaryContainer,
    tertiary: AppColors.darkTertiary,
    onTertiary: AppColors.darkOnTertiary,
    tertiaryContainer: AppColors.darkTertiaryContainer,
    onTertiaryContainer: AppColors.darkOnTertiaryContainer,
    error: AppColors.darkError,
    onError: AppColors.darkOnError,
    errorContainer: AppColors.darkErrorContainer,
    onErrorContainer: AppColors.darkOnErrorContainer,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
    surfaceContainerHighest: AppColors.darkSurfaceContainerHighest,
    outline: AppColors.darkOutline,
    shadow: AppColors.darkShadow,
    surfaceTint: AppColors.darkSurfaceTint,
    brightness: Brightness.dark,
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 4,
    centerTitle: true,
  ),
);