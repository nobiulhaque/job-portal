import 'package:get/get.dart';

import '../controllers/workernotification_controller.dart';

class WorkernotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkernotificationController>(
      () => WorkernotificationController(),
    );
  }
}
