import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/job_post_controller.dart';

class BudgetTab extends GetView<JobPostController> {
  const BudgetTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Budget',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFFFF8007),
              fontSize: 16.sp,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        // Add your budget fields here

        Utils.primaryTextFieldLabel(
          label: 'Minimum Budget (\$)*',
          placeholder: '\$',
        ),
        SizedBox(height: 16.h),
        
        Utils.primaryTextFieldLabel(
          label: 'Maximum Budget (\$)*',
          placeholder: '\$',
        ),
      ],
    );
  }
}
