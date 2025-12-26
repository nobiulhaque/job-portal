import 'package:get/get.dart';

import '../controllers/employeeprofile_controller.dart';

class EmployeeprofileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeprofileController>(
      () => EmployeeprofileController(),
    );
  }
}
