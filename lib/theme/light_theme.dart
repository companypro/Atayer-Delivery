import 'package:flutter/material.dart';


ThemeData light = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: Color(0xFF2A9849),
  secondaryHeaderColor: Color(0xFF1ED7AA),
  disabledColor: Color(0xFFA0A4A8),
  brightness: Brightness.light,
  hintColor: Color(0xFF9F9F9F),
  cardColor: Colors.white,
  colorScheme: ColorScheme.light(
    primary: Color(0xFF2A9849),
    secondary: Color(0xFF2A9849),
    error: Color(0xFFE84D4F), // Set the error color here
  ),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: Color(0xFF2A9849))),
);