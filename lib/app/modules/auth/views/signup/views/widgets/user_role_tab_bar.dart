import 'package:ellidobra_job_portal_app/app/modules/auth/views/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../../core/constants/app_radius.dart';
import '../../../../../../../core/theme/app_colors.dart';

class UserRoleTabBar extends StatelessWidget {
  const UserRoleTabBar({super.key, required this.controller});

  final SignupController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select account type',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontFamily: 'DM Sans',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors.primaryDark,
          ),
        ),
        12.verticalSpace,
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 12.w,
            children: List.generate(controller.roles.length, (index) {
              final userRole = controller.roles[index];
              final isSelected = userRole == controller.selectedUserRole.value;

              return buildUserRoleContainer(
                context: context,
                title: userRole,
                icon: isSelected
                    ? Icons.radio_button_checked
                    : Icons.radio_button_off,
                onTap: () {
                  controller.selectedUserRole.value = userRole;
                  debugPrint('selected user role: $userRole');
                },
              );
            }),
          ),
        ),
      ],
    );
  }

  Expanded buildUserRoleContainer({
    required BuildContext context,
    String? title,
    IconData? icon,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: AppRadius.radius(value: 10.r),
            border: Border.all(color: AppColors.softBlue),
          ),
          child: Wrap(
            spacing: 8.w,
            children: [
              Icon(icon, color: AppColors.softBlue, size: 24.r),
              Text(
                title ?? '',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Color(0xFF071727),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
