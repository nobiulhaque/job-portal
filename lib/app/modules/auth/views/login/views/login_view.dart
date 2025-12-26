import 'package:ellidobra_job_portal_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:ellidobra_job_portal_app/app/routes/app_pages.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../core/constants/app_spacing.dart';
import '../../../../../../core/services/storage_services/storage_service.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSpacing.vertical100,
              Utils.primaryTextFieldLabel(
                label: 'Email or Phone',
                placeholder: 'Enter Your Email or Phone',
                controller: controller.emailController,
                validator: (value) => authController.validateEmail(value),
              ),
              SizedBox(height: 32.h),
              Utils.primaryTextFieldLabel(
                label: 'Password',
                placeholder: 'Enter Your Password',
                controller: controller.passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 22.h),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.FORGOT_PASSWORD);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.primary,
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 38.h),

              Obx(
                () => Utils.primaryActionButton(
                  text: 'Login',
                  icon: Icons.arrow_forward,
                  backgroundColor: AppColors.primary,
                  elevation: 4,
                  borderRadius: 20,
                  onPressed:controller.isLoading.value
                      ? (){} : () async {
                    await controller.login();
                    final storageService = StorageService();
                    final bool hasSeenOnboarding =
                        storageService.isOnboardingSeen;
                    if (!hasSeenOnboarding) {
                      storageService.markOnboardingSeen();
                    } else {
                      debugPrint('onboarding seen marked');
                    }
                  },
                  child: controller.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3.w,
                            constraints: BoxConstraints(maxWidth: 24,maxHeight: 24, minWidth: 20,minHeight: 20),
                          ),
                        )
                      : null,
                ),
              ),

              AppSpacing.vertical60,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t have an account?',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: '  ',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.background,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          final authController = Get.find<AuthController>();
                          authController.selectedIndex.value = 1;
                        },
                        child: Text(
                          'Signup',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: AppColors.primary,
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.vertical48,
            ],
          ),
        ),
      ),
    );
  }
}
