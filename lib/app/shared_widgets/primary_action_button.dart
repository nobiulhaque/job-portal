import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_theme.dart';

class PrimaryActionButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final double? elevation;
  final Size? minimumSize;
  final VoidCallback? onPressed;
  final bool isLoading;

  const PrimaryActionButton({
    super.key,
    required this.text,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
    this.elevation,
    this.minimumSize,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: minimumSize?.width ?? double.infinity,
      height: minimumSize?.height ?? 56,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          foregroundColor: textColor ?? Colors.white,
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 20),
          ),
          minimumSize: minimumSize ?? const Size(double.infinity, 56),
        ),
        child: isLoading
            ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    text,
                    style: AppTextTheme.buttonMedium.copyWith(
                      color: textColor ?? Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  if (icon != null) ...[
                    const SizedBox(width: 12),
                    Icon(icon, size: 20, color: textColor ?? Colors.white),
                  ],
                ],
              ),
      ),
    );
  }
}
