import 'package:cooloc/theme/colors.dart';
import 'package:flutter/material.dart';

// Define light theme
final ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    secondary: secondaryColor,
  ),
  fontFamily: 'Nunito',
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 15.0), // Body text minimum font size
    titleLarge: TextStyle(fontSize: 25.0), // Header minimum font size
    // Add more text styles as needed
  ),
  brightness: Brightness.light,
  useMaterial3: true,
);

