import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Notifications/controllers/notifications_controller.dart';
import '../../../Notifications/views/notifications_view.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsController(), permanent: false);
    return Container(
        color: Colors.white,
        child: NotificationsView());
  }
}
