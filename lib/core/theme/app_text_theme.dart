import 'package:flutter/material.dart';
import 'app_colors.dart';

/// App text styles
class AppTextTheme {
  AppTextTheme._();

  // Display styles (Large headings)
  static const TextStyle displayLarge = TextStyle(
    fontSize: 30,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 28,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 24,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Headline styles
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 28,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    height: 1.29,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 22,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 20,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Title styles
  static const TextStyle titleLarge = TextStyle(
    fontSize: 18,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 16,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // Body styles
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w400,
    height: 1.62,
    color: AppColors.textSecondary,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w500,
    color: AppColors.textLight,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w400,
    height: 1.14,
    color: AppColors.textPrimary,
  );

  // Label styles
  static const TextStyle labelLarge = TextStyle(
    fontSize: 16,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 14,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 14,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  // Button styles
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 18,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 16,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 14,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  // Inter font variants (for specific use cases)
  static const TextStyle interBold = TextStyle(
    fontSize: 17.42,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle interRegular = TextStyle(
    fontSize: 18,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static final TextStyle interSemibold = TextStyle(
    fontSize: 17.42,
    fontFamily: 'DM Sans',
    fontWeight: FontWeight.w600,
    color: AppColors.whiteWithOpacity20,
  );

  // SF Pro font (for system elements)
  static  TextStyle sfProMedium = TextStyle(
    fontSize: 17,
    fontFamily: 'SF Pro',
    fontWeight: FontWeight.w500,
    height: 1.29,
    color: Colors.white,
  );
}
