import 'package:get/get.dart';

class JobsController extends GetxController {
  final currentTab = 0.obs;
  final tabs = ['Job List', 'Bids', 'Hired', 'Worker'];

  void selectTab(int index) => currentTab.value = index;



}
