import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkerHomeController extends GetxController {
  final selectedIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: 0);
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
