import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: Color(0xFF54b46b),
  secondaryHeaderColor: Color(0xFF009f67),
  disabledColor: Color(0xFF6f7275),
  brightness: Brightness.dark,
  hintColor: Color(0xFFbebebe),
  cardColor: Colors.black,
  colorScheme: ColorScheme.dark(primary: Color(0xFF54b46b), secondary: Color(0xFF54b46b),    error: Color(0xFFE84D4F), // Set the error color here
  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: Color(0xFF54b46b))),
);
