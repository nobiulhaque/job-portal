import 'package:get/get.dart';

import '../controllers/editworker_profile_controller.dart';

class EditworkerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditworkerProfileController>(
      () => EditworkerProfileController(),
    );
  }
}
