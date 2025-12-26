import 'package:ellidobra_job_portal_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  ForgotPasswordView({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.r),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(50.r),
                  shadowColor: AppColors.primary.withOpacity(0.5),
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                        size: 24.sp,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
                SizedBox(height: 24.h),

                // Title
                Text(
                  'Forgot Password',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 28.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),

                // Subtitle
                SizedBox(height: 16.h),
                SizedBox(
                  width: 400,
                  child: Text(
                    'Enter your email or phone number to reset password',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: 16.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                // Email Text Field
                SizedBox(height: 30.h),
               Utils.primaryTextFieldLabel(
                 label: 'Email or Phone',
                 placeholder: 'Enter Your Email or Phone',
                controller: emailController,
                 validator:(value)=> authController.validateEmail(value),
               ),
                SizedBox(height: 38.h),
                Utils.primaryActionButton(
                  text: 'Send OTP',
                  icon: Icons.arrow_forward,
                  backgroundColor: AppColors.primary,
                  elevation: 4,
                  borderRadius: 20,
                  onPressed: ()async {
                    // Add your submit logic here
                    // Get.toNamed(Routes.OTP_VERIFY);
                   if(formKey.currentState!.validate()){
                     controller.setEmail(emailController.text.trim());
                     if(emailController.text.isNotEmpty){
                       await controller.sendOtpToEmail();
                     }
                   }

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
