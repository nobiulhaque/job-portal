import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../chat/workerchatScreen/controllers/workerchat_screen_controller.dart';
import '../../../chat/workerchatScreen/views/workerchat_screen_view.dart';

class WorkerMessagesTab extends StatelessWidget {
  const WorkerMessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WorkerchatScreenController(), permanent: false);
    return WorkerchatScreenView();
  }
}
