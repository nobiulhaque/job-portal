import 'package:ellidobra_job_portal_app/app/modules/AccountType/controllers/account_type_controller.dart';
import 'package:ellidobra_job_portal_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../views/login/controllers/login_controller.dart';
import '../views/signup/controllers/signup_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
          () => AuthController(),
    );
    Get.lazyPut<LoginController>(
          () => LoginController(),
    );
    Get.lazyPut<SignupController>(
          () => SignupController(),
    );
    Get.put(AccountTypeController());
  }
}