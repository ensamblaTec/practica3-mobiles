import 'package:flutter/material.dart';

class StylesApp {
  static ThemeData lightTheme(BuildContext context) {
    final theme = ThemeData.light(); // obtener el thema light
    return theme.copyWith(
        // primaryColor: const Color.fromARGB(255, 0, 0, 0),
        useMaterial3: true,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              background: const Color(0xFFDD969C)
            )); // copiar la variable
  }
  static ThemeData darkTheme(BuildContext context) {
    final theme = ThemeData.dark();
    return theme.copyWith(
      useMaterial3: true,
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: const Color(0xFF3b83bd),
      )
    );
  }
}