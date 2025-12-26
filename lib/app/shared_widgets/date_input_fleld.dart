import 'package:ellidobra_job_portal_app/core/constants/app_radius.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class DateInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final VoidCallback onTap;

  const DateInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryDark
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          readOnly: true,
          onTap: onTap,
          decoration: InputDecoration(
            hintText: "Enter Date",
            suffixIcon: const Icon(Icons.calendar_today),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppRadius.radius8,
              borderSide: BorderSide(color: AppColors.softBlue)
            ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: AppRadius.radius8,
                  borderSide: BorderSide(color: AppColors.softBlue)
              )
          ),
        ),
      ],
    );
  }



}
