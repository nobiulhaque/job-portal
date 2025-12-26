import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ChangePasswordView extends GetView<ForgotPasswordController> {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                'Create New Password',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Color(0xFF071727),
                  fontSize: 28,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 24.h),

              Utils.primaryTextFieldLabel(
                label: 'New Password',
                placeholder: 'Enter Your New Password',
              ),
              //SizedBox between fields
              SizedBox(height: 30.h),
              Utils.primaryTextFieldLabel(
                label: 'Confirm Password',
                placeholder: 'Re-enter Your New Password',
              ),

              //Confirm Password
              SizedBox(height: 38.h),


              Utils.primaryActionButton(
                text: 'Confirm',
                icon: Icons.arrow_forward,
                backgroundColor: AppColors.primary,
                elevation: 4,
                borderRadius: 20,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Utils.successDialog(
                        onButtonPressed: () {
                          Get.back(); // Close dialog
                          Get.offAllNamed('/login');
                        },
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
