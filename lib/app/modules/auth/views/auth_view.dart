import 'package:ellidobra_job_portal_app/app/modules/auth/views/login/views/login_view.dart';
import 'package:ellidobra_job_portal_app/app/modules/auth/views/signup/views/signup_view.dart';
import 'package:ellidobra_job_portal_app/app/modules/auth/views/widgets/auth_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';


class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 80.h),
          Align(
            alignment: AlignmentGeometry.center,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Obx(
                    () => AuthTabBar(
                  tabs: controller.authTabs,
                  selectedIndex: controller.selectedIndex.value,
                  onTabChanged: (value) {
                    controller.selectedIndex.value = value;
                  },
                ),
              ),
            ),
          ),
          Obx(
                () => Expanded(
              child: controller.selectedIndex.value == 0
                  ? LoginView()
                  : SignupView(),
            ),
          ),
        ],
      ),
    );
  }
}