import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppThemes{
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.instance.white,
      primaryColor: AppColors.instance.white,
      colorScheme: const ColorScheme.light(),
      fontFamily: 'Poppins'
  );
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.instance.black,
    primaryColor: AppColors.instance.black,
    colorScheme: const ColorScheme.dark(),
    fontFamily: 'Poppins',
  );
}