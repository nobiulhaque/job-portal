import 'package:ellidobra_job_portal_app/app/routes/app_pages.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/job_payment_controller.dart';

class JobPaymentView extends GetView<JobPaymentController> {
  const JobPaymentView({super.key});
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
                Utils.primaryTextFieldLabel(
                  label: 'Email',
                  placeholder: 'Enter your email',
                ),

                SizedBox(height: 16.h),
                Utils.primaryTextFieldLabel(
                  label: 'Card Number',
                  suffixIcon: 'assets/icon/cards.png',
                  iconWidth: 100.w,
                  iconHeight: 16.h,
                  placeholder: '1234 1234 1234 1234',
                ),

                SizedBox(height: 16.h),
                Row(
                  children: [
                    Expanded(
                      child: Utils.primaryTextFieldLabel(
                        label: 'Expiry Date',
                        placeholder: 'MM / YY',
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Utils.primaryTextFieldLabel(
                        label: 'CVC',
                        placeholder: '123',
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),
                Utils.primaryTextFieldLabel(
                  label: 'Cardholder Name',
                  placeholder: 'Enter cardholder name',
                ),

                SizedBox(height: 16.h),
                Utils.primaryTextFieldLabel(
                  label: 'Country or Region',
                  placeholder: 'Select Country or Region',
                ),
                SizedBox(height: 16.h),
                Utils.primaryTextFieldLabel(
                  label: 'Zip Code',
                  placeholder: 'Enter Zip Code',
                ),
                SizedBox(height: 30.h),
                Utils.primaryActionButton(
                  text: 'Pay Now',
                  backgroundColor: AppColors.primary,
                  borderRadius: 8.r,
                  onPressed: () {
                    // Handle payment action
                    Get.dialog(
                      Utils.successDialog(
                        title: 'Success!',
                        message: 'Successfully Complete Your Job Post !',
                        buttonText: 'OK',
                        onButtonPressed: () {
                          Get.back(); // Close dialog
                          Get.offAllNamed(Routes.HOME);
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
