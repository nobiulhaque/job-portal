import 'package:ellidobra_job_portal_app/app/modules/AccountType/controllers/account_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../routes/app_pages.dart';

class AccountTypeView extends GetView<AccountTypeController> {
  const AccountTypeView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              const Text(
                'Continue as...',
                style: TextStyle(
                  color: Color(0xFF071727),
                  fontSize: 32,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Select your account type',
                style: TextStyle(
                  color: Color(0x99071727),
                  fontSize: 18,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 48),
              _buildAccountTypeCard(
                imagePath: 'assets/images/emoloyee.png',
                title: 'Employer',
                subtitle: 'Post jobs and hire talent',
                color: const Color(0xFFFFE5E5),
                onTap: () {
                  controller.userRole.value = 'Employer';
                  debugPrint('User Role: ${controller.userRole.value}');
                  Get.offAllNamed(Routes.AUTH_VIEW);

                },
              ),
              const SizedBox(height: 24),
              _buildAccountTypeCard(
                imagePath: 'assets/images/bulding.png',
                title: 'Worker',
                subtitle: 'Find gigs and get hired',
                color: const Color(0xFFFFE5E5),
                onTap: () {
                  controller.userRole.value = 'Worker';
                  debugPrint('User Role: ${controller.userRole.value}');
                 Get.offAllNamed(Routes.AUTH_VIEW);

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountTypeCard({
    required String imagePath,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              color: Color(0xFFE8ECF0),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF071727),
                      fontSize: 24,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Color(0xBF071727),
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}