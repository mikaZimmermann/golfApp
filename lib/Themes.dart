import 'package:flutter/material.dart';

class Themes {
  Color lightPrimaryColor = Color.fromARGB(255, 45, 5, 69);
  Color darkPrimaryColor = Color.fromARGB(255, 164, 125, 255);
  Color secondaryColor = Color.fromARGB(255, 0, 0, 0);
  Color accentColor = Color.fromARGB(255, 255, 255, 255);

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
        primary: _themeClass.lightPrimaryColor,
        secondary: _themeClass.secondaryColor),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
        primary: _themeClass.darkPrimaryColor,
        secondary: _themeClass.accentColor),
  );
}

Themes _themeClass = Themes();
