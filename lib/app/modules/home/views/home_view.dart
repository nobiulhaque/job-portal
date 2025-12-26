import 'package:ellidobra_job_portal_app/core/theme/app_colors.dart';
import 'package:ellidobra_job_portal_app/core/utils/utils.dart' ;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../profile/employeeprofile/views/employeeprofile_view.dart';
import 'tabs/home_tab.dart';
import 'tabs/search_tab.dart';
import 'tabs/messages_tab.dart';
import 'tabs/notification_tab.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Obx(() => _buildAppBar(context)),
      ),
      body: Obx(() {
        switch (controller.selectedIndex.value) {
          case 0:
            return HomeTab();
          case 1:
            return SearchTab();
          case 2:
            return MessagesTab();
          case 3:
            return NotificationTab();
          default:
            return HomeTab();
        }
      }),
      bottomNavigationBar: Obx(
        () => Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 16.w,right: 16.w, bottom: 20.h,top: 8.h),
            child: GNav(
              selectedIndex: controller.selectedIndex.value,
              onTabChange: (index) {
                controller.selectedIndex.value = index;
              },
              backgroundColor: Colors.white,
              color: AppColors.backgroundDark,
              activeColor: AppColors.backgroundDark,
              tabBackgroundColor: AppColors.backgroundDark.withAlpha(25),
              padding: EdgeInsets.all(10),
              gap: 8,
              tabs: [
                GButton(icon: Icons.dashboard, text: 'Home', iconSize: 24.sp),
                GButton(
                  icon: Icons
                      .search_outlined, // Required, but can use a blank icon
                  text: 'Job',
                  iconSize: 0, // Hide the default icon
                  leading: Image.asset(
                    'assets/icon/Compass.png',
                    width: 24.sp,
                    height: 24.sp,
                  ),
                ),
                GButton(
                  icon: Icons.message_outlined,
                  text: 'Messages',
                  iconSize: 24.sp,
                ),
                GButton(
                  icon: Icons.notifications_outlined,
                  text: 'Activity',
                  iconSize: 24.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    final titles = [
      'Here\'s what\'s happening with your Job',
      'Search Jobs',
      'Inbox',
      'Activity',
    ];

    bool isActivityTab = controller.selectedIndex.value == 3;

    if (isActivityTab) {
      return AppBar(
        backgroundColor: AppColors.backgroundDark,
        elevation: 0,
        title: Text(
          titles[controller.selectedIndex.value],
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: const Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    Icons.notifications_outlined,
                    color: AppColors.background,
                    size: 30.sp,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.all(4.sp),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3',
                      style: TextStyle(
                        color: AppColors.background,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    } else {
      return Utils.customAppBar(
        title: titles[controller.selectedIndex.value],
        profileImagePath: 'assets/images/profile.png',
        backgroundColor: AppColors.backgroundDark,
        onProfileTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmployeeprofileView()),
          );
        },
      );
    }
  }
}
