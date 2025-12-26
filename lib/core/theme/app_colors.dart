import 'package:flutter/material.dart';

/// App color palette
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFFE63946);
  static const Color primaryDark = Color(0xFF002249);


  // border color
  static const Color softBlue = Color(0xFF2A3D5F);

  // Accent Colors
  static const Color accentBlue = Color(0xFF3889CA);
  static const Color accentYellow = Color(0xFFF6C10E);
  static const Color accentPurple = Color(0xFF9333EA);
  static const Color accentGreen = Color(0xFF16A34A);

  // Text Colors
  static const Color textPrimary = Color(0xFF071727);
  static const Color textSecondary = Color(0x7F071727);
  static const Color textTertiary = Color(0xBF071727);
  static const Color textLight = Color(0xFF7C7C7C);
  static const Color textGray = Color(0xFF434343);
  static const Color textDisabled = Color(0x66071727);

  // Background Colors
  static const Color background = Colors.white;
  static const Color backgroundDark = Color(0xFF002249);
  static const Color backgroundLight = Color(0x0C050F20);
  static const Color backgroundOverlay = Color(0x3FDDDDDD);

  // Border Colors
  static const Color border = Color(0xFF071727);
  static const Color borderLight = Color(0x4C071727);

  // Status Colors
  static const Color error = Color(0xFFE63946);
  static const Color success = Color(0xFF16A34A);
  static const Color warning = Color(0xFFF6C10E);
  static const Color info = Color(0xFF3889CA);

  // Shadow Colors
  static const Color shadow = Color(0x3F000000);
  static const Color shadowLight = Color(0x19000000);
  static const Color shadowRed = Color(0x63FF0000);
  static const Color shadowPrimary = Color(0x63E63946);
  static const Color shadowDark = Color(0x3F071727);

  // Opacity variants
  static Color get primaryWithOpacity05 => primary.withValues(alpha: 0.05);
  static Color get primaryWithOpacity20 => primary.withValues(alpha: 0.20);
  static Color get primaryWithOpacity7F => primary.withValues(alpha: 0.50);
  
  static Color get whiteWithOpacity05 => Colors.white.withValues(alpha: 0.05);
  static Color get whiteWithOpacity10 => Colors.white.withValues(alpha: 0.10);
  static Color get whiteWithOpacity20 => Colors.white.withValues(alpha: 0.20);
}
