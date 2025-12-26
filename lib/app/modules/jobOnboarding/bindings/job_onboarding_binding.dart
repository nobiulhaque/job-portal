import 'package:get/get.dart';

import '../controllers/job_onboarding_controller.dart';

class JobOnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobOnboardingController>(
      () => JobOnboardingController(),
    );
  }
}
