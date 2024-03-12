import 'package:flutter/material.dart';

class AppTheme {
  static const Color white = Color(0xFFF9F4F4);
  static const Color bg = Color(0xFF0F0E0E);
  static const Color dark = Color(0xFF484646);
  static const Color black = Color(0xFF201E1E);
  static const Color red = Color(0xFF391111);
  static const Color gray = Color(0xFFDAAEAE);
  static const Color darkBlue = Color(0xFF07031F);
  static const Color purple = Color(0xFF4B2182);
  static const Color gray2 = Color(0xFF979494);
  static const Color green = Color(0xFF34C759);
  static const Color light = Color(0xFF787880);
  static const Color whiteGray = Color(0xFFC3BEBE);
  static const Color systemBlue = Color(0xFF007AFF);
  static const Color systemRed = Color(0xFFF51313);

  static final LinearGradient gradient1 = LinearGradient(
    colors: [
      const Color(0xFFC4710F).withOpacity(0.94),
      const Color(0xFFCF1F1F).withOpacity(0.89),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final LinearGradient gradient2 = LinearGradient(
    colors: [
      const Color(0xFFCD3131).withOpacity(0.92),
      const Color(0xFFBC2828).withOpacity(0.9),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final LinearGradient gradient3 = LinearGradient(
    colors: [
      const Color(0xFFD34729).withOpacity(0.94),
      const Color(0xFFCE3621).withOpacity(0.86),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final LinearGradient gradient4 = LinearGradient(
    colors: [
      const Color(0xFF7C0000).withOpacity(0.16),
      const Color(0xFF290B0B).withOpacity(0.5),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final LinearGradient gradient5 = LinearGradient(
    colors: [
      const Color(0xFF984B3C).withOpacity(0.94),
      const Color(0xFF863A2B).withOpacity(0.89),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static final LinearGradient gradient6 = LinearGradient(
    colors: [
      const Color(0xFF741C1C).withOpacity(0.79),
      const Color(0xFF680E0E).withOpacity(0.92),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
