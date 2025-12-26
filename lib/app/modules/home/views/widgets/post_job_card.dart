import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/utils/utils.dart' ;
import '../../../../routes/app_pages.dart';


class PostJobCard extends StatelessWidget {
  const PostJobCard();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(14.r),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: ShapeDecoration(
          color: Colors.white.withAlpha(13),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: const Color(0x4C3889CA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Icon(
                Icons.work_outline,
                color: Color(0xFF3889CA),
                size: 20,
              ),
            ),
            SizedBox(height: 10.h),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Ready to post your Job',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF071727),
                    fontSize: 22.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Describe what you need done and receive\nbids from qualified contractors in few minutes',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0x99071727),
                    fontSize: 13.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Utils.primaryActionButton(
              text: 'Post a Job',
              backgroundColor: AppColors.primary,
              textColor: Colors.white,
              icon: Icons.add,
              borderRadius: 8.r,
              onPressed: () {
                // Handle post job action
                Get.toNamed(Routes.JOB_ONBOARDING);
                // Get.toNamed('/job-post');
              },
            ),
          ],
        ),
      ),
    );
  }
}