import 'package:get/get.dart';

import '../controllers/job_payment_controller.dart';

class JobPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobPaymentController>(
      () => JobPaymentController(),
    );
  }
}
