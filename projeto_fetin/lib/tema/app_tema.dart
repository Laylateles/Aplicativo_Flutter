import 'package:flutter/material.dart';
import 'app_cores.dart';

class AppTema {
  static ThemeData lightTheme = ThemeData(//tema global do aplicativo
    scaffoldBackgroundColor: AppCores.branco,

    primaryColor: AppCores.roxoMeioTermo,

    fontFamily: 'Poppins',

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppCores.roxoMeioTermo,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppCores.roxoMeioTermo,
        foregroundColor: AppCores.branco,
        minimumSize: const Size(double.infinity, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    ),
  );
}