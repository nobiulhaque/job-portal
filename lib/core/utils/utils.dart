// ignore_for_file: camel_case_types
import 'package:dotted_border/dotted_border.dart';
import 'package:ellidobra_job_portal_app/core/constants/app_radius.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Utils {
  const Utils._(); // Private constructor to prevent instantiation

  // ====================== Primary Action Button ======================
  static Widget primaryActionButton({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    IconData? icon,
    Color backgroundColor = Colors.blue,
    Color textColor = Colors.white,
    Color iconColor = Colors.white,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w600,
    double elevation = 6,
    double borderRadius = 20,
    EdgeInsetsGeometry padding =
    const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    Size? minimumSize = const Size(double.infinity, 50),
    Widget? child,
  }) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      shadowColor: backgroundColor,
      child: ElevatedButton(
        key: key,
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: elevation,
          minimumSize: minimumSize,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: child ??
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    color: textColor,
                  ),
                ),
                if (icon != null) ...[
                  const SizedBox(width: 8),
                  Icon(icon, color: iconColor),
                ],
              ],
            ),
      ),
    );
  }

  // ====================== Primary TextField with Label ======================
  static Widget primaryTextFieldLabel({
    Key? key,
    required String label,
    required String placeholder,
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    dynamic maxLines = 1,
    String? suffixIcon,
    double? iconWidth,
    double? iconHeight,
    String? Function(String?)? validator,
    VoidCallback? onEditingComplete,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.primaryDark
              ),
            ),
            if (suffixIcon != null)
              Image.asset(
                suffixIcon,
                width: iconWidth ?? 24.w,
                height: iconHeight ?? 20.h,
                fit: BoxFit.contain,
              ),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          key: key,
          validator: validator,
          controller: controller,
          onChanged: onChanged,
          maxLines: maxLines,
          onEditingComplete: onEditingComplete,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(
              color: Color(0xFFBDBDBD),
              fontSize: 14,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w400,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.softBlue),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.softBlue),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.softBlue),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          style: const TextStyle(
            color: AppColors.textLight,
            fontSize: 18,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w400,
            letterSpacing: -0.50,
          ),
        ),
      ],
    );
  }

  // ====================== Custom AppBar ======================
  static PreferredSizeWidget customAppBar({
    required String title,
    required String profileImagePath,
    Color backgroundColor = const Color(0xFF071727),
    VoidCallback? onProfileTap,
  }) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        backgroundColor: backgroundColor,
        automaticallyImplyLeading: false,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GestureDetector(
              onTap: onProfileTap,
              child: Container(
                width: 40,
                height: 40,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                child: Image.asset(profileImagePath, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ====================== Search Bar ======================
  static Widget searchBar({
    Key? key,
    String hintText = 'Search...',
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
    IconData? prefixIcon = Icons.search,
    Color fillColor = const Color(0xFFFFFFFF),
    double borderRadius = 30,
    Color iconColor = const Color(0xFF999999),
    TextStyle? hintStyle,
    TextStyle? textStyle,
  }) {
    return TextField(
      key: key,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: hintStyle ??
            TextStyle(
              color: Colors.grey[400],
              fontSize: 14,
              fontFamily: 'DM Sans',
            ),
        prefixIcon: Icon(prefixIcon, color: iconColor, size: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: fillColor,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      style: textStyle ??
          const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontFamily: 'DM Sans',
          ),
    );
  }

  // ====================== Success Dialog ======================
  static Widget successDialog({
    String title = 'Congratulations !',
    String message =
    'Password Reset was successful.\nLogin with your new password now',
    String buttonText = 'Sign in',
    required VoidCallback onButtonPressed,
  }) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/Popup.png',
                  width: 160.w,
                  height: 160.h,
                ),
                SizedBox(height: 20.h),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 24.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textGray,
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: onButtonPressed,
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ====================== Primary Dropdown ======================
  static Widget primaryDropdown({
    Key? key,
    required String label,
    String? hint,
    required List<String> items,
    String? value,
    ValueChanged<String?>? onChanged,

    bool allowCustomInput = false,
    ValueChanged<String>? onItemAdded,
  }) {
    return StatefulBuilder(
      builder: (context, setState) {
        final TextEditingController controller =
        TextEditingController(text: value);

        BoxDecoration decoration = BoxDecoration(
          borderRadius: AppRadius.radius(value: 8.r),
          border: Border.all(color: AppColors.softBlue)
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryDark
            ),),
            const SizedBox(height: 12),

            /// 🔽 ComboBox Container
            Container(
              decoration: decoration,
              padding: EdgeInsets.zero,
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textValue) {
                  if (textValue.text.isEmpty) {
                    return items;
                  }
                  return items.where(
                        (item) => item
                        .toLowerCase()
                        .contains(textValue.text.toLowerCase()),
                  );
                },
                displayStringForOption: (option) => option,
                onSelected: (selection) {
                  controller.text = selection;
                  onChanged?.call(selection);
                },

                /// Input (inside dropdown)
                fieldViewBuilder: (
                    context,
                    textController,
                    focusNode,
                    onFieldSubmitted,
                    ) {
                  return TextField(
                    controller: textController,
                    focusNode: focusNode,
                    readOnly: !allowCustomInput,
                    cursorColor: AppColors.softBlue,
                    decoration: InputDecoration(
                      hintText: hint ?? 'Enter $label',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFBDBDBD)
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      focusedBorder: InputBorder.none,
                    ),
                    onSubmitted: (text) {
                      if (!allowCustomInput) return;

                      final value = text.trim();
                      if (value.isEmpty) return;

                      if (!items.contains(value)) {
                        onItemAdded?.call(value);
                      }

                      onChanged?.call(value);
                    },
                  );
                },

                /// Dropdown list
                optionsViewBuilder: (context, onSelected, options) {
                  return Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(10),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      children: options.map((option) {
                        return ListTile(
                          title: Text(option,style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryDark
                          ),),
                          onTap: () => onSelected(option),
                        );
                      }).toList(),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }




  // ====================== File Upload Dotted Border ======================
  static Widget fileUploadDottedBorder({
    Key? key,
    required String label,
    String? title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.borderLight,
                  fontSize: 18,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  height: 1.11,
                  letterSpacing: -0.50,
                ),
              ),
            ),
          DottedBorder(
            color: AppColors.borderLight,
            strokeWidth: 2,
            dashPattern: const [8, 4],
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              child: Column(
                children: [
                  Icon(
                    Icons.cloud_upload_outlined,
                    size: 48,
                    color: AppColors.borderLight,
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.borderLight,
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}