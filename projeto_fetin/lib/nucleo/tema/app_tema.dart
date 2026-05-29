import 'package:flutter/material.dart';
import 'app_cores.dart';

class AppTema {
  static ThemeData lightTheme = ThemeData(//tema global do aplicativo
    scaffoldBackgroundColor: Colors.white,

    primaryColor: AppCores.primary,

    fontFamily: 'Poppins',

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppCores.primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppCores.primary,
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),
  );
}