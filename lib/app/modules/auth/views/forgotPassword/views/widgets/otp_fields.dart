import 'package:ellidobra_job_portal_app/app/modules/auth/views/forgotPassword/controllers/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../../../core/theme/app_colors.dart';




class OtpField extends StatelessWidget {

  final ForgotPasswordController controller;

  const OtpField({
    super.key, required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: PinCodeTextField(
        // controller: controller.otpController,
        length: 6,
        obscureText: false,
        cursorColor: Colors.red,
        animationType: AnimationType.fade,
        controller: controller.otpController,
        textStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColors.softBlue
        ),

        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8.r),
          borderWidth: 1,
          fieldHeight: 38.h,
          fieldWidth: 45.w,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
          activeColor: Colors.green,
          inactiveColor: AppColors.softBlue,
          selectedColor: AppColors.softBlue,
        ),

        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        appContext: context,

        onChanged: (value) {
          // controller.text = value;
        },
      ),
    );
  }
}