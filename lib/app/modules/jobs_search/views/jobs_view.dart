import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/jobs_controller.dart';
import 'tabs/job_list_tab.dart';
import 'tabs/bids_tab.dart';
import 'tabs/hired_tab.dart';
import 'tabs/worker_tab.dart';

class JobsView extends GetView<JobsController> {
  const JobsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.backgroundDark),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),

                  //Title
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Find Your Workers',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'DM Sans',
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  //Search Bar
                  Utils.searchBar(
                    hintText: 'Search...',
                    fillColor: Colors.white.withAlpha(25),
                    borderRadius: 30,
                  ),
                  SizedBox(height: 10.h),

                  //Filter Tabs
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: List.generate(
                        controller.tabs.length,
                        (index) => Expanded(
                          child: GestureDetector(
                            onTap: () => controller.selectTab(index),
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(8),
                              decoration: ShapeDecoration(
                                color: controller.currentTab.value == index
                                    ? Colors.white.withValues(alpha: 0.05)
                                    : Colors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Text(
                                controller.tabs[index],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
          // Tab Content
          Expanded(
            child: Obx(() {
              if (controller.currentTab.value == 0) {
                return JobListTab();
              } else if (controller.currentTab.value == 1) {
                return BidsTab();
              } else if (controller.currentTab.value == 2) {
                return HiredTab();
              } else {
                return WorkerTab();
              }
            }),
          ),
        ],
      ),
    );
  }
}
