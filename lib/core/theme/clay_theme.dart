import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClayColors {
  static const Color background = Color(0xFFF0EDE8);
  static const Color surface = Color(0xFFFBF8FF);
  static const Color primary = Color(0xFF2F6192); // Soft Blue Clay
  static const Color primaryContainer = Color(0xFF6C9BCF);
  static const Color onPrimaryContainer = Color(0xFF003256);
  static const Color secondary = Color(0xFF006C4B); // Soft Green Clay
  static const Color secondaryContainer = Color(0xFF8AF8C5);
  static const Color onSecondaryContainer = Color(0xFF007350);
  static const Color accent = Color(0xFFEF6461); // Soft Coral Clay (from Danger button)
  static const Color tertiary = Color(0xFF7F5604);
  static const Color tertiaryContainer = Color(0xFFC08F3E);
  static const Color error = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onSurface = Color(0xFF161A32);
  static const Color onSurfaceVariant = Color(0xFF42474F);
  static const Color outline = Color(0xFF727780);
  static const Color outlineVariant = Color(0xFFC2C7D0);

  static const Color shadowDark = Color(0x66A3B1C6); // rgba(163, 177, 198, 0.4)
  static const Color shadowLight = Color(0x99FFFFFF); // rgba(255, 255, 255, 0.6)
}

class ClayTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ClayColors.primary,
      surface: ClayColors.surface,
      onSurface: ClayColors.onSurface,
      primary: ClayColors.primary,
      secondary: ClayColors.secondary,
      error: ClayColors.error,
    ),
    scaffoldBackgroundColor: ClayColors.background,
    textTheme: GoogleFonts.nunitoSansTextTheme(),
  );
}
