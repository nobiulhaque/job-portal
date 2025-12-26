import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  final currentPage = 0.obs;

  final List<OnboardingData> pages = [
    OnboardingData(
      image: 'assets/images/onboarding1.png',
      icon: Icons.location_on,
      title: 'Find Local Jobs Near You',
      description:
          'Connect with employers in your area and discover opportunities that match your skills',
    ),
    OnboardingData(
      image: 'assets/images/onboarding2.png',
      icon: Icons.work,
      title: 'Get Hired Instantly',
      description:
          'Post jobs or apply for gigs in seconds. Real-time matching connects you with the right people',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    pageController.addListener(() {
      currentPage.value = pageController.page?.round() ?? 0;
    });
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void nextPage() {
    if (currentPage.value < pages.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Navigate to main app or login
      Get.offAllNamed('/account-type');
    }
  }
}

class OnboardingData {
  final String image;
  final IconData icon;
  final String title;
  final String description;

  OnboardingData({
    required this.image,
    required this.icon,
    required this.title,
    required this.description,
  });
}
