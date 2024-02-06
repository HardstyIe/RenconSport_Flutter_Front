import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static final ThemeData defaultTheme = _buildTheme();
  // Blue color
  static const Color primaryColor = Color(0xFF7FAAC8);
  // Red color
  static const Color secondaryColor = Color(0xFFBB0A21);
  // Yellow color
  static const Color tertiaryColor = Color(0xFFFFE548);
  // Deep white color
  static const Color backgroundColor = Color(0xFFEEECDE);


  static ThemeData _buildTheme(){
    ThemeData baseTheme = ThemeData.light();

    TextTheme _customTextTheme = baseTheme.textTheme.copyWith(
      // Title font
      displayLarge: GoogleFonts.merriweather(
        fontSize: 34,
        fontWeight: FontWeight.bold,
        color: Colors.black, // Cou
      ),
      // Body font
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16,
        color: Colors.black,
      ),
    );

    return baseTheme.copyWith(
      primaryColor: primaryColor,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      scaffoldBackgroundColor: backgroundColor,
      textTheme: _customTextTheme,
    );
  }
}