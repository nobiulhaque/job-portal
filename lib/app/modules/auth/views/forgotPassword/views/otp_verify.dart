import 'package:ellidobra_job_portal_app/app/modules/auth/views/forgotPassword/views/widgets/otp_fields.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class OptVerifyView extends GetView<ForgotPasswordController> {
  const OptVerifyView({super.key});
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
              // Back Button
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(50.r),
                shadowColor: AppColors.primary.withAlpha(125),
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
                  'Enter the OTP sent to your email ',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 16.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              // 4 CODE OTP Text Field
              SizedBox(height: 30.h),
              SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 24,
                  children: [
                    SizedBox(
                      width: 400,
                      child: Text(
                        'Enter Code',
                        style: TextStyle(
                          color: const Color(0xFF071727),
                          fontSize: 18,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w500,
                          height: 1.11,
                          letterSpacing: -0.50,
                        ),
                      ),
                    ),
                    OtpField(controller: controller),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              Obx(
                () => Utils.primaryActionButton(
                  text: 'Send OTP',
                  icon: Icons.arrow_forward,
                  backgroundColor: AppColors.primary,
                  elevation: 4,
                  borderRadius: 20,
                  onPressed: controller.isVerifyOtpLoading.value
                      ? () {}
                      : () async {
                          // if(controller.emailTobeVerified.value.isNotEmpty){
                          //   await controller.verifyOtp();
                          //   Get.toNamed(Routes.CHNAGE_PASSWORD);
                          // }else{
                          //   await controller.verifyOtp();
                          //   Get.offAllNamed(Routes.SPLASH);
                          // }

                          await controller.verifyOtp();
                        },
                  child: controller.isVerifyOtpLoading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3.w,
                            constraints: BoxConstraints(
                              maxWidth: 24,
                              maxHeight: 24,
                              minWidth: 20,
                              minHeight: 20,
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
