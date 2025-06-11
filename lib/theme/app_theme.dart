import 'package:flutter/material.dart';

class AppTheme {
  static const Color _primaryLight = Color(0xFF013974);
  static const Color _primaryDark = Color(0xFFFEC68B);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _primaryLight,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: _primaryLight,
      secondary: Colors.blueAccent,
      surface: Colors.white,
      error: Colors.red,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryLight,
      foregroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _primaryLight,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _primaryDark,
    scaffoldBackgroundColor: Colors.black,
    colorScheme: ColorScheme.dark(
      primary: _primaryDark,
      secondary: Colors.orangeAccent,
      surface: Colors.grey[900]!,
      error: Colors.redAccent,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.white,
      onError: Colors.black,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: _primaryDark,
      foregroundColor: Colors.black,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: _primaryDark,
      foregroundColor: Colors.black,
    ),
  );
}
