import 'package:ellidobra_job_portal_app/app/modules/home/controllers/home_controller.dart';
import 'package:ellidobra_job_portal_app/app/routes/app_pages.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:ellidobra_job_portal_app/app/shared_widgets/job_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../widgets/post_job_card.dart';
import '../widgets/stat_grid.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: AppColors.backgroundDark),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 12.h),
            child: Utils.searchBar(
              hintText: 'Search jobs...',
              fillColor: Colors.white.withAlpha(25),
              borderRadius: 30,
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(color: AppColors.backgroundDark),
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.w,right: 16.r, bottom: 14.h),
                      child: StatsGrid(),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  // Bottom Section with White Background
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.r),
                        topRight: Radius.circular(24.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(24.w),
                      child: PostJobCard(),
                    ),
                  ),


                  // Obx(() {
                  //   if (controller.isGetJobsLoading.value) {
                  //     return const Center(child: CircularProgressIndicator());
                  //   }
                  //
                  //   if (controller.errorMessage.value.isNotEmpty) {
                  //     return Center(
                  //       child: Text(
                  //         controller.errorMessage.value,
                  //         style: const TextStyle(color: Colors.red, fontSize: 16),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     );
                  //   }
                  //
                  //   if (controller.jobs.isEmpty) {
                  //     return const Center(
                  //       child: Text(
                  //         'No jobs available at the moment',
                  //         style: TextStyle(fontSize: 18, color: Colors.grey),
                  //       ),
                  //     );
                  //   }
                  //
                  //   return Column(
                  //     children: List.generate(controller.jobs.length, (index) {
                  //       final job = controller.jobs[index];
                  //
                  //       return JobCard(
                  //         name: job.poster.name,
                  //         title: job.title,
                  //         location: job.address,
                  //         jobType: job.jobType.replaceAll('_', ' '), // e.g., PART_TIME → Part Time
                  //         description: job.description,
                  //         profileImage: null, // You can add poster profile image later if available
                  //         onViewProfile: () {
                  //           // Navigate to employer profile or show details
                  //           Get.snackbar('View Profile', 'Tapped on ${job.poster.name}');
                  //         },
                  //         onMessage: () {
                  //           // Open chat/message screen
                  //           Get.snackbar('Message', 'Messaging ${job.poster.name}');
                  //         },
                  //         onHire: () {
                  //           // Apply or hire logic
                  //           Get.snackbar('Apply', 'Applying for "${job.title}"');
                  //         },
                  //       );
                  //     }),
                  //   );
                  // }),


                  Obx(() {
                    if (controller.isGetJobsLoading.value) {
                      return Skeletonizer(
                        enabled: true,
                        child: Column(
                          children: List.generate(
                            controller.jobs.length, // show 5 placeholder cards while loading
                                (index) => JobCard(
                              name: 'Loading Name...',
                              title: 'Loading Title...',
                              location: 'Loading Location...',
                              jobType: 'Loading Type...',
                              description:
                              'Loading description... Lorem ipsum dolor sit amet...',
                              profileImage: 'assets/images/profile.png', // or null
                              onViewProfile: () {},
                              onMessage: () {},
                              onHire: () {},
                            ),
                          ),
                        ),
                      );
                    }

                    if (controller.errorMessage.value.isNotEmpty) {
                      return Center(
                        child: Text(
                          controller.errorMessage.value,
                          style: const TextStyle(color: Colors.red, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      );
                    }

                    if (controller.jobs.isEmpty) {
                      return const Center(
                        child: Text(
                          'No jobs available at the moment',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      );
                    }

                    // Real data
                    return Column(
                      spacing: 16.h,
                      children: List.generate(controller.jobs.length, (index) {
                        final job = controller.jobs[index];

                        return JobCard(
                          name: job.poster.name,
                          title: job.title,
                          location: job.address,
                          jobType: job.jobType
                              .split('_')
                              .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
                              .join(' '),
                          description: job.description,
                          profileImage: null, // update if you have profile image URL
                          onViewProfile: () {
                            Get.snackbar('Profile', 'View profile of ${job.poster.name}');
                          },
                          onMessage: () {
                            Get.snackbar('Message', 'Message ${job.poster.name}');
                          },
                          onHire: () {
                            Get.snackbar('Hire', 'Applying for "${job.title}"');
                          },
                        );
                      }),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}






