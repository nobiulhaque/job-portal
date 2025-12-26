import 'package:ellidobra_job_portal_app/app/shared_widgets/date_input_fleld.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../controllers/job_post_controller.dart';

class JobDetailsTab extends GetView<JobPostController> {
  const JobDetailsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Job Details',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: const Color(0xFFFF8007),
              fontSize: 16.sp,
              fontFamily: 'DM Sans',
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Utils.primaryTextFieldLabel(
          label: 'Job Location *',
          placeholder: 'Enter Job Location',
        ),
        SizedBox(height: 16.h),
        Utils.primaryDropdown(
          label: 'Job Category *',
          hint: 'Enter Job Category',
          items: controller.jobCategories,
          allowCustomInput: true,
          onChanged: (value) {
            controller.selectedCategory.value = value;
          },
          onItemAdded: (item) {
            controller.addJobCategory(item);
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
        DateInputField(
          label: 'Start Date',
          controller: controller.startDateController,
          onTap: () => pickDate(
            context: context,
            controller: controller.startDateController,
          ),
        ),
        SizedBox(height: 16.h),
        DateInputField(
          label: 'End Date',
          controller: controller.endDateController,
          onTap: () => pickDate(
            context: context,
            controller: controller.endDateController,
          ),
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
      ],
    );
  }

  /// Select Date & convert to UTC
  Future<void> pickDate({
    required BuildContext context,
    required TextEditingController controller,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate ?? DateTime(2000),
      lastDate: lastDate ?? DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.softBlue, // Header background & selected date
              onPrimary: Colors.white, // Text color on selected date
              onSurface: AppColors.softBlue, // Default text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryDark, // Buttons like CANCEL/OK
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat('d-M-yyyy').format(pickedDate);
      controller.text = formattedDate;
    }
  }


}
