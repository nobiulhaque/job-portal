import 'package:get/get.dart';

import '../controllers/workerchat_screen_controller.dart';

class WorkerchatScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkerchatScreenController>(
      () => WorkerchatScreenController(),
    );
  }
}
