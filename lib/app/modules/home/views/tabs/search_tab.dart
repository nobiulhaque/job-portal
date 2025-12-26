import 'package:ellidobra_job_portal_app/app/modules/jobs_search/controllers/jobs_controller.dart';
import 'package:ellidobra_job_portal_app/app/modules/jobs_search/views/jobs_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(JobsController(), permanent: false);
    return JobsView();
  }
}
