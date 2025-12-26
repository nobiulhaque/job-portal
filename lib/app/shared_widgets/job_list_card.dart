import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobListCard extends StatelessWidget {
  final String title;
  final String category;
  final String location;
  final String jobType;
  final String budget;
  final String description;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const JobListCard({
    super.key,
    required this.title,
    required this.category,
    required this.location,
    required this.jobType,
    required this.budget,
    required this.description,
    this.onEdit,
    this.onDelete,
  });

  Widget _buildMetadataPill(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: ShapeDecoration(
        color: const Color(0x0C050F20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: const Color(0xFF071727),
          fontSize: 12.sp,
          fontFamily: 'DM Sans',
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h, left: 20.w, right: 20.w),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: AppColors.primary,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: const Color(0xFF071727),
                  fontSize: 20.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 12.h),
      
              // Category Pill
              _buildMetadataPill(category),
              SizedBox(height: 12.h),
      
              // Location, Job Type, Budget Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 10.w,
                  children: [
                    _buildMetadataPill(location),
                    _buildMetadataPill(jobType),
                    _buildMetadataPill(budget),
                  ],
                ),
              ),
              SizedBox(height: 12.h),
      
              // Description
              Text(
                description,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: const Color(0xFF071727),
                  fontSize: 13.sp,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 12.h),
      
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: Utils.primaryActionButton(
                      backgroundColor: AppColors.primary,
                      text: 'Delete',
                      elevation: 2,
                      icon: Icons.delete_outline,
                      onPressed: onDelete ?? () {},
                      fontSize: 13.sp,
                      borderRadius: 8.r,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Utils.primaryActionButton(
                      backgroundColor: AppColors.background,
                      textColor: AppColors.primary,
                      iconColor: AppColors.primary,
                      text: 'Edit',
                      elevation: 2,
                      icon: Icons.edit,
                      onPressed: onEdit ?? () {},
                      fontSize: 13.sp,
                      borderRadius: 8.r,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

