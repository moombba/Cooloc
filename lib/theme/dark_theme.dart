// Define dark theme
import 'package:cooloc/theme/colors.dart';
import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.dark(
    primary: primaryColor,
    secondary: secondaryColor,
    background: backgroundColor,
  ),
  fontFamily: 'Nunito',
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 15.0), // Body text minimum font size
    titleLarge: TextStyle(fontSize: 25.0), // Header minimum font size
    // Add more text styles as needed
  ),
  brightness: Brightness.dark,
  useMaterial3: true,
);
