import 'package:ellidobra_job_portal_app/app/routes/app_pages.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ellidobra_job_portal_app/app/modules/job_post/views/widgets/step_indicator.dart';
import 'package:ellidobra_job_portal_app/app/modules/job_post/views/tabs/job_details_tab.dart';
import 'package:ellidobra_job_portal_app/app/modules/job_post/views/tabs/budget_tab.dart';
import 'package:ellidobra_job_portal_app/app/modules/job_post/views/tabs/preview_tab.dart';
import '../controllers/job_post_controller.dart';

class JobPostView extends GetView<JobPostController> {
  const JobPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20.h),
                Image.asset('assets/images/logo.png', width: 200.w),
                SizedBox(height: 20.h),
                Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(16.r),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade200),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Obx(() {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StepIndicator(
                              currentStep: controller.currentStep.value,
                              totalSteps: 3,
                            ),
                            if (controller.currentStep.value == 1)
                              JobDetailsTab(),
                            if (controller.currentStep.value == 2) BudgetTab(),
                            if (controller.currentStep.value == 3) PreviewTab(),
                            SizedBox(height: 24.h),
                            _buildNavigationButtons(),
                            SizedBox(height: 30.h),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Obx(() {
      bool isLastStep = controller.currentStep.value == 3;
      bool isFirstStep = controller.currentStep.value == 1;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!isFirstStep)
            Expanded(
              child: Utils.primaryActionButton(
                text: isLastStep ? 'Edit' : 'Back',
                borderRadius: 8.r,
                elevation: 2,
                icon: isLastStep ? Icons.edit : Icons.arrow_back,
                iconColor: AppColors.borderLight,
                textColor: AppColors.borderLight,
                backgroundColor: AppColors.background,
                onPressed: isLastStep
                    ? () {
                        controller.currentStep.value = 1;
                      }
                    : controller.previousStep,
              ),
            ),
          if (!isFirstStep) SizedBox(width: 16.w),
          Expanded(
            child: Utils.primaryActionButton(
              text: isLastStep ? 'Submit' : 'Next',
              borderRadius: 8.r,
              backgroundColor: AppColors.primary,
              elevation: 2,
              icon: isLastStep ? Icons.check : Icons.arrow_forward,
              onPressed: isLastStep
                  ? () {
                      Get.toNamed(Routes.JOB_PAYMENT);
                    }
                  : controller.nextStep,
            ),
          ),
        ],
      );
    });
  }
}
