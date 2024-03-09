import 'package:flutter/material.dart';

class AppTheme {
  static const Color white = Color(0xFFF9F4F4);
  static const Color dark = Color(0xFF484646);
  static const Color black = Color(0xFF201E1E);
  static const Color gray = Color(0xFFDAAEAE);
  static const Color whiteGray = Color(0xFFC3BEBE);

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
}
