import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../chat/chatscreen/controllers/chatscreen_controller.dart';
import '../../../chat/chatscreen/views/chatscreen_view.dart';

class MessagesTab extends StatelessWidget {
  const MessagesTab({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChatscreenController(), permanent: false);
    return Container(
        color: Colors.white,
        child: ChatscreenView());
  }
}
