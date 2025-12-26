import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BidsCard extends StatelessWidget {
  final String profileImage;
  final String workerName;
  final String title;
  final String location;
  final String budget;
  final String description;
  final VoidCallback? onViewDetails;
  final VoidCallback? onHire;

  const BidsCard({
    super.key,
    required this.profileImage,
    required this.workerName,
    required this.title,
    required this.location,
    required this.budget,
    required this.description,
    this.onViewDetails,
    this.onHire,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.primary),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Worker Info Row
              Row(
                children: [
                  // Profile Avatar
                  Container(
                    width: 40.w,
                    height: 40.w,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(99),
                      ),
                    ),
                    child: Image.asset(profileImage, fit: BoxFit.cover),
                  ),
                  SizedBox(width: 12.w),
                  // Name and Title
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          workerName,
                          style: TextStyle(
                            color: const Color(0xFF071727),
                            fontSize: 16.sp,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: const Color(0xFF071727),
                            fontSize: 14.sp,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
      
              // Location Pill
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16.r,
                        color: const Color(0xFF071727),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        location,
                        style: TextStyle(
                          color: const Color(0xFF071727),
                          fontSize: 14.sp,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
      
              // Budget Pill
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  budget,
                  style: TextStyle(
                    color: const Color(0xFF071727),
                    fontSize: 14.sp,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w600,
                  ),
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
                      backgroundColor: AppColors.background,
                      text: 'View Details',
                      elevation: 2,
                      textColor: AppColors.primary,
                      iconColor: AppColors.primary,
                      icon: Icons.remove_red_eye_outlined,
                      onPressed: onViewDetails ?? () {},
                      fontSize: 12.sp,
                      borderRadius: 8.r,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Utils.primaryActionButton(
                      backgroundColor: AppColors.primary,
                      text: 'Hire',
                      elevation: 2,
                      textColor: AppColors.background,
                      iconColor: AppColors.background,
                      icon: Icons.person_add,
                      onPressed: onHire ?? () {},
                      fontSize: 12.sp,
                      borderRadius: 8.r,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
