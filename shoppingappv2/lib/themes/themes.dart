import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.white,
    onPrimary: Colors.black,
    onSecondary: Colors.grey.shade600,
  ),
);

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade600,
    secondary: Colors.grey.shade100,
    onPrimary: Colors.black,
  ),
);
