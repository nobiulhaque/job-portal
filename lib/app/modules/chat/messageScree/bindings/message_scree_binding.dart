import 'package:get/get.dart';

import '../controllers/message_scree_controller.dart';

class MessageScreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageScreeController>(
      () => MessageScreeController(),
    );
  }
}
