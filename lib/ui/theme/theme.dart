import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light(
      surface: AppColors.white,
      primary: AppColors.black,
      secondary: AppColors.grey
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: const ColorScheme.dark(
      surface: AppColors.black,
      primary: AppColors.white,
      secondary: AppColors.grey
  ),
);