import 'package:get/get.dart';

class JobOnboardingController extends GetxController {
  final currentPage = 0.obs;
  final totalPages = 3;

  final List<List<String>> pageItems = [
    [
      'Be specific about your requirements',
      'Add photos for better bids',
      'Set a realistic budget range',
    ],
    [
      'Track progress in real-time',
      'Release payment when satisfied',
      'Leave a review to help others',
    ],
    [
      'Post projects in minutes with AI help',
      'Get bids from verified contractors',
      'Pay securely with escrow protection',
    ],
  ];

  List<String> get currentPageItems => pageItems[currentPage.value];

  String get currentTitle {
    if (currentPage.value == 2) {
      return 'Welcome to HireDun!';
    }
    return 'Post Your First Job';
  }

  String get currentSubtitle {
    if (currentPage.value == 2) {
      return "Let's get you started in 30 seconds";
    }
    return 'Describe what you need done and let AI\nenhance it.';
  }

  String get buttonText {
    if (currentPage.value == 2) {
      return "Let's Go!";
    }
    return 'Next';
  }

  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      currentPage.value++;
    } else {
      Get.toNamed('/job-post');
    }
  }

  void skip() {
    Get.toNamed('/job-post');
  }
}
