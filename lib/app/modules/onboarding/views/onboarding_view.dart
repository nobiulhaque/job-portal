import 'package:ellidobra_job_portal_app/core/constants/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../shared_widgets/primary_action_button.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: controller.pages.length,
                itemBuilder: (context, index) {
                  final page = controller.pages[index];
                  return _OnboardingPage(
                    image: page.image,
                    icon: page.icon,
                    title: page.title,
                    description: page.description,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                children: [
                  // Page indicator
                  Obx(
                    () => _PageIndicator(
                      currentPage: controller.currentPage.value,
                      pageCount: controller.pages.length,
                    ),
                  ),

                  AppSpacing.vertical20,
                  // Next button
                  PrimaryActionButton(
                    text: 'Next',
                    icon: Icons.arrow_forward,
                    backgroundColor: AppColors.primary,
                    borderRadius: 20,
                    elevation: 0,
                    minimumSize: const Size(double.infinity, 56),
                    onPressed: controller.nextPage,
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

class _OnboardingPage extends StatelessWidget {
  final String image;
  final IconData icon;
  final String title;
  final String description;

  const _OnboardingPage({
    required this.image,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          // Image with icon badge
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              // Image container
              Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24.r),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              // Icon badge
              Positioned(
                bottom: -30,
                child: Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(icon, size: 32, color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextTheme.headlineLarge.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              height: 1.2,
            ),
          ),
          AppSpacing.horizontal16,
          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextTheme.bodyLarge.copyWith(
              fontSize: 18,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _PageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;

  const _PageIndicator({required this.currentPage, required this.pageCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageCount,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 32 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentPage == index
                ? AppColors.primary
                : AppColors.primary.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}
