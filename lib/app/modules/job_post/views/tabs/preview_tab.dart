import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controllers/job_post_controller.dart';

class PreviewTab extends GetView<JobPostController> {
  const PreviewTab({super.key});

  static const Color _labelColor = Color(0xFF7C7C7C);
  static const Color _valueColor = Color(0xFF071727);
  static const Color _titleColor = Color(0xFFFF8007);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        _buildPreviewItem(context, 'Job Location', 'New York, NY'),
        _buildPreviewItem(context, 'Job Category', 'Construction'),
        _buildPreviewItem(context, 'Job Type', 'Full-Time'),
        _buildPreviewItem(context, 'Job Title', 'Senior Developer'),
        _buildPreviewItem(context, 'Date', '2024-06-01'),
        _buildPreviewItem(
          context,
          'Job Description',
          'We are looking for a skilled developer to join our team. The ideal candidate will have experience in Flutter and Dart.',
        ),
        _buildPreviewItem(context, 'Budget', '\$5000 - \$7000'),
        SizedBox(height: 16.h),
        // Add job image
        ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.asset(
            'assets/images/onboarding1.png',
            width: double.infinity,
            height: 200.h,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'Preview',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: _titleColor,
        fontSize: 16.sp,
        fontFamily: 'DM Sans',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  Widget _buildPreviewItem(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: _labelColor,
              fontSize: 14.sp,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: _valueColor,
              fontSize: 14.sp,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
