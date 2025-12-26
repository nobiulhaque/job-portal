import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../notifications/Workernotification/views/workernotification_view.dart';


class WorkerNotificationTab extends StatelessWidget {
  const WorkerNotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(workernotification_controller(), permanent: false);
    return WorkernotificationView();
  }
}
