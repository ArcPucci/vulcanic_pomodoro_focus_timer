import 'package:flutter/material.dart';

class AppTheme {
  static const Color white = Color(0xFFF9F4F4);
  static const Color dark = Color(0xFF484646);

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
}
