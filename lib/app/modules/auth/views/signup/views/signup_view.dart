import 'package:ellidobra_job_portal_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:ellidobra_job_portal_app/app/modules/auth/views/signup/views/widgets/user_role_tab_bar.dart';
import 'package:ellidobra_job_portal_app/core/constants/app_spacing.dart';
import 'package:ellidobra_job_portal_app/core/services/storage_services/storage_service.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    final storage = StorageService();
    final isOnboardingSeen = storage.isOnboardingSeen;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSpacing.vertical48,

             /// Select user role section: won't be shown when the user signup for the first time
             isOnboardingSeen ? UserRoleTabBar(controller: controller,) : SizedBox.shrink(),
              AppSpacing.vertical32,
              Utils.primaryTextFieldLabel(
                label: 'Name',
                placeholder: 'Enter Your Name',
                controller: controller.nameController,
                validator:(value) => authController.validateName(value),
              ),

              SizedBox(height: 32.h),
              Utils.primaryTextFieldLabel(
                label: 'Email',
                placeholder: 'Enter Your Email',
                controller: controller.emailController,
                validator:(value)=> authController.validateEmail(value),
              ),
              SizedBox(height: 32.h),
              Utils.primaryTextFieldLabel(
                label: 'Phone (Optional)',
                placeholder: 'Enter Your Phone No',
                controller: controller.phoneController,
              ),
              SizedBox(height: 32.h),
              Utils.primaryTextFieldLabel(
                label: 'Password',
                placeholder: 'Enter Your Password',
                controller: controller.passwordController,
                validator: (value)=> authController.validatePassword(value),
              ),
              SizedBox(height: 38.h),

             Obx(()=> Utils.primaryActionButton(
               text: 'Signup',
               icon: Icons.arrow_forward,
               backgroundColor: AppColors.primary,
               elevation: 4,
               borderRadius: 20,
               onPressed: controller.isLoading.value ? (){} : () async{
                 final storageService = StorageService();
                 final bool hasSeenOnboarding =  storageService.isOnboardingSeen;
                 if(!hasSeenOnboarding){
                   storageService.markOnboardingSeen();
                 }else{
                   debugPrint('onboarding seen marked');
                 }
                 await controller.signUp();
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
             ),),

              AppSpacing.vertical60,
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account?',
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
                          authController.selectedIndex.value = 0;
                        },
                        child: Text(
                          'Login',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
              AppSpacing.vertical48
            ],
          ),
        ),
      ),
    );
  }
}


