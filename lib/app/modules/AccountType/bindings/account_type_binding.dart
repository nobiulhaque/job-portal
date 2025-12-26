import 'package:ellidobra_job_portal_app/app/modules/AccountType/controllers/account_type_controller.dart';

import 'package:get/get.dart';

class AccountTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AccountTypeController>(
      AccountTypeController(),permanent: true
    );
  }
}
