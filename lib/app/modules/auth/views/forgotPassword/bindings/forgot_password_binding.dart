import 'package:ellidobra_job_portal_app/app/modules/AccountType/controllers/account_type_controller.dart';
import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
    Get.put(AccountTypeController());
  }
}
