import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BauhausColors {
  static const Color vermilion = Color(0xFFE63946); // Bauhaus Red
  static const Color cobalt = Color(0xFF1D3557);    // Bauhaus Blue
  static const Color sky = Color(0xFF457B9D);       // Soft Blue
  static const Color ochre = Color(0xFFE9C46A);     // Bauhaus Yellow
  static const Color deepOchre = Color(0xFFF4A261); // Warm Amber
  static const Color sage = Color(0xFF2A9D8F);      // Bauhaus Forest/Teal
  static const Color paper = Color(0xFFF7F7F4);     // Canvas Warm Off-White
  static const Color surface = Color(0xFFFFFFFF);   // Card Background
  static const Color ink = Color(0xFF121214);       // Charcoal Black
  static const Color lightGrey = Color(0xFFE9ECEF); // Subtle Border Grey
  static const Color muted = Color(0xFF555B62);     // Muted Text
}

class BauhausTheme {
  static const double borderWidth = 2.0;
  static const double shadowOffset = 4.0;
  static const double borderRadius = 0.0; // Bauhaus pure geometry

  static List<BoxShadow> get hardShadow => const [
        BoxShadow(
          color: BauhausColors.ink,
          offset: Offset(shadowOffset, shadowOffset),
          blurRadius: 0,
        ),
      ];

  static List<BoxShadow> hardShadowOffset(double offset) => [
        BoxShadow(
          color: BauhausColors.ink,
          offset: Offset(offset, offset),
          blurRadius: 0,
        ),
      ];

  static BoxDecoration get cardDecoration => BoxDecoration(
        color: BauhausColors.surface,
        border: Border.all(color: BauhausColors.ink, width: borderWidth),
        boxShadow: hardShadow,
      );

  static BoxDecoration coloredCard(Color bg) => BoxDecoration(
        color: bg,
        border: Border.all(color: BauhausColors.ink, width: borderWidth),
        boxShadow: hardShadow,
      );

  static BoxDecoration flatCard({Color bg = BauhausColors.surface}) => BoxDecoration(
        color: bg,
        border: Border.all(color: BauhausColors.ink, width: borderWidth),
      );

  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: BauhausColors.paper,
      colorScheme: ColorScheme.fromSeed(
        seedColor: BauhausColors.cobalt,
        primary: BauhausColors.cobalt,
        secondary: BauhausColors.vermilion,
        tertiary: BauhausColors.ochre,
        surface: BauhausColors.surface,
      ),
      textTheme: GoogleFonts.spaceGroteskTextTheme().copyWith(
        displayLarge: GoogleFonts.spaceGrotesk(
          fontSize: 42,
          fontWeight: FontWeight.w900,
          color: BauhausColors.ink,
          letterSpacing: -1.0,
          height: 1.1,
        ),
        displayMedium: GoogleFonts.spaceGrotesk(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: BauhausColors.ink,
          letterSpacing: -0.5,
          height: 1.15,
        ),
        displaySmall: GoogleFonts.spaceGrotesk(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: BauhausColors.ink,
          letterSpacing: -0.3,
        ),
        headlineMedium: GoogleFonts.spaceGrotesk(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: BauhausColors.ink,
        ),
        titleLarge: GoogleFonts.spaceGrotesk(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: BauhausColors.ink,
        ),
        bodyLarge: GoogleFonts.spaceGrotesk(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: BauhausColors.ink,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.spaceGrotesk(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: BauhausColors.muted,
          height: 1.45,
        ),
        labelLarge: GoogleFonts.spaceGrotesk(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
          color: BauhausColors.ink,
        ),
      ),
    );
  }
}
