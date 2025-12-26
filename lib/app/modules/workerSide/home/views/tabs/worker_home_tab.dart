import 'package:ellidobra_job_portal_app/app/modules/workerSide/review/views/review_with_profile.dart';
import 'package:ellidobra_job_portal_app/app/shared_widgets/bids_card.dart';
import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkerHomeTab extends StatelessWidget {
  const WorkerHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: AppColors.backgroundDark),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Utils.searchBar(
                    hintText: 'Search jobs...',
                    fillColor: Colors.white.withAlpha(25),
                    borderRadius: 30,
                  ),
                  SizedBox(height: 10.h),
                  _StatsGrid(),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.h),

          //Job Listings Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Recent Job Posts',
                      style: TextStyle(
                        color: AppColors.backgroundDark,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Icon(Icons.work, size: 20.w, color: AppColors.backgroundDark,),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                
                  ],
                ),
                
                SizedBox(height: 12.h),
                
                BidsCard(
                    profileImage: 'assets/images/profile.png',
                    workerName: 'Jonak',
                    title: 'Cleaning Expert',
                    location: 'New York, NY',
                    budget: '\$80 - \$350',
                    description:
                        'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
                    onViewDetails: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ReviewWithProfileProfileView(),
                        ),
                      );
                    },
                    onHire: () {},
                  ),
                  BidsCard(
                    profileImage: 'assets/images/profile.png',
                    workerName: 'Jonak',
                    title: 'Cleaning Expert',
                    location: 'New York, NY',
                    budget: '\$80 - \$350',
                    description:
                        'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
                    onViewDetails: () {},
                    onHire: () {},
                  ),
                  BidsCard(
                    profileImage: 'assets/images/profile.png',
                    workerName: 'Jonak',
                    title: 'Cleaning Expert',
                    location: 'New York, NY',
                    budget: '\$80 - \$350',
                    description:
                        'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
                    onViewDetails: () {},
                    onHire: () {},
                  ),
                  BidsCard(
                    profileImage: 'assets/images/profile.png',
                    workerName: 'Jonak',
                    title: 'Cleaning Expert',
                    location: 'New York, NY',
                    budget: '\$80 - \$350',
                    description:
                        'Looking for a reliable and experienced cleaner to maintain cleanliness and hygiene at my residential/commercial space more...',
                    onViewDetails: () {},
                    onHire: () {},
                  ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.folder_open,
                iconColor: const Color(0xFF3889CA),
                backgroundColor: const Color(0x4C3889CA),
                count: '0',
                label: 'Open Jobs',
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _StatCard(
                icon: Icons.work,
                iconColor: const Color(0xFFF6C10E),
                backgroundColor: const Color(0x4CF6C10E),
                count: '0',
                label: 'Total Jobs',
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _StatCard(
                icon: Icons.pie_chart,
                iconColor: const Color(0xFF9333EA),
                backgroundColor: const Color(0x4C9333EA),
                count: '0',
                label: 'In Progress',
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _StatCard(
                icon: Icons.check_circle,
                iconColor: const Color(0xFF16A34A),
                backgroundColor: const Color(0x4C16A34A),
                count: '0',
                label: 'Completed',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final String count;
  final String label;

  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.count,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(13),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(icon, color: iconColor, size: 22.w),
              ),
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(
                  color: Colors.white.withAlpha(153),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              count,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class _PostJobCard extends StatelessWidget {
//   const _PostJobCard();// class _PostJobCard extends StatelessWidget {
//   const _PostJobCard();

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 2,
//       borderRadius: BorderRadius.circular(14.r),
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(24.w),
//         decoration: ShapeDecoration(
//           color: Colors.white.withAlpha(13),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(14.r),
//           ),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: 50,
//               width: 50,
//               alignment: Alignment.center,
//               decoration: ShapeDecoration(
//                 color: const Color(0x4C3889CA),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//               ),
//               child: Icon(
//                 Icons.work_outline,
//                 color: Color(0xFF3889CA),
//                 size: 20,
//               ),
//             ),
//             SizedBox(height: 10.h),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Ready to post your Job',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: const Color(0xFF071727),
//                     fontSize: 22.sp,
//                     fontFamily: 'DM Sans',
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 SizedBox(height: 10.h),
//                 Text(
//                   'Describe what you need done and receive\nbids from qualified contractors in few minutes',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: const Color(0x99071727),
//                     fontSize: 13.sp,
//                     fontFamily: 'DM Sans',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10.h),
//             Utils.primaryActionButton(
//               text: 'Post a Job',
//               backgroundColor: AppColors.primary,
//               textColor: Colors.white,
//               icon: Icons.add,
//               borderRadius: 8.r,
//               onPressed: () {
//                 // Handle post job action
//                 Get.toNamed(Routes.JOB_ONBOARDING);
//                 // Get.toNamed('/job-post');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       elevation: 2,
//       borderRadius: BorderRadius.circular(14.r),
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.all(24.w),
//         decoration: ShapeDecoration(
//           color: Colors.white.withAlpha(13),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(14.r),
//           ),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               height: 50,
//               width: 50,
//               alignment: Alignment.center,
//               decoration: ShapeDecoration(
//                 color: const Color(0x4C3889CA),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8.r),
//                 ),
//               ),
//               child: Icon(
//                 Icons.work_outline,
//                 color: Color(0xFF3889CA),
//                 size: 20,
//               ),
//             ),
//             SizedBox(height: 10.h),
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Ready to post your Job',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: const Color(0xFF071727),
//                     fontSize: 22.sp,
//                     fontFamily: 'DM Sans',
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 SizedBox(height: 10.h),
//                 Text(
//                   'Describe what you need done and receive\nbids from qualified contractors in few minutes',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: const Color(0x99071727),
//                     fontSize: 13.sp,
//                     fontFamily: 'DM Sans',
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 10.h),
//             Utils.primaryActionButton(
//               text: 'Post a Job',
//               backgroundColor: AppColors.primary,
//               textColor: Colors.white,
//               icon: Icons.add,
//               borderRadius: 8.r,
//               onPressed: () {
//                 // Handle post job action
//                 Get.toNamed(Routes.JOB_ONBOARDING);
//                 // Get.toNamed('/job-post');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
