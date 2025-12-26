import 'package:get/get.dart';

import '../controllers/worker_message_screen_controller.dart';

class WorkerMessageScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkerMessageScreenController>(
      () => WorkerMessageScreenController(),
    );
  }
}
