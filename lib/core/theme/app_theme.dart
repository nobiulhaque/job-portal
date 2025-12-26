import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';
import 'app_text_theme.dart';

/// App theme configuration
class AppTheme {
  AppTheme._();


  // Elevation/Shadow
  static List<BoxShadow> get shadowSmall => [
        const BoxShadow(
          color: AppColors.shadowLight,
          blurRadius: 10,
          offset: Offset(0, 8),
          spreadRadius: -6,
        ),
      ];

  static List<BoxShadow> get shadowMedium => [
        const BoxShadow(
          color: AppColors.shadow,
          blurRadius: 3,
          offset: Offset(0, 0),
          spreadRadius: 0,
        ),
      ];

  static List<BoxShadow> get shadowLarge => [
        const BoxShadow(
          color: AppColors.shadowLight,
          blurRadius: 25,
          offset: Offset(0, 20),
          spreadRadius: -5,
        ),
      ];

  static List<BoxShadow> get shadowPrimary => [
        const BoxShadow(
          color: AppColors.shadowPrimary,
          blurRadius: 8,
          offset: Offset(0, 3),
          spreadRadius: 0,
        ),
      ];

  static List<BoxShadow> get shadowRed => [
        const BoxShadow(
          color: AppColors.shadowRed,
          blurRadius: 12,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ];

  // Button styles
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        elevation: 0,
        shadowColor: AppColors.shadowPrimary,
      );

  static ButtonStyle get secondaryButtonStyle => ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        side: const BorderSide(width: 1, color: AppColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0,
      );

  static ButtonStyle get outlineButtonStyle => OutlinedButton.styleFrom(
        foregroundColor: AppColors.textDisabled,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        side: const BorderSide(width: 1, color: AppColors.borderLight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      );

  // Input decoration
  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        filled: true,
        fillColor: AppColors.whiteWithOpacity10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1000),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1000),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(1000),
          borderSide: const BorderSide(color: AppColors.primary),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: TextStyle(
          color: const Color(0xFFE2E2E2),
          fontSize: 11,
          fontFamily: 'SF Pro',
          fontWeight: FontWeight.w500,
          height: 1.45,
        ),
      );

  // Card decoration
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: AppColors.whiteWithOpacity05,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: shadowMedium,
      );

  static BoxDecoration cardDecorationWithBorder({Color? borderColor}) =>
      BoxDecoration(
        color: AppColors.whiteWithOpacity05,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          width: 1,
          color: borderColor ?? AppColors.border,
        ),
      );

  // Chip/Tag decoration
  static BoxDecoration get chipDecoration => BoxDecoration(
        color: AppColors.backgroundLight,
        borderRadius: BorderRadius.circular(12.r),
      );

  // Icon button decoration
  static BoxDecoration iconButtonDecoration({required Color backgroundColor}) =>
      BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
      );

  // Light theme
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: AppColors.primary,
          secondary: AppColors.primaryDark,
          surface: AppColors.background,
          error: AppColors.error,
        ),
        scaffoldBackgroundColor: AppColors.background,
        textTheme: TextTheme(
          displayLarge: AppTextTheme.displayLarge,
          displayMedium: AppTextTheme.displayMedium,
          displaySmall: AppTextTheme.displaySmall,
          headlineLarge: AppTextTheme.headlineLarge,
          headlineMedium: AppTextTheme.headlineMedium,
          headlineSmall: AppTextTheme.headlineSmall,
          titleLarge: AppTextTheme.titleLarge,
          titleMedium: AppTextTheme.titleMedium,
          titleSmall: AppTextTheme.titleSmall,
          bodyLarge: AppTextTheme.bodyLarge,
          bodyMedium: AppTextTheme.bodyMedium,
          bodySmall: AppTextTheme.bodySmall,
          labelLarge: AppTextTheme.labelLarge,
          labelMedium: AppTextTheme.labelMedium,
          labelSmall: AppTextTheme.labelSmall,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(style: primaryButtonStyle),
        outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
        inputDecorationTheme: inputDecorationTheme,
      );
}
