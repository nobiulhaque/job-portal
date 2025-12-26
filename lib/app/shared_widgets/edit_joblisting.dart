import 'package:ellidobra_job_portal_app/app/modules/job_post/controllers/job_post_controller.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EditJoblisting extends StatelessWidget {
  const EditJoblisting({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<JobPostController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Job Listing',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Padding(
                padding: EdgeInsets.all(15.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    Utils.primaryTextFieldLabel(
                      label: 'Job Location *',
                      placeholder: 'Enter Job Location',
                    ),
                    SizedBox(height: 16.h),
                    Utils.primaryDropdown(
                      label: 'Job Category *',
                      hint: 'Select Category',
                      items: controller.jobCategories,
                      onChanged: (value) {
                        controller.selectedCategory.value = value;
                      },
                    ),
                    SizedBox(height: 16.h),
                    Utils.primaryDropdown(
                      label: 'Job Type *',
                      hint: 'Select Job Type',
                      items: controller.jobTypes,
                      onChanged: (value) {
                        controller.selectedJobType.value = value;
                      },
                    ),
                    SizedBox(height: 16.h),
                    Utils.primaryTextFieldLabel(
                      label: 'Date',
                      placeholder: 'Enter Date',
                    ),
                    SizedBox(height: 16.h),
                    Utils.primaryTextFieldLabel(
                      label: 'Job Title *',
                      placeholder: 'Enter Job Title',
                    ),
                    SizedBox(height: 16.h),
                    Utils.primaryTextFieldLabel(
                      label: 'Job Description *',
                      placeholder: 'Enter Job Description',
                      maxLines: 5,
                    ),
                    SizedBox(height: 16.h),
                    Utils.fileUploadDottedBorder(
                      title: 'Upload Job Description File (Optional)',
                      label: 'Click or drag file to upload',
                      onTap: () {
                        // Handle file upload
                      },
                    ),
                    SizedBox(height: 24.h),
                    SizedBox(
                      width: double.infinity,
                      child: Utils.primaryActionButton(
                        text: 'Update Job Listing',
                        elevation: 2,
                        borderRadius: 10.r,
                        backgroundColor: AppColors.primary,
                        onPressed: () {
                          // Handle job posting
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
